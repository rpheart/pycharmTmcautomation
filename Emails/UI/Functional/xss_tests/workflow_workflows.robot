*** Settings ***
Documentation       will check the input of each of the blns values into the workflow workflows screen
Resource            Emails/UI/Utils/keywords.robot
Default Tags        ui    email    production
Library             Collections
Library             String

*** Variables ***
@{test_data}    nil    ";alert(123);"

*** Test Cases ***
login and go to email
#    ${blns}=    Get File    Emails/UI/Utils/Resources/blns.json
#    ${test_data}=    Split To Lines    ${blns}
#    ${length}=    Get Length    ${test_data}
#    log    ${test_data}    console=yes
#    Set Suite Variable    ${test_data}
    login
    go to ${system_page["email"]}

Workflow Model Name
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${workflow}    ${workflow["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Click Element    xpath=//input[@name='modelId']
    \    Click Element    xpath=//a[contains(text(),'Next') or ./text() = 'Next']
    \    Input Text    name    ${line}
    \    Input Text    description    test
    \    Click Element    xpath=//input[contains(@name, 'wfm')]
    \    Click Element    xpath=//a[contains(text(),'Save') or ./text() = 'Save']
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    Name    @{failed_inputs}

Workflow Model Description
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${workflow}    ${workflow["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Click Element    xpath=//input[@name='modelId']
    \    Click Element    xpath=//a[contains(text(),'Next') or ./text() = 'Next']
    \    Input Text    name    ${line}
    \    Input Text    description    test
    \    Click Element    xpath=//input[contains(@name, 'wfm')]
    \    Click Element    xpath=//a[contains(text(),'Save') or ./text() = 'Save']
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    Description    @{failed_inputs}

*** Keywords ***
Log Failed Inputs
    [Arguments]    ${input_name}    @{failed_inputs}
    Log    ${input_name}    level=INFO    console=yes
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
    ${test_data}=    Split To Lines    ${blns}
