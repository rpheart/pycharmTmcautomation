*** Settings ***
Documentation       will check the input of unicode values into the transactional message reports screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
transactional_message_reports_email
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${transactional_reports}    ${transactional_reports["button_add"]["add"]}
    \    wait until element is visible    ${transactional_reports["button_add"]["custom_search"]}
    \    click element    ${transactional_reports["button_add"]["custom_search"]}
    \    create email string    ${line}
    \    input text    ${transactional_reports["button_add"]["email"]}    ${line}
    \    click element    ${generics["ok_button"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
