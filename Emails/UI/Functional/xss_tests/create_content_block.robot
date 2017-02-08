*** Settings ***
Documentation     will check the input of each of the blns values into the Content Block screen
Suite Setup       Run Keywords    Login
...               AND    Go To ${system_page["email"]}
Suite Teardown    Close All Browsers
Resource          ../../Utils/keywords.robot
Resource          ../../Utils/xss_keywords.robot

*** Test Cases ***
Name
    # Grab id of latest content block
    Open Content    ${content_block}    ${content_block["button_list"]["list"]}
    ${latest_content_block_id}=    Get Text    ${content_block["button_list"]["first_block_id"]}

    # attempt to create a content block
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${content_block}    ${content_block["button_add"]["add"]}
    \    Wait Until Element Is Visible    name=name    timeout=30
    \    Input Text    name=name    ${line}
    \    Click Element    ${generics['save']}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=xss verification failed, check the logs folder for data

    # Check no new content blocks were created
    Open Content    ${content_block}    ${content_block["button_list"]["list"]}
    ${post_test_content_block_id}=    Get Text    ${content_block["button_list"]["first_block_id"]}
    Run Keyword If    ${post_test_content_block_id} != ${latest_content_block_id}    Fail    msg=New Content Blocks were created with XSS data

Description
    # Grab id of latest content block
    Open Content    ${content_block}    ${content_block["button_list"]["list"]}
    ${latest_content_block_id}=    Get Text    ${content_block["button_list"]["first_block_id"]}

    # attempt to create a content block
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${content_block}    ${content_block["button_add"]["add"]}
    \    Wait Until Element Is Visible    name=name    timeout=30
    \    Input Text    name=name    Name
    \    Input Text    name=description    ${line}
    \    Click Element    ${generics['save']}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=xss verification failed, check the logs folder for data

    # Check no new content blocks were created
    Open Content    ${content_block}    ${content_block["button_list"]["list"]}
    ${post_test_content_block_id}=    Get Text    ${content_block["button_list"]["first_block_id"]}
    Run Keyword If    ${post_test_content_block_id} != ${latest_content_block_id}    Fail    msg=New Content Blocks were created with XSS data

Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${content_block}    ${content_block["button_list"]["list"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=xss verification failed, check the logs folder for data
