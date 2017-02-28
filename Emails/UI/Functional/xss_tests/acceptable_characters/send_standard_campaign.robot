*** Settings ***
Documentation       will check the input of unicode values into the send standard campaign search screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
standard_campaign_search
    verify non xss data on search field    ${standard_campaign}    ${standard_campaign["button_list"]["list"]}

standard_campaign_rename_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${standard_campaign}    ${standard_campaign["button_list"]["list"]}
    \    click element    ${standard_campaign["button_list"]['copy']}
    \    input text    ${standard_campaign["button_list"]["rename_input"]}    ${line}
    \    click element    ${generics["save"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
