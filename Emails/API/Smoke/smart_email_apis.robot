*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           RequestsLibrary
Resource          api_keywords.robot

*** Variables ***
${server}    t1api-globalx.emv2.com
${user}    emvqae1_api_psummers
${password}    Standard1!
${apikey}    CdX7CrRD4EeekEUMb8M_sqWXawknQfiBuQKoBs9XKa-sH0-e2hqG8dVsgUw
${host}    https://${server}/smartemail/v1
${email_id}
${member_id}      1819306545
${token}

#-- Email variables
${name}    TestEmail
${description}    This%20is%20a%20test%20message
${subject}    Welcome%20to%20SmartFocus%20test%20session
${from}    SmartFocus
${fromEmail}    test@emvqae1.ccemails.net
${to}    myclient
${body}    %5BEMV%20HTMLPART%5Dhi%20there
${encoding}    UTF-8
${replyTo}    Documentation
${replyToEmail}    documentation@smartfocus.com
${isBounceback}    0
${hotmailUnsubFlg}    1
${hotmailUnsubUrl}    www.smarfocus.com



*** Test Cases ***
Login
    Create Session    host    ${host}
    ${params}=    Create Dictionary    login=${user}    password=${password}    apiKey=${apikey}
    ${params}=    evaluate    json.dumps(${params})    json
    ${open}=    Post Request    host    /authorization    data=${params}
    Run Keyword If    ${open.status_code} != 200    Fail    ${open.content}
    ${json}=    To Json    ${open.content}
    ${token}=    Get From Dictionary    ${json}    token
    Set Suite Variable    ${token}

Get Messages
    ${authorisation}=    base_64_encode    ${token}    prefix=Basic
    ${get_messages}=    Get Request    host    /messages?_sort=-creationDate&_expand=items.name    headers=${authorisation}
    Run Keyword If    ${get_messages.status_code} != 200    Fail    ${get_messages.content}


*** Keywords ***
Close Connection And Delete Test Data
    Close Smart Email Connection    ${host}    ${token}    message_id=${email_id}
    Delete All Sessions
