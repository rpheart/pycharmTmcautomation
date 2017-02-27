*** Settings ***
Documentation
Library             OperatingSystem
Library             RequestsLibrary
Library             Selenium2Library    10    2
Library             XML
Library             api_functions.py

*** Variables ***
${server}       p1itgapie.emv2.com
${user}         emvqae1_api_psummers
${password}     Standard1!
${apikey}       CdX7CrRD4EeekEUMb8M_sqWXawknQfiBuQKoBs9XKa-sH0-e2hqG8dVsgUw
${template_id}
${message_id}
${segment_id}
${member_id}    1819306545  # QA member id, we need to find one for each client/environment and add it to jenkins

*** Keywords ***
Open Connection
    [Documentation]    Opens a connection to 'apiccmd/services/rest' and returns a session token to the suite
    Create Session    host    ${host}
    ${open}=    Get Request    host    /connect/open/${user}/${password}/${apikey}
    Run Keyword If    ${open.status_code} != 200    Fail    ${open.content}
    ${token}=    Get XML Content    ${open.content}
    Set Suite Variable    ${token}

Create Email
    [Documentation]    Creates an email message with defaults from the test suite and returns the message ID to the suite
    ${create_email}=    Get Request    host     /message/createEmailMessage/${token}/${name}/${description}/${subject}/${from}/${marketingFromEmail}/${to}/${body}/${encoding}/${replyTo}/${replyToEmail}/${isBounceback}/${hotmailUnsubFlg}/${hotmailUnsubUrl}
    run keyword if    ${create_email.status_code} != 200    fail    msg=${create_email.content}
    ${message_id}=    Get XML Content    ${create_email.content}
    Should Not Be Empty    ${message_id}
    Set Suite Variable    ${message_id}

Create SMS
    [Documentation]    Creates an sms message with defaults from the test suite and returns the message ID to the suite
    ${create_sms}=    Get Request    host     /message/createSmsMessage/${token}/${sms_name}/${sms_desc}/${sms_from}/${sms_body}
    run keyword if    ${create_sms.status_code} != 200    fail    msg=${create_sms.content}
    ${message_id}=    Get XML Content    ${create_sms.content}
    Should Not Be Empty    ${message_id}
    Set Suite Variable    ${message_id}

Create Template
    [Documentation]    Creates an email template with defaults from the test suite and returns the message ID to the suite
    ${create_template}=    Get Request    host     /template/create/${token}/${name}/${description}/${subject}/${from}/${fromEmail}/${to}/${encoding}/${replyTo}/${replyToEmail}/${type}
    run keyword if    ${create_template.status_code} != 200    fail    msg=${create_template.content}
    ${template_id}=    Get XML Content    ${create_template.content}
    Should Not Be Empty    ${template_id}
    Set Suite Variable    ${template_id}

create segment
    [Documentation]    creates a segment using PUT and returns the segment ID to the suite
    ${body}=    get file    Emails/API/Utils/Resources/ccmd_segment.xml
    ${headers}=    create dictionary    content-type=text/xml    charset=UTF-8
    ${create_segment}=    put request    host     /segmentationservice/${token}/segment    data=${body}    headers=${headers}
    run keyword if    ${create_segment.status_code} != 200    fail    msg=${create_segment.content}
    ${segment_id}=    get xml content    ${create_segment.content}
    should not be empty    ${segment_id}
    set suite variable    ${segment_id}

Close Connection And Delete Test Data
    [Documentation]    send a delete request for any message or segment and then close all sessions in test suite
    Close Smart Email Connection    ${host}    ${token}    message_id=${message_id}    template_id=${template_id}    segment_id=${segment_id}
    Delete All Sessions
