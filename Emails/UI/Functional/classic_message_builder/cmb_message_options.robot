*** Settings ***
Documentation       tests various options within the new message builder like send tests and preview
Default Tags        ui    email    cmb
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/classic_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
send_test_email_on_new_message
    create basic message
    click element    ${classic_message_builder["button_add"]["send_test_message_link"]}
    send test emails
    delete latest message

preview_email_on_new_message
    create basic message
    click element    //*[@id="previewBtn"]
    select frame    ${iframes["popup_frame"]}
    select frame    ${iframes["html_preview"]}
    current frame contains    QA auto message test
    delete latest message
