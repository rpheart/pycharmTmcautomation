*** Settings ***
Documentation       tests the options under the list page
Default Tags        ui    email    cmb
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/classic_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create basic message
Suite Teardown      close all browsers

*** Test Cases ***
edit_message
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    click element    ${classic_message_builder["button_list"]["edit"]}
    element should be visible    ${classic_message_builder["button_add"]["header_accordion"]}

copy_message
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    click element    ${classic_message_builder["button_list"]["copy"]}
    input text    ${classic_message_builder["button_list"]["rename_input"]}    COPY
    click element    ${generics["save"]}
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    table row should contain    ${classic_message_builder["button_list"]["table"]}    1    COPY
    delete latest message

preview_message
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    click element    ${classic_message_builder["button_list"]["preview"]}
    current frame contains    Qa Automation Test Message

send_test_message
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    click element    ${classic_message_builder["button_list"]["test_message"]}
    send test emails

delete_message
    delete latest message
