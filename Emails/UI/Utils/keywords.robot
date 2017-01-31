*** Settings ***
Documentation       Suite description
Library             Selenium2Library    10    2    run_on_failure=fail keyword    screenshot_root_directory=.
Library             OperatingSystem
Variables           variables.py

*** Variables ***
# test variables
${screenshots}

# login variables
${ui_server}        https://qa-sfui.themessagecloud.com
${ui_username}      sidev_auto
${ui_password}      qa11focus1.
${browser}          chrome

*** Keywords ***
fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

login
    [Documentation]    Logs in to the message cloud
    open browser    ${ui_server}    ${browser}
    maximize browser window
    page should contain    Login To Your Account:
    input text    IDToken1    ${ui_username}
    input password    IDToken2    ${ui_password}
    click link    name=Login.Submit
    wait until element is visible    ${smart_focus_logo}    timeout=30

go to ${page}
    [Documentation]
    select window    ${document_title}    # Select main frame
    click element    ${page}
    wait until element is visible    ${navigation_bar}    timeout=30

open content
    [Documentation]
    [Arguments]    ${content_dictionary}      ${page}
    select window    ${document_title}    # Select main frame
    wait until element is visible    ${content_dictionary["menu"]}    timeout=30
    mouse over    ${content_dictionary["menu"]}
    wait until element is visible    ${page}    timeout=30
    click element    ${page}
    mouse over    ${smartfocus_logo}
    wait until element is visible    ${navigation_bar}    timeout=30
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}

send classic test message
    [Documentation]
    @{emails}=    create list    qa.auto@smartfocus.com    qa.test@smartfocus.com
    Select Frame    ${generics["popup_window"]}
    wait until page contains    Message Send Test    timeout=30
    Input text    ${generics["campaign_name_input"]}    Add two emails for testing    # Type 'Test Campaign name'

    # add emails to 'Test Recipients' and to the QA_auto group
    :for    ${email}    in    @{emails}
    \    Input text    ${generics["new_test_email_input"]}    ${email}    # Input New Test Email
    \    Click Element    ${generics["add_criteria_button"]}    # Add email to 'Test recipients list'

    # ensure members are part of group
    select from list    ${generics["test_group_dropdown"]}    QA_auto    # Select Group 'QA_auto'
    select Checkbox    ${generics["email_checkbox_qa_test"]}
    select Checkbox    ${generics["email_checkbox_qa_auto"]}
    Click Element    ${generics["update_button"]}    # Update Group

    # send test email to group
    select from list    ${generics["test_group_dropdown"]}    QA_auto    # Select Group 'QA_auto'
    Click Element    ${generics["send_test_button"]}    # Send a Tests
    wait until page contains    You will receive your test email shortly    timeout=30
    click element    ${generics["close_button"]}