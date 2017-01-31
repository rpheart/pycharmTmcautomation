*** Settings ***
Documentation       will check the input of each of the blns values into the list growth reports screen
Resource            Emails/UI/Utils/keywords.robot
Default Tags        ui    email    production
Library             Collections
Library             String

*** Variables ***
@{test_data}    nil    ";alert(123);"

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

    Log Failed Inputs    @{failed_inputs}

List Growth Report Name
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    ${list_growth_reports["button_add"]["create_new"]["report_name"]}    ${line}
    \    Click Element    ${list_growth_reports["button_add"]["create_new"]["create_report"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    @{failed_inputs}

Close All Browsers
    Close All Browsers

*** Keywords ***
Log Failed Inputs
    [Arguments]    @{failed_inputs}
    Run Keyword If    len(@{failed_inputs}) == 0    Log    No Errors    console=yes
    ...    ELSE IF    len(@{failed_inputs}) == 1    Log    @{failed_inputs}    level=WARN
    ...    ELSE    Log    ${failed_inputs}    level=WARN

    Run Keyword If    len(@{failed_inputs}) > 0    Fail    msg=List of words that failed xss verification

Check For Bad Request
    [Arguments]    ${input}    ${failed_inputs}
    ${test}=    Run Keyword And Return Status    Current Frame Contains    Bad Request!!!
    Run Keyword If    ${test} == False    Append To List    ${failed_inputs}    ${input}

Create List
    ${blns}=    Get File    Emails/UI/Utils/Resources/blns.json
    @{test_data}=    Split To Lines    ${blns}
