*** Settings ***
Documentation
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           RequestsLibrary
Library           XML
Library           OperatingSystem
Default Tags      api    email
Resource          api_keywords.robot

*** Variables ***
${host}    http://${server}/apiccmd/services/rest
${xml_file}    api/data/email_message.xml

*** Test Cases ***
Login
    Open Connection

Create Message
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}

