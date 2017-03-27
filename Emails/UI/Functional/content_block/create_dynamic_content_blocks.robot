*** Settings ***
Documentation       creates different types of dynamic content blocks
Default Tags        ui    email    dcb
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/dynamic_content_block.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_dynamic_content_block
    create basic content block
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    element should contain    ${content_block["button_list"]["first_row"]}    QA Auto Content Block
    delete latest content block

create_dynamic_content_block_with_mirror_link
    open content    ${content_block}    ${content_block["button_add"]["add"]}
    input text    ${content_block["button_add"]["name"]}    QA Auto Content Block
    input text    ${content_block["button_add"]["description"]}    auto created
    # add mirror link
    click element    ${generics["link_management"]["link"]}
    select frame    ${iframes["popup_frame"]}
    mouse over    ${generics["link_management"]["create_advanced_link"]}
    click element    ${generics["link_management"]["mirror_link"]}
    click element    ${generics["link_management"]["save&add_link"]}
    select window    ${document_title}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    click element    ${generics["close_popup_box"]}
    # save message
    click element    ${content_block["button_add"]["save"]}
    sleep    1
    alert should be present    text=Your Dynamic Content Block has been saved successfully.
    delete latest content block
