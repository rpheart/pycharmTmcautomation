*** Settings ***
Documentation       will check the input of each of the blns values into the create new message builder search screen
Resource            ../../../Utils/email_keywords.robot
Resource            ../../../Utils/new_message_builder.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
...                 AND    set selenium speed    0.4
Suite Teardown      close all browsers

*** Test Cases ***
new_message_send_test_search_recipients
    loop through test data and send test email    ${new_message_builder["button_add"]["send_test_search_button"]}

*** Keywords ***
loop through test data and send test email
    [Arguments]    ${button}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    create email string    ${line}
    \    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    \    add widget to canvas    ${new_message_builder["button_add"]["text_widget"]}
    \    sleep    1
    \    set mandatory headers
    \    wait until keyword succeeds    5x   1 sec    click element    ${new_message_builder["button_add"]["save"]}
    \    open tests
    \    wait until keyword succeeds    5x   1 sec    input text     ${new_message_builder["button_add"]["send_test_search_input"]}    ${line}
    \    wait until keyword succeeds    5x   1 sec    click element    ${button}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

open tests
    :for    ${n}    in range    5
    \    ${tests_open}=    run keyword and return status    click element    ${new_message_builder["button_add"]["send_test_emails"]}
    \    exit for loop if    ${tests_open}
    \    wait until keyword succeeds    5x   1 sec    click element    ${new_message_builder["button_add"]["tests"]}
    \    sleep    1
