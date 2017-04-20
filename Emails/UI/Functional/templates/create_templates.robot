*** Settings ***
Documentation       tests the options under the list page
Default Tags        ui    email    templates
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/templates.robot
Resource            ../../Utils/classic_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_template
    create basic template
    open content    ${template}    ${template["button_list"]["list"]}
    table row should contain    ${template["button_list"]["table"]}    1    Qa Automation Test Template

create_message
    open content    ${template}    ${template["button_list"]["list"]}
    click element    ${template["button_list"]["view"]}
    click element    ${template["button_add"]["create_message"]}
    element should be visible    ${classic_message_builder["button_add"]["header_accordion"]}
    set headers    Template Auto Message
    click element    ${classic_message_builder["button_add"]["save_button"]}
    sleep    0.5
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    table row should contain    ${classic_message_builder["button_list"]["table"]}    1    Template Auto Message
    delete latest message

replace_template
    open content    ${template}    ${template["button_list"]["list"]}
    click element    ${template["button_list"]["view"]}
    click element    ${template["button_add"]["replace"]}
    select frame    ${iframes["popup_frame"]}
    choose file    ${template["button_add"]["upload_file"]}    ${EXECDIR}/Emails/UI/Utils/Resources/gifts_for_mom.dwt
    sleep    0.5
    click element    ${template["button_list"]["upload_button"]}
    sleep    1
    alert should be present    text=You are about to override content. Do you want to process?
    select window    ${document_title}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    current frame contains    Mother's Day

delete_template
    delete latest template
