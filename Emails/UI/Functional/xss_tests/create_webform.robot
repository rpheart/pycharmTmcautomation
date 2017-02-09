*** Settings ***
Documentation       will check the input of each of the blns values into the create webform screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
webform_search
    verify xss data on search field    ${webform}    ${webform["button_list"]["list"]}
