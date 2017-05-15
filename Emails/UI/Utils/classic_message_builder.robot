*** Settings ***
Documentation    keywords specific to the creation of messages using the classic builder

*** Keywords ***
set headers
    [Arguments]    ${message_name}
    # get to the headers accordian
    click element    ${classic_message_builder["button_add"]["header_accordion"]}
    # fill out header info
    wait until keyword succeeds    15x    1 sec    input text    ${classic_message_builder["button_add"]["message_name_input"]}    ${message_name}
    input text    ${classic_message_builder["button_add"]["message_description_input"]}    auto message
    input text    ${classic_message_builder["button_add"]["message_from_input"]}    qa auto
    input text    ${classic_message_builder["button_add"]["message_to_input"]}    tester
    input text    ${classic_message_builder["button_add"]["message_subject_input"]}    Qa Automation Test Message
    input text    ${classic_message_builder["button_add"]["message_reply_to_email_input"]}    qa.auto@smartfocus.com
    input text    ${classic_message_builder["button_add"]["message_reply_to_label_input"]}    qa auto

set body
    [Arguments]    ${body}=[EMV TEXTPART]QA auto message test[EMV HTMLPART] <html> <body> <p>QA auto message test</p> </body> </html>
    click element    ${classic_message_builder["button_add"]["body_accordion"]}
    wait until keyword succeeds    5x    1 sec    input text    ${classic_message_builder["button_add"]["text_editor"]}    ${body}

send test emails
    [Documentation]
    @{emails}=    create list    qa.auto@smartfocus.com    qa.test@smartfocus.com
    select frame    ${iframes["popup_frame"]}
    wait until page contains    Message Send Test
    input text    ${generics["test_campaign_name"]}    Add two emails for testing    # Type 'Test Campaign name'

    # add emails to 'Test Recipients' and to the QA_auto group
    :for    ${email}    in    @{emails}
    \    input text    ${generics["new_test_email"]}    ${email}    # Input New Test Email
    \    click element    ${generics["add_email_to_test_recipients"]}    # Add email to 'Test recipients list'

    # ensure members are part of group
    select from list by label    ${generics["test_group_dropdown"]}    QA_auto    # Select Group 'QA_auto'
    select checkbox    ${generics["qa_test_email"]}
    select checkbox    ${generics["auto_test_email"]}
    click element    ${generics["update_group_button"]}    # Update Group

    # send test email to group
    select from list by label    ${generics["test_group_dropdown"]}    QA_auto    # Select Group 'QA_auto'
    click element    ${generics["send_test_button"]}    # Send a Test
    wait until page contains    You will receive your test email shortly
    click element    ${generics["close_popup_box"]}

delete latest message
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    select checkbox    //input[@name='deleteMessage']
    click element    //*[@id='iconTrash']
    click element    //a[contains(text(), 'Delete')]

create basic message
    open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    set headers    Qa Automation Test Message
    set body
    click element    ${classic_message_builder["button_add"]["save_button"]}
    sleep    0.5
