*** Settings ***
Documentation       tests for creating different types of messages
Default Tags        ui    email    cmb
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/classic_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_classic_message
    create basic message
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    table row should contain    ${classic_message_builder["button_list"]["table"]}    1    Qa Automation Test Message
    delete latest message
