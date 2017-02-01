*** Settings ***
Documentation       will check the input of each of the blns values into the add subscriber screen
Resource            Emails/UI/Utils/keywords.robot
Resource            Emails/UI/Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Library             Collections
Library             String
Suite Teardown      Close All Browsers

*** Test Cases ***
login and go to email
    login
    go to ${system_page["email"]}

List Management Search Subscriber Text
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${search_subscriber["button_add"]["search_button"]}    timeout=30
    \    Select From List    name=textFieldCombo    EMAIL
    \    Select From List    name=textFieldOperator    equals
    \    Input Text    name=textFieldValue    ${line}
    \    Click Element    xpath=//img[@id="iconAddCriteria"]
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}
