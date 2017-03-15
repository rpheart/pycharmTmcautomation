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
    set selenium speed    0.2
    open browser    ${${env}["ui_server"]}    ${browser}
    maximize browser window
    page should contain    Login To Your Account:
    input text    IDToken1    ${${env}["ui_username"]}
    input password    IDToken2    ${${env}["ui_password"]}
    click link    name=Login.Submit

go to ${page}
    [Documentation]    opens the product under test (i.e. Personalisation or Email)
    select window    ${document_title}
    wait until keyword succeeds    15x    1 sec    click element    ${page}

open content
    [Documentation]    opens the page leading to the feature to be tested (i.e. Create > Template)
    [Arguments]    ${content_dictionary}      ${page}
    select window    ${document_title}
    :for    ${n}    in range    5
    \    mouse over    ${content_dictionary["menu"]}
    \    ${status}    ${message}=    run keyword and ignore error    click element    ${page}
    \    exit for loop if    '${status}' == 'PASS'
    run keyword and ignore error    dismiss alert
    mouse over    ${smartfocus_logo}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}

create a segment
    [Documentation]
    open connection
    create segment
    ${headers}=    create dictionary    content-type=text/xml    charset=UTF-8
    ${moina}=    set variable    <?xml version="1.0" encoding="utf-8"?><stringDemographicCriteria><groupName>GROUP 1</groupName><groupNumber>1</groupNumber><columnName>EMAIL</columnName><operator>CONTAINS</operator><values>moina.farheen@smartfocus.com</values></stringDemographicCriteria>
    ${patrick}=    set variable    <?xml version="1.0" encoding="utf-8"?><stringDemographicCriteria><groupName>GROUP 1</groupName><groupNumber>1</groupNumber><columnName>EMAIL</columnName><operator>CONTAINS</operator><values>patrick.summers@smartfocus.com</values></stringDemographicCriteria>
    ${kseniya}=    set variable    <?xml version="1.0" encoding="utf-8"?><stringDemographicCriteria><groupName>GROUP 1</groupName><groupNumber>1</groupNumber><columnName>EMAIL</columnName><operator>CONTAINS</operator><values>kseniya.domorad@smartfocus.com</values></stringDemographicCriteria>
    @{emails}=    create list    ${moina}    ${patrick}    ${kseniya}

    :for    ${email}    in    @{emails}
    \    ${update_segment}=    put request    host    /segmentationservice/${token}/segment/${segment_id}/criteria/addStringDemographic    data=${email}    headers=${headers}
    \    run keyword unless    ${update_segment.ok}    fail    ${update_segment.content}

    delete all sessions
