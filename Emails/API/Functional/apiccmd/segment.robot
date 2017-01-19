*** Settings ***
Documentation
Resource            Emails/API/Utils/api_keywords.robot
Default Tags        api    email
Test Setup          Run Keywords    Open Connection
...                 AND    create segment
Test Teardown       Close Connection And Delete Test Data

*** Variables ***
${host}    http://${server}/apiccmd/services/rest

# Email variables
${xml_file}    Emails/API/Utils/Resources/ccmd_segment.xml

*** Test Cases ***
create segment PUT
    Should Not Be Empty    ${segment_id}

Create Email Message Post
    # Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}