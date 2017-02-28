*** Settings ***
Documentation       contains variables and keywords for the email ui test suite
Library             Collections
Library             OperatingSystem
Library             Selenium2Library    15    15    run_on_failure=fail keyword
Library             String
Resource            ../../API/Utils/api_keywords.robot
Variables           variables.py
Variables           ../../Utils/credentials.py

*** Variables ***
# test variables
${screenshots}    ${EMPTY}

# login variables
${env}=         preprod
${browser}      chrome

*** Keywords ***
fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

login
    [Documentation]    Logs in to the message cloud
    open browser    ${${env}_environment["ui_server"]}    ${browser}
    maximize browser window
    page should contain    Login To Your Account:
    input text    IDToken1    ${${env}_environment["ui_username"]}
    input password    IDToken2    ${${env}_environment["ui_password"]}
    click link    name=Login.Submit

go to ${page}
    [Documentation]
    select window    ${document_title}    # Select main frame
    wait until keyword succeeds    15x    1 sec    click element    ${page}

open content
    [Documentation]
    [Arguments]    ${content_dictionary}      ${page}
    select window    ${document_title}    # Select main frame
    wait until keyword succeeds    15x    1 sec    mouse over    ${content_dictionary["menu"]}
    wait until keyword succeeds    15x    1 sec    click element    ${page}
    wait until keyword succeeds    15x    1 sec    mouse over    ${smartfocus_logo}
    wait until keyword succeeds    15x    1 sec    select frame    ${iframes["top"]}
    wait until keyword succeeds    15x    1 sec    select frame    ${iframes["ccmd"]}

send classic test message
    [Documentation]
    @{emails}=    create list    qa.auto@smartfocus.com    qa.test@smartfocus.com
    select frame    ${generics["popup_window"]}
    wait until page contains    Message Send Test
    input text    ${generics["campaign_name_input"]}    Add two emails for testing    # Type 'Test Campaign name'

    # add emails to 'Test Recipients' and to the QA_auto group
    :for    ${email}    in    @{emails}
    \    input text    ${generics["new_test_email_input"]}    ${email}    # Input New Test Email
    \    click element    ${generics["add_criteria_button"]}    # Add email to 'Test recipients list'

    # ensure members are part of group
    select from list    ${generics["test_group_dropdown"]}    QA_auto    # Select Group 'QA_auto'
    select checkbox    ${generics["email_checkbox_qa_test"]}
    select checkbox    ${generics["email_checkbox_qa_auto"]}
    click element    ${generics["update_button"]}    # Update Group

    # send test email to group
    select from list    ${generics["test_group_dropdown"]}    QA_auto    # Select Group 'QA_auto'
    click element    ${generics["send_test_button"]}    # Send a Test
    wait until page contains    You will receive your test email shortly    timeout=30
    click element    ${generics["close_button"]}

create a segment
    [Documentation]
    open connection
    create segment
    ${headers}=    create dictionary    content-type=text/xml    charset=UTF-8
    ${moina}=    set variable    <?xml version="1.0" encoding="utf-8"?><stringDemographicCriteria><columnName>EMAIL</columnName><operator>CONTAINS</operator><values>moina.farheen@smartfocus.com</values></stringDemographicCriteria>
    ${patrick}=    set variable    <?xml version="1.0" encoding="utf-8"?><stringDemographicCriteria><columnName>EMAIL</columnName><operator>CONTAINS</operator><values>patrick.summers@smartfocus.com</values></stringDemographicCriteria>
    ${kseniya}=    set variable    <?xml version="1.0" encoding="utf-8"?><stringDemographicCriteria><columnName>EMAIL</columnName><operator>CONTAINS</operator><values>kseniya.domorad@smartfocus.com</values></stringDemographicCriteria>
    @{emails}=    create list    ${moina}    ${patrick}    ${kseniya}

    :for    ${email}    in    @{emails}
    \    ${update_segment}=    put request    host    /segmentationservice/${token}/segment/${segment_id}/criteria/addStringDemographic    data=${email}    headers=${headers}
    \    run keyword unless    ${update_segment.ok}    fail    ${update_segment.content}

    delete all sessions
