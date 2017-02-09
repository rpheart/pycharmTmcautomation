*** Settings ***
Documentation       will check the input of each of the blns values into the send standard campaign search screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
standard_campaign_search
    verify xss data on search field    ${standard_campaign}    ${standard_campaign["button_list"]["list"]}
