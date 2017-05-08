*** Settings ***
Documentation       tests the options under the list page
Default Tags        ui    email    nmb
Resource            ../../Utils/email_keywords.robot
Resource            ../../Utils/new_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create basic message
Suite Teardown      close all browsers

*** Test Cases ***
edit_message
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    click element    ${new_message_builder["button_list"]["first_row"]}
    click element    ${new_message_builder["button_list"]["edit_button"]}
    element should be visible    ${new_message_builder["button_add"]["add_a_row"]}

duplicate_message
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    click element    ${new_message_builder["button_list"]["first_row"]}
    click element    ${new_message_builder["button_list"]["duplicate"]}
    input text    ${new_message_builder["button_list"]["rename_input"]}    COPY
    click element    ${new_message_builder["button_list"]["duplicate_button"]}
    wait until keyword succeeds    15x    1 sec    element should contain    ${new_message_builder["button_list"]["first_row"]}    COPY
    delete latest message

preview_message
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    click element    ${new_message_builder["button_list"]["first_row"]}
    click element    ${new_message_builder["button_list"]["preview_button"]}
    select window    Message builder
    page should contain    Create New Message Builder
    close window

convert_to_html_message
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    click element    ${new_message_builder["button_list"]["first_row"]}
    click element    ${new_message_builder["button_list"]["convert_to_html_button"]}
    click element    //*[@class='popup-actions']
    wait until keyword succeeds    15x    1 sec    element should contain    ${new_message_builder["button_list"]["first_row"]}    HTML

delete_message
    delete latest message
