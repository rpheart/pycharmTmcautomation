*** Settings ***
Documentation       tests the options under the list page
Default Tags        ui    email    sms
Resource            ../../Utils/email_keywords.robot
Resource            ../../Utils/sms_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create basic message
Suite Teardown      close all browsers

*** Test Cases ***
edit_message
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    click element    ${sms_message_builder["button_list"]["edit"]}
    current frame contains    Create Your Message Header and Body Below

copy_message
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    click element    ${sms_message_builder["button_list"]["copy"]}
    input text    ${sms_message_builder["button_list"]["rename_input"]}    COPY
    click element    ${generics["save"]}
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    table row should contain    ${sms_message_builder["button_list"]["table"]}    1    COPY
    delete latest message

delete_message
    delete latest message
