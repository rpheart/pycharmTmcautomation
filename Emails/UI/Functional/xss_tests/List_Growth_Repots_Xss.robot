*** Settings ***
Documentation       will check the input of each of the blns values into the list growth reports screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
Suite Teardown      Close All Browsers

*** Test Cases ***
List_Growth_Reports_Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification

List_Growth_Report_Name
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    ${list_growth_reports["button_add"]["create_new"]["report_name"]}    ${line}
    \    Click Element    ${list_growth_reports["button_add"]["create_new"]["create_report"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification
