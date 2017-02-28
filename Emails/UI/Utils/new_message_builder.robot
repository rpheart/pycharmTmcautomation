*** Settings ***
Documentation    Keywords specifi to the creation of messages using the new builder

*** Keywords ***
set message name
    [Arguments]    ${name}
    wait until keyword succeeds    15x    1 sec    click element    ${new_message_builder["button_add"]["message_name"]}
    wait until keyword succeeds    15x    1 sec    click element    ${new_message_builder["button_add"]["message_name_input"]}
    press key    ${new_message_builder["button_add"]["message_name_input"]}    \u0001    # Select All
    press key    ${new_message_builder["button_add"]["message_name_input"]}    \\127    # Delete
    input text    ${new_message_builder["button_add"]["message_name_input"]}    ${name}
    press key    ${new_message_builder["button_add"]["message_name_input"]}    \\13    # Return

add widget to canvas
    [Arguments]    ${widget}
    run keyword and ignore error    click element    ${new_message_builder["button_add"]["visual"]}

    :for    ${n}    in range    5
    \    ${content_open}=    run keyword and return status    element should be visible    //*[@id="content-palette"]/div/div/div[@class='close']
    \    exit for loop if    ${content_open}
    \    click element    ${new_message_builder["button_add"]["add_content"]}

    :for    ${n}    in range    5
    \    ${widget_visible}=    run keyword and return status    element should be visible    ${widget}
    \    exit for loop if    ${widget_visible}
    \    run keyword and ignore error    click element    //div[@class='carousel-container']/div[@class='carousel']/div[@class='chevron left']
    \    run keyword and ignore error    click element    ${new_message_builder["button_add"]["basic"]}

    ${dropped}=    run keyword and return status    wait until keyword succeeds    15x    1 sec    drag and drop    ${widget}    ${new_message_builder["button_add"]["empty_canvas"]}
    run keyword unless    ${dropped}    run keywords
    ...    click element    ${new_message_builder["button_add"]["add_empty_row"]}
    ...    AND    wait until keyword succeeds    15x    1 sec    click element    ${widget}
    ...    AND    wait until keyword succeeds    15x    1 sec    drag and drop    ${widget}    ${new_message_builder["button_add"]["empty_canvas"]}

set mandatory headers
    # get to the headers page
    wait until keyword succeeds    15x    1 sec    click element    ${new_message_builder["button_add"]["chevron_left"]}
    wait until keyword succeeds    15x    1 sec    click element    ${new_message_builder["button_add"]["headers"]}
    # fill out header info
    press key    ${new_message_builder["button_add"]["reply_to_email"]}    \u0001    # Select All
    press key    ${new_message_builder["button_add"]["reply_to_email"]}    \\127    # Delete
    input text    ${new_message_builder["button_add"]["reply_to_email"]}    test@test.com
    input text    ${new_message_builder["button_add"]["subject"]}    Test Subject

send test emails
    [Arguments]    ${email}
    # open the panel
    :for    ${n}    in range    10
    \    ${tests_open}=    run keyword and return status    element should be visible    ${new_message_builder["button_add"]["test_panel"]}
    \    exit for loop if    ${test_open}
    \    click element    ${new_message_builder["button_add"]["tests"]}
    # check if email is already added
    wait until keyword succeeds    15x   1 sec    input text     ${generics["search_input"]}    ${email}
    ${can_add_email}=    run keyword and return status    element should be enabled    ${new_message_builder["button_add"]["add_recipients"]}
    run keyword if    ${can_add_email}    run keywords
    ...    wait until keyword succeeds    15x   1 sec    click element    ${new_message_builder["button_add"]["add_recipients"]}
    ...    ELSE    run keywords
    ...    wait until keyword succeeds    15x   1 sec    click element    ${new_message_builder["button_add"]["first_test_email_slider"]}
    wait until keyword succeeds    15x   1 sec    click element    ${new_message_builder["button_add"]["send_test_emails"]}
