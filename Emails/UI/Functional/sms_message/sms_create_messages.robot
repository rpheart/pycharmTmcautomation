*** Settings ***
Documentation       tests for creating different types of messages
Default Tags        ui    email    sms
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/sms_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_sms_message
    create basic message
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    table row should contain    ${sms_message_builder["button_list"]["table"]}    1    Qa Automation Test Message
    delete latest message
