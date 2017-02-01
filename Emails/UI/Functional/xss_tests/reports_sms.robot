*** Settings ***
Documentation       will check the input of each of the blns values into the sms reports screen
Resource            Emails/UI/Utils/keywords.robot
Resource            Emails/UI/Utils/xss_keywords.robot
Default Tags        ui    email    production
Library             Collections
Library             String
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
Suite Teardown      Close All Browsers

*** Test Cases ***
SMS Reports Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${mobile_reports}    ${mobile_reports["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}
