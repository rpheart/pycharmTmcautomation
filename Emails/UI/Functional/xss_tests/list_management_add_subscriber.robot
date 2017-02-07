*** Settings ***
Documentation       will check the input of each of the blns values into the add subscriber screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
...                 AND    Delete Subscribers
Suite Teardown      Run Keywords    Delete Subscribers
...                 AND    Close All Browsers

*** Test Cases ***
List Management Add Subscriber
    @{input_fields}=    Create List    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    ${add_subscriber["button_add"]["input_fields"]["email"]}    ${add_subscriber["button_add"]["input_fields"]["title"]}    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    ${add_subscriber["button_add"]["input_fields"]["source"]}    ${add_subscriber["button_add"]["input_fields"]["segment"]}
    :FOR    ${field}    In    @{input_fields}
    \    Loop Through Test Data    ${field}
    \    Write Failed Input To File    ${TEST_NAME}    ${field}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification

List Management Search For Added Subscribers
    Open Content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["search_button"]}    timeout=30
    Select From List    ${search_subscriber["button_add"]["numeric_field_combo"]}    EMVCELLPHONE
    Select From List    ${search_subscriber["button_add"]["numeric_field_operator"]}    equals
    Input Text    ${search_subscriber["button_add"]["numeric_field_value"]}    777
    Click Element    ${search_subscriber["button_add"]["numeric_search"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["text_search"]}    timeout=30
    Click Element    ${search_subscriber["button_add"]["text_search"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["member_count"]}    timeout=30
    ${subscribers}=    Run Keyword And Return Status    Element Text Should Be    ${search_subscriber["button_add"]["member_count"]}    0
    Run Keyword If    ${subscribers} == False    Fail    msg=Members were created using xss data

*** Keywords ***
Create Email String
    [Arguments]    ${line}
    ${line}=    Catenate    SEPARATOR=    ${line}    @test.com
    Set Test Variable    ${line}

Loop Through Test Data
    [Arguments]    ${field}
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${field}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    ${is_email}=    Run Keyword And Return Status    Should Contain    ${field}    (EMAIL)
    \    Run Keyword If    ${is_email}    Run Keywords    Create Email String    ${line}
    \    ...    AND    Input Text    ${field}    ${line}
    \    ...    ELSE    Input Text    ${field}    ${line}
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Set Test Variable    @{failed_inputs}

Delete Subscribers
    Open Content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["search_button"]}    timeout=30
    Select From List    ${search_subscriber["button_add"]["numeric_field_combo"]}    EMVCELLPHONE
    Select From List    ${search_subscriber["button_add"]["numeric_field_operator"]}    equals
    Input Text    ${search_subscriber["button_add"]["numeric_field_value"]}    777
    Click Element    ${search_subscriber["button_add"]["numeric_search"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["text_search"]}    timeout=30
    Click Element    ${search_subscriber["button_add"]["text_search"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["member_count"]}    timeout=30
    :FOR    ${n}    IN RANGE    100
    \    Wait Until Element Is Visible    ${search_subscriber["button_add"]["member_count"]}    timeout=30
    \    ${subscribers}=    Run Keyword And Return Status    Element Text Should Be    ${search_subscriber["button_add"]["member_count"]}    0
    \    Run Keyword If    ${subscribers} == False    Run Keywords    Click Element    ${generics["select_all"]}
    \    ...    AND    Click Element    ${generics["trash"]}
    \    ...    AND    Click Element    ${search_subscriber["button_add"]["delete_members"]}
    \    Run Keyword If    ${subscribers}    Exit For Loop
