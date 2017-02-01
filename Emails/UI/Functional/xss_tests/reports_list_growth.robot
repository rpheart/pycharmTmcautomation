*** Settings ***
Documentation       will check the input of each of the blns values into the list growth reports screen
Resource            Emails/UI/Utils/keywords.robot
Resource            Emails/UI/Utils/xss_keywords.robot
Default Tags        ui    email    production
Library             Collections
Library             String
Suite Teardown      Close All Browsers

*** Test Cases ***
login and go to email
    login
    go to ${system_page["email"]}

List Growth Reports Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${mobile_reports}    ${mobile_reports["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

List Growth Report Name
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    ${list_growth_reports["button_add"]["create_new"]["report_name"]}    ${line}
    \    Click Element    ${list_growth_reports["button_add"]["create_new"]["create_report"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}
