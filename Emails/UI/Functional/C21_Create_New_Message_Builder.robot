*** Settings ***
Documentation
Default Tags        ui    email
Resource            ../Utils/keywords.robot
Resource            ../Utils/new_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      run keywords    delete latest message
...                 AND    close all browsers

*** Test Cases ***
create_message
    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    set message name    Qa Automation Test Message
    add widget to canvas    ${new_message_builder["button_add"]["text_widget"]}
    edit text widget    Create New Message Builder\n\nThis message was created using automation
    set mandatory headers
    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
    :for    ${n}    in range    2
    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    \    ${message_created}=    run keyword and return status    current frame contains    Qa Automation Test
    \    exit for loop if    ${message_created}
    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
