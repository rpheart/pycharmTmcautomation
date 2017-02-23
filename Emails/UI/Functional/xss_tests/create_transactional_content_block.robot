*** Settings ***
Documentation       will check the input of each of the blns values into the transactional content block screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        email    ui    xss
Suite Setup         run keywords    login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
transactional_content_block_name
    # Get first item of transactional content block table
    open content    ${transactional_content_block}    ${transactional_content_block["button_list"]["list"]}
    ${most_recent_content_block_id}=    get table cell    ${transactional_content_block["button_list"]["table"]}    3    1

    # Check xss data in transactional content block creator
    loop through test data    ${transactional_content_block["button_add"]["content_block_name_input"]}

    # Check no new content blocks were created
    open content    ${transactional_content_block}    ${transactional_content_block["button_list"]["list"]}
    ${post_test_content_block_id}=    get table cell    ${transactional_content_block["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_content_block_id}    ${most_recent_content_block_id}
    run keyword unless    ${is_equal}    fail    msg=New Content Blocks were created with XSS data

transactional_content_block_description
    # Get first item of transactional content block table
    open content    ${transactional_content_block}    ${transactional_content_block["button_list"]["list"]}
    ${most_recent_content_block_id}=    get table cell    ${transactional_content_block["button_list"]["table"]}    3    1

    # Check xss data in transactional content block creator
    loop through test data    ${transactional_content_block["button_add"]["content_block_description_input"]}

    # Check no new content blocks were created
    open content    ${transactional_content_block}    ${transactional_content_block["button_list"]["list"]}
    ${post_test_content_block_id}=    get table cell    ${transactional_content_block["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_content_block_id}    ${most_recent_content_block_id}
    run keyword unless    ${is_equal}    fail    msg=New Content Blocks were created with XSS data

transactional_content_block_rename_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${transactional_content_block}    ${transactional_content_block["button_list"]["list"]}
    \    click element    ${generics['copy']}
    \    input text    ${transactional_content_block["button_add"]["content_block_rename_input"]}    ${line}
    \    click element    ${generics['save']}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${transactional_content_block}    ${transactional_content_block["button_add"]["add"]}
    \    wait until element is visible    ${field}
    \    input text    ${transactional_content_block["button_add"]["content_block_name_input"]}    Name
    \    input text    ${field}    ${line}
    \    click element    ${generics['save']}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
