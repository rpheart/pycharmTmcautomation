*** Settings ***
Documentation       will check the input of each of the blns values into the workflow model screen
Resource            Emails/UI/Utils/keywords.robot
Resource            Emails/UI/Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
Suite Teardown      Close All Browsers

*** Test Cases ***
Workflow Model Name
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
#    \    Log    ${line}    level=WARN
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    ${line}
    \    Input Text    description    test
    \    Select From List    campaignType    Regular campaign
    \    Input Text    wfmNodeHash_description(nodeLvlCampaign)    test
    \    Click Element    ${generics["save"]}
    \    Run Keyword And Ignore Error    Dismiss Alert
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model Description
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    ${line}
    \    Select From List    campaignType    Regular campaign
    \    Input Text    wfmNodeHash_description(nodeLvlCampaign)    test
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model Regular Campaign Description
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    Regular campaign
    \    Input Text    wfmNodeHash_description(nodeLvlCampaign)    ${line}
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model Trigger Campaign Description
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    Trigger Campaign
    \    Input Text    wfmNodeHash_description(nodeLvlReflex)    ${line}
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model MultiVariate Test Description 1
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    MultiVariate Test
    \    Input Text    wfmNodeHash_description(nodeLvl0_0)    ${line}
    \    Input Text    wfmNodeHash_description(nodeLvl1_0)    test
    \    Input Text    wfmNodeHash_description(nodeLvlmvt_campaign_rollout)    test
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model MultiVariate Test Description 2
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    MultiVariate Test
    \    Input Text    wfmNodeHash_description(nodeLvl0_0)    test
    \    Input Text    wfmNodeHash_description(nodeLvl1_0)    ${line}
    \    Input Text    wfmNodeHash_description(nodeLvlmvt_campaign_rollout)    test
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model MultiVariate Test Description 3
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    MultiVariate Test
    \    Input Text    wfmNodeHash_description(nodeLvl0_0)    test
    \    Input Text    wfmNodeHash_description(nodeLvl1_0)    test
    \    Input Text    wfmNodeHash_description(nodeLvlmvt_campaign_rollout)    ${line}
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model MultiMessage Description 1
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    MultiMessage
    \    Input Text    wfmNodeHash_description(nodeLvl0_0)    ${line}
    \    Input Text    wfmNodeHash_description(nodeLvl1_0)    test
    \    Input Text    wfmNodeHash_description(nodeLvlMultiMessage)    test
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model MultiMessage Description 2
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    MultiMessage
    \    Input Text    wfmNodeHash_description(nodeLvl0_0)    test
    \    Input Text    wfmNodeHash_description(nodeLvl1_0)    ${line}
    \    Input Text    wfmNodeHash_description(nodeLvlMultiMessage)    test
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Workflow Model MultiMessage Description 3
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Input Text    modelName    test
    \    Input Text    description    test
    \    Select From List    campaignType    MultiMessage
    \    Input Text    wfmNodeHash_description(nodeLvl0_0)    test
    \    Input Text    wfmNodeHash_description(nodeLvl1_0)    test
    \    Input Text    wfmNodeHash_description(nodeLvlMultiMessage)    ${line}
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}
