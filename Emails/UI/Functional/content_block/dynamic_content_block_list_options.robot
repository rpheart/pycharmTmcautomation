*** Settings ***
Documentation       tests the options under the list page
Default Tags        ui    email    dcb
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/dynamic_content_block.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create basic content block
Suite Teardown      close all browsers

*** Test Cases ***
preview_dynamic_content_block
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${content_block["button_list"]["first_row"]}
    click element    ${content_block["button_list"]["preview"]}
    current frame contains    QA Auto Content Block

edit_dynamic_content_block
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${content_block["button_list"]["first_row"]}
    click element    ${content_block["button_list"]["edit"]}
    current frame contains    <p>QA Auto Content Block</p>

duplicate_dynamic_content_block
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${content_block["button_list"]["first_row"]}
    click element    ${content_block["button_list"]["copy"]}
    input text    ${content_block["button_list"]["rename_input"]}    COPY
    click element    ${content_block["button_list"]["duplicate"]}
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    element should contain    ${content_block["button_list"]["first_row"]}    COPY
    delete latest content block

delete_dynamic_content_block
    delete latest content block
