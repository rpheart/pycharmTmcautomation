*** Settings ***
Documentation       will check the input of each of the blns values into the add subscriber screen
Resource            Emails/UI/Utils/keywords.robot
Resource            Emails/UI/Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Library             Collections
Library             String
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
...                 AND    Delete Subscribers
Suite Teardown      Close All Browsers

*** Test Cases ***
List Management Add Subscriber Firstname
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    ${line}
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["title"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["source"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["segment"]}    test
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Management Add Subscriber Firstname Search Subscriber
    Verify No Added Subscribers    ${TEST_NAME}

List Management Add Subscriber Lastname
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    ${line}
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["title"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["source"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["segment"]}    test
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Management Add Subscriber Lastname Search Subscriber
    Verify No Added Subscribers    ${TEST_NAME}

List Management Add Subscriber Email Origine
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    ${line}
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["title"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["source"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["segment"]}    test
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Management Add Subscriber Email Origine Search Subscriber
    Verify No Added Subscribers    ${TEST_NAME}

List Management Add Subscriber Email
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    test@test.com
    \    ${email_input}=    Catenate    SEPARATOR=    ${line}    @test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    ${email_input}
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["title"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["source"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["segment"]}    test
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Management Add Subscriber Email Search Subscriber
    Verify No Added Subscribers    ${TEST_NAME}

List Management Add Subscriber Title
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["title"]}    ${line}
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["source"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["segment"]}    test
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Management Add Subscriber Title Search Subscriber
    Verify No Added Subscribers    ${TEST_NAME}

List Management Add Subscriber Client URN
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["title"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    ${line}
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["source"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["segment"]}    test
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Management Add Subscriber Client URN Search Subscriber
    Verify No Added Subscribers    ${TEST_NAME}

List Management Add Subscriber Source
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["title"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["source"]}    ${line}
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["segment"]}    test
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Management Add Subscriber Source Search Subscriber
    Verify No Added Subscribers    ${TEST_NAME}

List Management Add Subscriber Segment
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    timeout=30
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["firstname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["lastname"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email_original"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["title"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["source"]}    test
    \    Input Text    ${add_subscriber["button_add"]["input_fields"]["segment"]}    ${line}
    \    Click Element    ${add_subscriber["button_add"]["save_member"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Management Add Subscriber Title Segment Subscriber
    Verify No Added Subscribers    ${TEST_NAME}

*** Keywords ***
Delete Subscribers
    Open Content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["search_button"]}    timeout=30
    Select From List    name=numericFieldCombo    EMVCELLPHONE
    Select From List    name=numericFieldOperator    equals
    Input Text    name=numericFieldValue    777
    Click Element    xpath=//tr[3]/td[4]/a/img[@id="iconAddCriteria"]
    Wait Until Element Is Visible    id=iconSearch    timeout=30
    Click Element    id=iconSearch
    Sleep    5
    :FOR    ${n}    IN RANGE    100
    \    Wait Until Element Is Visible    xpath=//*[@id="nbMembers"]    timeout=30
    \    ${subscribers}=    Run Keyword And Return Status    Element Text Should Be    xpath=//*[@id="nbMembers"]    0
    \    Run Keyword If    ${subscribers} == False    Run Keywords    Click Element    xpath=//img[@id="iconSelectAll"]
    \    ...    AND    Click Element    xpath=//*[@id="iconTrash"]
    \    ...    AND    Click Element    xpath=//a[contains(text(),'Delete Members') or ./text() = 'Delete Members']
    \    Run Keyword If    ${subscribers}    Exit For Loop

Verify No Added Subscribers
    [Arguments]    ${test_case_name}
    Open Content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["search_button"]}    timeout=30
    Select From List    name=numericFieldCombo    EMVCELLPHONE
    Select From List    name=numericFieldOperator    equals
    Input Text    name=numericFieldValue    777
    Click Element    xpath=//tr[3]/td[4]/a/img[@id="iconAddCriteria"]
    Wait Until Element Is Visible    id=iconSearch    timeout=30
    Click Element    id=iconSearch
    Sleep    5
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    ${test}=    Run Keyword And Return Status    Current Frame Contains    ${line}
    \    Run Keyword If    ${test}    Append To List    ${failed_inputs}    ${line}
    Delete Subscribers
    Log Failed Inputs    ${test_case_name}    @{failed_inputs}
