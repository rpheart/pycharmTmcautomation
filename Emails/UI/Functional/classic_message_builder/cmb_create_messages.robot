*** Settings ***
Documentation       tests for creating different types of messages
Default Tags        ui    email    cmb
Resource            ../../Utils/email_keywords.robot
Resource            ../../Utils/classic_message_builder.robot
Resource            ../../Utils/dynamic_content_block.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_classic_message
    create basic message
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    table row should contain    ${classic_message_builder["button_list"]["table"]}    1    Qa Automation Test Message
    delete latest message

create_classic_message_with_dynamic_content_block
    create basic content block
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    ${block_id}=    get text    //*[@id="tabledivColumn-0-0"]/div
    open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    set headers    Qa Automation Test Message
    click element    ${classic_message_builder["button_add"]["body_accordion"]}
    wait until keyword succeeds    15x    1 sec    click element    ${generics["insert_dynamic_content_block"]["link"]}
    select frame    ${iframes["popup_frame"]}
    click element    //*[@id="iconAddCriteria"]
    select window    ${document_title}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    textarea should contain    ${classic_message_builder["button_add"]["text_editor"]}    ${block_id}
    click element    ${classic_message_builder["button_add"]["save_button"]}
    sleep    0.5
    delete latest message
    delete latest content block
