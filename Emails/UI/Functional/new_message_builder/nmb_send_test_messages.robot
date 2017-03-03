*** Settings ***
Documentation
Default Tags        ui    email
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/new_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
send_test_email_on_new_message
    create basic message
    send test emails    patrick.summers@smartfocus.com
    delete latest message
