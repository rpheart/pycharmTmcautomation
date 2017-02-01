*** Settings ***
Documentation       will check the input of each of the blns values into the workflow workflows screen
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

Workflow Model Name
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${workflow}    ${workflow["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Click Element    xpath=//input[@name='modelId']
    \    Click Element    ${generics["next"]}
    \    Input Text    name    ${line}
    \    Input Text    description    test
    \    Click Element    xpath=//input[contains(@name, 'wfm')]
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model Description
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${workflow}    ${workflow["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Click Element    xpath=//input[@name='modelId']
    \    Click Element    ${generics["next"]}
    \    Input Text    name    ${line}
    \    Input Text    description    test
    \    Click Element    xpath=//input[contains(@name, 'wfm')]
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Close All Browsers
    Close All Browsers
