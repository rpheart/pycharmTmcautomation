*** Settings ***
Documentation       will check the input of each of the blns values into the transactional content block screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
Suite Teardown      Close All Browsers

*** Test Cases ***
Transactional_Content_Block
    # Get first item of transactional content block table
    Open Content    ${transactional_content_block}    ${transactional_content_block["button_list"]["list"]}
    ${most_recent_content_block_id}=    Get Table Cell    ${transactional_content_block["button_list"]["table"]}    3    1

    # Check xss data in transactional content block creator
    @{input_fields}=    Create List    ${transactional_content_block["button_add"]["customer_name"]}    ${transactional_content_block["button_add"]["customer_description"]}
    :FOR    ${field}    In    @{input_fields}
    \    Loop Through Test Data    ${field}
    \    Write Failed Input To File    ${TEST_NAME}    ${field}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification

    # Check no new content blocks were created
    Open Content    ${transactional_content_block}    ${transactional_content_block["button_list"]["list"]}
    ${post_test_content_block_id}=    Get Table Cell    ${transactional_content_block["button_list"]["table"]}    3    1
    Run Keyword If    ${post_test_content_block_id} != ${most_recent_content_block_id}    Fail    msg=New Content Blocks were created with XSS data

*** Keywords ***
Loop_Through_Test_Data
    [Arguments]    ${field}
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${transactional_content_block}    ${transactional_content_block["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${transactional_content_block["button_add"]["customer_name"]}    timeout=30
    \    Input Text    ${transactional_content_block["button_add"]["customer_name"]}    Name
    \    Input Text    ${field}    ${line}
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    \    Run Keyword And Ignore Error    Dismiss Alert
    Set Test Variable    @{failed_inputs}
