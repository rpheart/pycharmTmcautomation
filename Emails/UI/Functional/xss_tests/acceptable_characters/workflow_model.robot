*** Settings ***
Documentation       will check the input of unicode values into the workflow model screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    non_xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
model_name
    loop through test data    modelName    Regular campaign

model_description
    loop through test data    description    Regular campaign

model_regular_campaign_description
    loop through test data    wfmNodeHash_description(nodeLvlCampaign)    Regular campaign

model_trigger_campaign_description
    loop through test data    wfmNodeHash_description(nodeLvlReflex)    Trigger Campaign

model_multivariate_test_description_1
    loop through test data    wfmNodeHash_description(nodeLvl0_0)    MultiVariate Test

model_multivariate_test_description_2
    loop through test data    wfmNodeHash_description(nodeLvl1_0)    MultiVariate Test

model_multivariate_test_description_3
    loop through test data    wfmNodeHash_description(nodeLvlmvt_campaign_rollout)    MultiVariate Test

model_multimessage_description_1
    loop through test data    wfmNodeHash_description(nodeLvl0_0)    MultiMessage

model_multimessage_description_2
    loop through test data    wfmNodeHash_description(nodeLvl1_0)    MultiMessage

model_multimessage_description_3
    loop through test data    wfmNodeHash_description(nodeLvlMultiMessage)    MultiMessage

*** Keywords ***
loop through test data
    [Arguments]    ${field}    ${campaign_type}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${workflow_model}    ${workflow_model["button_add"]["add"]}
    \    wait until keyword succeeds    30x    1 sec    click element    ${generics["create_new"]}
    \    input text    modelName    Name
    \    select from list by label    campaignType    ${campaign_type}
    \    input text    ${field}    ${line}
    \    click element    ${generics["save"]}
    \    check for good request    ${line}    @{failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
