*** Settings ***
Documentation       will check the input of each of the blns values into the workflow builder screen
Resource            Emails/UI/Utils/keywords.robot
Default Tags        ui    email    production
Library             Collections
Library             String
#Test Setup          Create List

*** Variables ***
@{test_data}    nil    ";alert(123);"
#@{failed_inputs}

*** Test Cases ***
login and go to email
#    ${blns}=    Get File    Emails/UI/Utils/Resources/blns.json
#    ${test_data}=    Split To Lines    ${blns}
#    ${length}=    Get Length    ${test_data}
#    log    ${test_data}    console=yes
#    Set Suite Variable    ${test_data}
    login
    go to ${system_page["email"]}

Workflow Builder Name
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    ${line}
    \    Input Text    description    test
    \    Select From List    campaignType    Regular campaign
    \    Input Text    wfmNodeHash_description(nodeLvlCampaign)    test
    \    Click Element    xpath=//a[contains(text(),'Save') or ./text() = 'Save']
    \    ${test}=    Run Keyword And Return Status    Current Frame Contains    Bad Request!!!
    \    Run Keyword If    ${test} == False    Append To List    ${failed_inputs}    ${line}

    Log Failed Inputs    Name    @{test_data}

Workflow Builder Description
    ${failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    ${line}
    \    Select From List    campaignType    Regular campaign
    \    Input Text    wfmNodeHash_description(nodeLvlCampaign)    test
    \    Click Element    xpath=//a[contains(text(),'Save') or ./text() = 'Save']
    \    ${test}=    Run Keyword And Return Status    Current Frame Contains    Bad Request!!!
    \    Run Keyword If    ${test}    Append To List    ${failed_inputs}    ${line}

    Log Failed Inputs    Description    @{failed_inputs}

Workflow Builder Campaign Description
    ${failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    Regular campaign
    \    Input Text    wfmNodeHash_description(nodeLvlCampaign)    ${line}
    \    Click Element    xpath=//a[contains(text(),'Save') or ./text() = 'Save']
    \    ${test}=    Run Keyword And Return Status    Current Frame Contains    Bad Request!!!
    \    Run Keyword If    ${test}    Append To List    ${failed_inputs}    ${line}

    Log Failed Inputs    Campaign Description    @{failed_inputs}

*** Keywords ***
Log Failed Inputs
    [Arguments]    ${input_name}    ${failed_inputs}
    Log    ${input_name}    console=yes
#    Run Keyword If    Len(${failed_inputs}) == 1    console=yes
    Log    ${failed_inputs}    console=yes
#    ${my_list}=    ${EMPTY LIST}
#    ${failed_inputs}=    Create List    @{my_list}

Check For Bad Request
    ${test}=    Run Keyword And Return Status    Current Frame Contains    Bad Request!!!
    log    ${test}    console=yes
    Run Keyword If    ${test} == 'False'    Append To List    ${failed_inputs}    ${line}

Create List
    ${blns}=    Get File    Emails/UI/Utils/Resources/blns.json
    ${test_data}=    Split To Lines    ${blns}
