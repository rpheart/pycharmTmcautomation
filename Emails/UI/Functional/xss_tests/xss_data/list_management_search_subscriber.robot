*** Settings ***
Documentation       will check the input of each of the blns values into the search subscriber screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
search_subscriber
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    \    wait until element is visible    name=textFieldCombo
    \    select from list    name=textFieldCombo    EMAIL
    \    select from list    name=textFieldOperator    equals
    \    input text    name=textFieldValue    ${line}
    \    click element    xpath=//img[@id="iconAddCriteria"]
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
