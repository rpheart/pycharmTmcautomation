*** Settings ***
Documentation       contains variables and keywords for the email ui test suite
Resource            ../../API/Utils/api_keywords.robot
Resource            ../../../Utils/keywords.robot
Variables           email_variables.py

*** Variables ***

*** Keywords ***
open content
    [Documentation]    opens the page leading to the feature to be tested (i.e. Create > Template)
    [Arguments]    ${content_dictionary}      ${page}
    select window    ${document_title}
    :for    ${n}    in range    5
    \    mouse over    ${content_dictionary["menu"]}
    \    ${status}    ${message}=    run keyword and ignore error    click element    ${page}
    \    exit for loop if    '${status}' == 'PASS'
    ${status}=    run keyword and return status    mouse over    ${smartfocus_logo}
    run keyword unless    ${status}    run keywords
    ...    dismiss alert
    ...    AND    mouse over    ${smartfocus_logo}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible  //*

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
