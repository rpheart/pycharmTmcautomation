*** Settings ***
Documentation       tests various options within the new message builder like send tests and preview
Default Tags        ui    email    nmb
Resource            ../../Utils/email_keywords.robot
Resource            ../../Utils/new_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
send_test_email_on_new_message
    create basic message
    send test emails    patrick.summers@smartfocus.com
    delete latest message

preview_email_on_new_message
    create basic message
    :for    ${n}    in range    5
    \    ${tests_open}=    run keyword and return status    click element    ${new_message_builder["button_add"]["tests_panel"]}
    \    exit for loop if    ${tests_open}
    \    wait until keyword succeeds    15x    1 sec    click element    ${new_message_builder["button_add"]["tests"]}
    \    sleep    0.5
    sleep    0.5
    click element    //*[@id="preview-message"]
    select window    Message builder
    page should contain    Create New Message Builder
    close window
    delete latest message