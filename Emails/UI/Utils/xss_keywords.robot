*** Settings ***
Documentation       contains keywords specific to xss testing
Variables           Resources/xss_test_data.py

*** Variables ***

*** Keywords ***
store alert message
    ${alert_message}=    get alert message
    set test variable    ${alert_message}

check for bad request
    [Arguments]    ${input}    @{failed_inputs}
    ${test}=    set variable    False
    run keyword and ignore error    store alert message

    # Check for error as popup
    @{alert_messages}=    create list    -    Error 200 requesting page
    :for    ${message}    in    @{alert_messages}
    \    exit for loop if    ${test}
    \    ${test}=    Run Keyword And Return Status    Should Contain    ${alert_message}    ${message}

    # Check for error as page
    @{error_messages}=    create list    Bad Request!!!    save split run error :
    :for    ${message}    in    @{error_messages}
    \    exit for loop if    ${test}
    \    ${test}=    run keyword and return status    current frame contains    ${message}

    run keyword if    ${test} == False    append to list    @{failed_inputs}    ${input}

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