*** Settings ***
Documentation       contains keywords specific to xss testing
Variables           Resources/xss_test_data.py

*** Keywords ***
check for bad request
    [Arguments]    ${input}    @{failed_inputs}
    ${test_passed}=    set variable    False

    # if error is alert
    ${status}    ${alert_message}=    run keyword and ignore error    get alert message
    @{alert_messages}=    create list    bad request    error 200 requesting page
    :for    ${message}    in    @{alert_messages}
    \    exit for loop if    '${status}' == 'FAIL'
    \    ${test_passed}=    run keyword and return status    should contain    ${alert_message}    ${message}    ignore_case=True
    \    return from keyword if    ${test_passed}

    # if error is notification
    ${status}    ${notification_message}=    run keyword and ignore error    get text    //*[@class='text ng-binding' or contains(@class, 'notification-icon')]
    @{notification_messages}=    create list    failed to save.    bad request
    :for    ${message}    in    @{notification_messages}
    \    exit for loop if    '${status}' == 'FAIL'
    \    ${test_passed}=    run keyword and return status    should contain    ${notification_message}    ${message}    ignore_case=True
    \    return from keyword if    ${test_passed}

    # if error is page
    @{error_messages}=    create list    Bad Request    Bad request
    :for    ${message}    in    @{error_messages}
    \    ${test_passed}=    run keyword and return status    current frame contains    ${message}
    \    return from keyword if    ${test_passed}

    run keyword unless    ${test_passed}    append to list    @{failed_inputs}    ${input}

write failed input to file
    [Arguments]    ${test_suite_name}    ${test_case_name}    @{failed_inputs}
    set test variable    ${is_failed}    False
    run keyword if    len(@{failed_inputs}) > 0
    ...    run keywords
    ...    append to file    ${EXECDIR}/Emails/logs/error_Log_${test_suite_name}.txt    ${test_case_name}${\n}--------------------------------${\n}
    ...    AND    write data    ${test_suite_name}    @{failed_inputs}
    ...    AND    set test variable   ${is_failed}    True

write data
    [Arguments]    ${test_suite_name}    @{failed_inputs}
    :for    ${item}    in    @{failed_inputs}
    \    append to file    ${EXECDIR}/Emails/logs/error_Log_${test_suite_name}.txt    ${item}${\n}
    append to file    ${EXECDIR}/Emails/logs/error_Log_${test_suite_name}.txt    ${\n}--------------------------------${\n}

create email string
    [Arguments]    ${line}
    ${line}=    catenate    SEPARATOR=    ${line}    @test.com
    set test variable    ${line}

create url string
    [Arguments]    ${line}
    ${line}=    catenate    SEPARATOR=    http://www.    ${line}    .com
    set test variable    ${line}

verify xss data on search field
    [Arguments]    ${content_dictionary}      ${page}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${content_dictionary}    ${page}
    \    wait until keyword succeeds    15x    1 sec    input text    ${generics["search_input"]}    ${line}
    \    sleep    0.5
    \    wait until keyword succeeds    15x    1 sec    click element    ${generics["search_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

content upload xss insertion
    [Arguments]    ${line}
    click element    ${generics["content_upload"]["link"]}
    select frame     ${iframes["popup"]}
    select radio button     uploadType    url
    create url string     ${line}
    input text      ${generics["content_upload"]["popup_url_input"]}      ${line}
    click element      ${generics["content_upload"]["popup_file_btn"]}
    dismiss alert

link management xss insertion
    [Arguments]    ${link_type}     ${field}    ${line}   ${save_option}
    click element    ${generics["link_management"]["link"]}
    select frame     ${iframes["popup"]}
    click element     ${link_type}
    input text    ${generics["link_management"]["link_type_name"]}    Name        # gets over-written if the field being tested is name itself!!
    ${is_url}=    run keyword and return status    should contain     ${field}    URL
    run keyword if     ${is_url}    create url string     ${line}
    input text    ${field}    ${line}
    click element      ${save_option}

check if changes made to editor
    [Arguments]    ${text}     ${TEST_NAME}    ${field}     ${line}
    click element      ${generics["close_popup_box"]
    unselect frame
    select frame      ${iframes["top"]}
    select frame      ${iframes["ccmd"]}
    current frame contains      ${text}
    write failed input to file      ${TEST_NAME}    ${field}     ${line}