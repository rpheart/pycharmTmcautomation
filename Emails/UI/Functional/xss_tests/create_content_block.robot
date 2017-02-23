*** Settings ***
Documentation       will check the input of each of the blns values into the Content Block screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
content_block_name
    # Grab id of latest content block
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    wait until element is visible    ${content_block["button_list"]["first_block_id"]}
    ${latest_content_block_id}=    get text    ${content_block["button_list"]["first_block_id"]}

    # Check xss data on content block field name
    loop through test data    ${content_block["button_add"]["name"]}

    # Check no new content blocks were created
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    wait until element is visible    ${content_block["button_list"]["first_block_id"]}
    ${post_test_content_block_id}=    get text    ${content_block["button_list"]["first_block_id"]}
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_content_block_id}    ${latest_content_block_id}
    run keyword unless    ${is_equal}    fail    msg=New Content Blocks were created with XSS data

content_block_description
    # Grab id of latest content block
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    wait until element is visible    ${content_block["button_list"]["first_block_id"]}
    ${latest_content_block_id}=    get text    ${content_block["button_list"]["first_block_id"]}

    # Check xss data on content block field description
    loop through test data    ${content_block["button_add"]["description"]}

    # Check no new content blocks were created
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    wait until element is visible    ${content_block["button_list"]["first_block_id"]}
    ${post_test_content_block_id}=    get text    ${content_block["button_list"]["first_block_id"]}
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_content_block_id}    ${latest_content_block_id}
    run keyword unless    ${is_equal}    fail    msg=New Content Blocks were created with XSS data

content_block_search
    verify xss data on search field    ${content_block}    ${content_block["button_list"]["list"]}

content_block_rename_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${content_block}    ${content_block["button_list"]["list"]}
    \    click element    ${content_block["button_list"]['first_row']}
    \    click element    ${content_block["button_list"]['copy']}
    \    input text    ${content_block["button_list"]["rename_input"]}    ${line}
    \    click element    ${content_block["button_list"]["duplicate"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${content_block}    ${content_block["button_add"]["add"]}
    \    wait until element is visible    ${field}
    \    input text    ${content_block["button_add"]["name"]}    Name
    \    input text    ${field}    ${line}
    \    click element    ${generics['save']}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
