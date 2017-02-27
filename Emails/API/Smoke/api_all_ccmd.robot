*** Settings ***
Documentation
Resource            ../Utils/api_keywords.robot
Default Tags        api    email
Suite Setup         Open Connection
Suite Teardown      Close Connection And Delete Test Data

*** Variables ***
${host}    http://${server}/apiccmd/services/rest
${xml_file}    ${EXECDIR}/emails/api/utils/resources/email_message.xml

*** Test Cases ***
Create Message
    ${message}=    get file    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
