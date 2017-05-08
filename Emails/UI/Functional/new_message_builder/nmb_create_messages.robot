*** Settings ***
Documentation       basic set of tests for the new message builder
Default Tags        ui    email    nmb
Resource            ../../Utils/email_keywords.robot
Resource            ../../Utils/new_message_builder.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_message_with_text
    create basic message
    :for    ${n}    in range    5
    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
    \    exit for loop if    ${message_created}
    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
    delete latest message

create_message_with_image
    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    set message name    Qa Automation Test Message
    add widget to canvas    ${new_message_builder["button_add"]["image_widget"]}
    add image to widget
    set mandatory headers
    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
    :for    ${n}    in range    5
    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
    \    exit for loop if    ${message_created}
    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
    delete latest message

#create_message_with_text_image
#    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
#    set message name    Qa Automation Test Message
#    add widget to canvas    ${new_message_builder["button_add"]["text_image_widget"]}
#    edit text widget    Create New Message Builder\n\nThis message was created using automation
#    set mandatory headers
#    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
#    :for    ${n}    in range    5
#    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
#    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    \    exit for loop if    ${message_created}
#    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    delete latest message
#
#create_message_with_image_text
#    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
#    set message name    Qa Automation Test Message
#    add widget to canvas    ${new_message_builder["button_add"]["image_text_widget"]}
#    edit text widget    Create New Message Builder\n\nThis message was created using automation
#    set mandatory headers
#    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
#    :for    ${n}    in range    5
#    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
#    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    \    exit for loop if    ${message_created}
#    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    delete latest message
#
#create_message_with_share
#    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
#    set message name    Qa Automation Test Message
#    add widget to canvas    ${new_message_builder["button_add"]["share_widget"]}
#    edit text widget    Create New Message Builder\n\nThis message was created using automation
#    set mandatory headers
#    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
#    :for    ${n}    in range    5
#    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
#    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    \    exit for loop if    ${message_created}
#    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    delete latest message
#
#create_message_with_html
#    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
#    set message name    Qa Automation Test Message
#    add widget to canvas    ${new_message_builder["button_add"]["html_widget"]}
#    edit text widget    Create New Message Builder\n\nThis message was created using automation
#    set mandatory headers
#    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
#    :for    ${n}    in range    5
#    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
#    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    \    exit for loop if    ${message_created}
#    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    delete latest message
#
#create_message_with_spacer
#    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
#    set message name    Qa Automation Test Message
#    add widget to canvas    ${new_message_builder["button_add"]["spacer_widget"]}
#    edit text widget    Create New Message Builder\n\nThis message was created using automation
#    set mandatory headers
#    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
#    :for    ${n}    in range    5
#    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
#    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    \    exit for loop if    ${message_created}
#    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    delete latest message
#
#create_message_with_video
#    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
#    set message name    Qa Automation Test Message
#    add widget to canvas    ${new_message_builder["button_add"]["video_widget"]}
#    edit text widget    Create New Message Builder\n\nThis message was created using automation
#    set mandatory headers
#    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
#    :for    ${n}    in range    5
#    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
#    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    \    exit for loop if    ${message_created}
#    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    delete latest message
#
#create_message_with_smart_personalisation
#    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
#    set message name    Qa Automation Test Message
#    add widget to canvas    ${new_message_builder["button_add"]["smart_personalisation_widget"]}
#    edit text widget    Create New Message Builder\n\nThis message was created using automation
#    set mandatory headers
#    click element    ${new_message_builder["button_add"]["save_and_finalize"]}
#    :for    ${n}    in range    5
#    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
#    \    ${message_created}=    run keyword and return status    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    \    exit for loop if    ${message_created}
#    element should contain    ${new_message_builder["button_list"]["first_row"]}    Qa Automation Test Message
#    delete latest message
