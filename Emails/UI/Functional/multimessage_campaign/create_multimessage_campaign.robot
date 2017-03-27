*** Settings ***
Documentation       tests for creating multivariate campaigns
Default Tags        ui    email    mms
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/multimessage_campaign.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_multimessage_campaign
    create basic multimessage campaign
    verify multimessage campaign completes    Running
    verify multimessage campaign completes    Completed

delete_latest_multimessage_campaign
    delete latest multimessage campaign
