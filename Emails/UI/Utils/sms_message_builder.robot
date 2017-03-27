*** Settings ***
Documentation    keywords specific to the creation of messages using the sms builder

*** Keywords ***
set headers
    [Arguments]    ${message_name}
    input text    ${sms_message_builder["button_add"]["sms_message_name"]}    ${message_name}
    input text    ${sms_message_builder["button_add"]["sms_message_description"]}    auto message
    run keyword and ignore error    input text    ${sms_message_builder["button_add"]["sms_message_from"]}    Qa Team

delete latest message
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    select checkbox    //input[@name='deleteMessage']
    click element    //*[@id='iconTrash']
    click element    //a[contains(text(), 'Delete')]

create basic message
    open content    ${sms_message_builder}    ${sms_message_builder["button_add"]["add"]}
    set headers    Qa Automation Test Message
    input text    ${sms_message_builder["button_add"]["sms_message_body"]}    QA auto message test
    click element    ${sms_message_builder["button_add"]["save_button"]}
    sleep    0.5
    ${alert_message}=    get alert message
    should be equal as strings    ${alert_message}    message successfully saved.    ignore_case=True
