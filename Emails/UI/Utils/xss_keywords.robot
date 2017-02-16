*** Settings ***
Documentation       contains keywords specific to xss testing
Variables           Resources/xss_test_data.py

*** Keywords ***
check for bad request
    [Arguments]    ${input}    @{failed_inputs}
    ${test_passed}=    set variable    False

    # if error is alert
    ${alert_message}=    run keyword and ignore error    get alert message
    @{alert_messages}=    create list    bad request    error 200 requesting page
    :for    ${message}    in    @{alert_messages}
    \    ${test_passed}=    run keyword and return status    should contain    ${alert_message}[1]    ${message}    ignore_case=True
    \    return from keyword if    ${test_passed}

    # if error is notification
    ${is_notification}=    run keyword and return status    element should be visible    //div[contains(@id, 'notification-message')]
    ${notification_message}=    run keyword if    ${is_notification}    get text    //div[contains(@id, 'notification-message')]/div/div/div[2]
    @{notification_messages}=    create list    failed to save.    bad request
    :for    ${message}    in    @{notification_messages}
    \    ${test_passed}=    run keyword and return status    should contain    ${notification_message}    ${message}    ignore_case=True
    \    return from keyword if    ${test_passed}

    # if error is page
    @{error_messages}=    create list    Bad Request    Bad request    save split run error :
    :for    ${message}    in    @{error_messages}
    \    ${test_passed}=    run keyword and return status    current frame contains    ${message}
    \    return from keyword if    ${test_passed}

    run keyword unless    ${test_passed}    append to list    @{failed_inputs}    ${input}

write failed input to file
    [Arguments]    ${test_suite_name}    ${test_case_name}    @{failed_inputs}
    set test variable    ${is_failed}    False
    run keyword if    len(@{failed_inputs}) == 0
    ...    log    No Errors
    ...    ELSE
    ...    run keywords
    ...    append to file    ${EXECDIR}/Emails/logs/error_Log_${test_suite_name}.txt    ${test_case_name}${\n}--------------------------------${\n}
    ...    AND    write data    ${test_suite_name}    @{failed_inputs}
    ...    AND    set test variable    ${is_failed}    True

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
    \    wait until keyword succeeds    30x    1 sec    input text    ${generics["search_input"]}    ${line}
    \    wait until keyword succeeds    30x    1 sec    click element    ${generics["search_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
