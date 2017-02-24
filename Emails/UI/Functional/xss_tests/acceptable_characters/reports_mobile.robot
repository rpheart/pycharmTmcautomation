*** Settings ***
Documentation       will check the input of unicode values into the sms reports screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
mobile_reports_search
    verify non xss data on search field    ${mobile_reports}    ${mobile_reports["button_add"]["add"]}
