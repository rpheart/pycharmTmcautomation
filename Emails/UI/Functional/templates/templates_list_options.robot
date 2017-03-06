*** Settings ***
Documentation       tests the options under the list page
Default Tags        ui    email    templates
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/templates.robot
Resource            ../../Utils/classic_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create basic template
Suite Teardown      close all browsers

*** Test Cases ***
view_template
    open content    ${template}    ${template["button_list"]["list"]}
    click element    ${template["button_list"]["view"]}
    current frame contains    Happy Easter

create_message
    open content    ${template}    ${template["button_list"]["list"]}
    click element    ${template["button_list"]["create_message"]}
    element should be visible    ${classic_message_builder["button_add"]["header_accordion"]}
    set headers    Template Auto Message
    click element    ${classic_message_builder["button_add"]["save_button"]}
    sleep    0.5
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    table row should contain    ${classic_message_builder["button_list"]["table"]}    1    Template Auto Message
    delete latest message

replace_template
    open content    ${template}    ${template["button_list"]["list"]}
    click element    ${template["button_list"]["replace"]}
    select window    Template Replace
    choose file    ${template["button_add"]["upload_file"]}    ${EXECDIR}/Emails/UI/Utils/Resources/gifts_for_mom.dwt
    click element    ${template["button_list"]["upload_button"]}
    ${alert_message}=    get alert message
    should contain    ${alert_message}    You are about to overide the template
    open content    ${template}    ${template["button_list"]["list"]}
    click element    ${template["button_list"]["view"]}
    current frame contains    Mother's Day

delete_template
    delete latest template
