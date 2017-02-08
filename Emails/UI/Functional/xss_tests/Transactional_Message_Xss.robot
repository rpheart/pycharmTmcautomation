*** Settings ***
Documentation       will check the input of each of the blns values into the transactional message screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
#Suite Teardown      Close All Browsers

*** Test Cases ***
Transactional_Message
    # Get first item of transactional message table
    Open Content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${most_recent_message_id}=    Get Table Cell    ${transactional_message["button_list"]["table"]}    3    1

    # Check xss data in transactional message creator
    @{input_fields}=    Create List    ${transactional_message["button_add"]["name"]}    #${transactional_message["button_add"]["description"]}    ${transactional_message["button_add"]["message_from"]}    ${transactional_message["button_add"]["message_to"]}    ${transactional_message["button_add"]["message_subject"]}    ${transactional_message["button_add"]["message_reply_to_emails"]}    ${transactional_message["button_add"]["message_reply_to"]}
    :FOR    ${field}    In    @{input_fields}
    \    Loop Through Test Data    ${field}
    \    Write Failed Input To File    ${TEST_NAME}    ${field}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification

    # Check no new message was created
    Open Content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${post_test_message_id}=    Get Table Cell    ${transactional_message["button_list"]["table"]}    3    1
    Run Keyword If    ${post_test_message_id} != ${most_recent_message_id}    Fail    msg=New messages were created with XSS data

Transactional_Message_Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification

*** Keywords ***
Create Email String
    [Arguments]    ${line}
    ${line}=    Catenate    SEPARATOR=    ${line}    @test.com
    Set Test Variable    ${line}

Loop_Through_Test_Data
    [Arguments]    ${field}
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${transactional_message}    ${transactional_message["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${transactional_message["button_add"]["message_reply_to_emails"]}    timeout=30
    \    Input Text    ${transactional_message["button_add"]["message_reply_to_emails"]}    test@test.com
    \    ${is_email}=    Run Keyword And Return Status    Should Contain    ${field}    ReplyToEmail
    \    Run Keyword If    ${is_email}    Run Keywords    Create Email String    ${line}
    \    ...    AND    Input Text    ${field}    ${line}
    \    ...    ELSE    Input Text    ${field}    ${line}
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
#    \    Run Keyword And Ignore Error    Dismiss Alert
    Set Test Variable    @{failed_inputs}
