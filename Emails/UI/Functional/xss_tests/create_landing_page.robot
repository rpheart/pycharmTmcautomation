*** Settings ***
Documentation       will check the input of each of the blns values into the create landing page search screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
landing_page_search
    verify xss data on search field    ${landing_page}    ${landing_page["button_list"]["list"]}
