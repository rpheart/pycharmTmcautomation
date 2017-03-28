*** Settings ***
Documentation       tests for creating multimessage campaigns
Default Tags        ui    email    mms
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/multimessage_campaign.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create basic multimessage campaign
Suite Teardown      close all browsers

*** Test Cases ***
edit_latest_multimessage_campaign
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    click element    ${multimessage_campaign["button_list"]["first_row"]}
    click element    ${multimessage_campaign["button_list"]["edit_button"]}
    current frame contains    1. Campaign name and description

view_latest_multimessage_campaign
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    click element    ${multimessage_campaign["button_list"]["first_row"]}
    click element    ${multimessage_campaign["button_list"]["view_button"]}
    current frame contains    1. Campaign and recipients

delete_latest_multimessage_campaign
    delete latest multimessage campaign
