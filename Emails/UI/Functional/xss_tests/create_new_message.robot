*** Settings ***
Documentation       will check the input of each of the blns values into the create new message builder search screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
new_message_search
    verify xss data on search field    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
