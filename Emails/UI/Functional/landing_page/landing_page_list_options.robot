*** Settings ***
Documentation       tests for creating different types of landing pages
Default Tags        ui    email    landing_page
Resource            ../../Utils/email_keywords.robot
Resource            ../../Utils/landing_page.robot
Resource            ../../Utils/subscriber.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
...                 AND    create and schedule basic landing page
Suite Teardown      close all browsers

*** Test Cases ***
edit_landing_page
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_list"]["first_row"]}
    click element    ${landing_page["button_list"]["edit"]}
    element should be visible    ${landing_page["button_add"]["add_a_row"]}

landing_page_properties
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_list"]["first_row"]}
    click element    ${landing_page["button_list"]["properties"]}
    element should be visible    ${landing_page["button_add"]["landing_page_url"]}

preview_landing_page
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_list"]["first_row"]}
    click element    ${landing_page["button_list"]["preview"]}
    wait until keyword succeeds    15x    1 sec    select window    title=Preview: Untitled
    current frame contains    Preview this page by device:
    close window
    select window    ${document_title}

landing_page_statistics
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_list"]["first_row"]}
    click element    ${landing_page["button_list"]["statistics"]}
    current frame contains    Landing page activity over time

duplicate_landing_page
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_list"]["first_row"]}
    click element    ${landing_page["button_list"]["duplicate"]}
    input text    ${landing_page["button_list"]["rename_input"]}    COPY
    click element    ${landing_page["button_list"]["yes"]}
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_list"]["first_row"]}
    element should contain    ${landing_page["button_list"]["first_row"]}    COPY

delete_landing_page
    delete latest landing page
