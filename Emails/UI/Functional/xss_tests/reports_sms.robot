*** Settings ***
Documentation       will check the input of each of the blns values into the sms reports screen
Resource            Emails/UI/Utils/keywords.robot
Resource            Emails/UI/Utils/xss_keywords.robot
Default Tags        ui    email    production
Library             Collections
Library             String

*** Variables ***

*** Test Cases ***
login and go to email
    login
    go to ${system_page["email"]}

SMS Reports Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${mobile_reports}    ${mobile_reports["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    @{failed_inputs}

Close All Browsers
    Close All Browsers
