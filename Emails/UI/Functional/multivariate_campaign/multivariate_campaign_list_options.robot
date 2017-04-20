*** Settings ***
Documentation       tests for creating multivariate campaigns
Default Tags        ui    email    mmv
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/multivariate_campaign.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create basic multivariate campaign
Suite Teardown      close all browsers

*** Test Cases ***
edit_latest_multivariate_campaign
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    click element    ${multivariate_campaign["button_list"]["first_row"]}
    click element    ${multivariate_campaign["button_list"]["edit_button"]}
    current frame contains    1. Campaign name and description

view_latest_multivariate_campaign
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    click element    ${multivariate_campaign["button_list"]["first_row"]}
    click element    ${multivariate_campaign["button_list"]["view_button"]}
    current frame contains    1. Campaign and recipients

delete_latest_multivariate_campaign
    delete latest multivariate campaign

#stop_auto_winner_latest_multivariate_campaign
