*** Settings ***
Documentation       will check the input of each of the blns values into the Content Block screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
content_block_search
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${content_block}    ${content_block["button_list"]["list"]}
    \    wait until keyword succeeds    5x    1 sec    input text    ${generics["search_input"]}    ${line}
    \    sleep    0.5
    \    wait until keyword succeeds    5x    1 sec    click element    ${generics["search_button"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
