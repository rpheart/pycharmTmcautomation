*** Settings ***
Documentation       will check the input of each of the blns values into the send standard campaign search screen
Resource            ../../../Utils/email_keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
standard_campaign_search
    verify xss data on search field    ${standard_campaign}    ${standard_campaign["button_list"]["list"]}

standard_campaign_rename_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${standard_campaign}    ${standard_campaign["button_list"]["list"]}
    \    click element    ${standard_campaign["button_list"]['copy']}
    \    input text    ${standard_campaign["button_list"]["rename_input"]}    ${line}
    \    click element    ${generics["save"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
