*** Settings ***
Documentation       tests for creating multivariate campaigns
Default Tags        ui    email    mmv
Resource            ../../Utils/email_keywords.robot
Resource            ../../Utils/multivariate_campaign.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_multivariate_campaign
    create basic multivariate campaign
    verify multivariate campaign completes    Completed

create_multivariate_rollout_campaign
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    element should contain    ${multivariate_campaign["button_list"]["first_row"]}    Completed
    click element    ${multivariate_campaign["button_list"]["first_campaign_name"]}
    mouse over    ${multivariate_campaign["button_add"]["version_one_preview"]}
    click element    ${multivariate_campaign["button_add"]["schedule_rollout_icon"]}
    click element    ${multivariate_campaign["button_add"]["send_rollout_button"]}
    click element    ${generics["yes_button"]}
    verify multivariate campaign completes    Rolled out

delete_latest_multivariate_campaign
    delete latest multivariate campaign
