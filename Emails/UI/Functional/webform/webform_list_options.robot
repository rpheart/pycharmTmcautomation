*** Settings ***
Documentation       tests for creating different types of webforms
Default Tags        ui    email    webform
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/webform.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create basic update webform
Suite Teardown      close all browsers

*** Test Cases ***
edit_webform
    open content    ${webform}    ${webform["button_list"]["list"]}
    click element    ${webform["button_list"]["edit"]}
    current frame contains    STEP 1: Settings

copy_webform
    open content    ${webform}    ${webform["button_list"]["list"]}
    click element    ${webform["button_list"]["copy"]}
    click element    ${webform["button_add"]["next_step"]}
    click element    ${webform["button_add"]["next_step"]}
    click element    ${webform["button_add"]["save_webform"]}
    open content    ${webform}    ${webform["button_list"]["list"]}
    table row should contain    ${webform["button_list"]["table"]}    1    Copy Of

preview_webform
    open content    ${webform}    ${webform["button_list"]["list"]}
    click element    ${webform["button_list"]["preview"]}
    current frame contains    Webform Preview
