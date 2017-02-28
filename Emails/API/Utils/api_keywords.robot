*** Settings ***
Documentation
Library             OperatingSystem
Library             RequestsLibrary
Library             Selenium2Library    10    2
Library             XML
Library             api_functions.py
Variables           ../../Utils/credentials.py

*** Variables ***
${env}=             preprod
${template_id}
${message_id}
${segment_id}
${member_id}        1819306545  # TODO QA member id, we need to find one for each client/environment and add it to jenkins

*** Keywords ***
open_connection
    [Documentation]    opens a connection to 'apiccmd/services/rest' and returns a session token to the suite
    create session    host    ${host}
    ${open}=    get request    host    /connect/open/${${env}_environment["api_user"]}/${${env}_environment["api_password"]}/${${env}_environment["api_key"]}
    run keyword unless    ${open.ok}    fail    ${open.content}
    ${token}=    get xml content    ${open.content}
    set suite variable    ${token}

create_email
    [Documentation]    creates an email message with defaults from the test suite and returns the message ID to the suite
    ${create_email}=    get request    host     /message/createEmailMessage/${token}/${name}/${description}/${subject}/${from}/${marketingFromEmail}/${to}/${body}/${encoding}/${replyTo}/${replyToEmail}/${isBounceback}/${hotmailUnsubFlg}/${hotmailUnsubUrl}
    run keyword unless    ${create_email.ok}    fail    ${create_email.content}
    ${message_id}=    get xml content    ${create_email.content}
    should not be empty    ${message_id}
    set suite variable    ${message_id}

create_sms
    [Documentation]    creates an sms message with defaults from the test suite and returns the message ID to the suite
    ${create_sms}=    get request    host     /message/createSmsMessage/${token}/${sms_name}/${sms_desc}/${sms_from}/${sms_body}
    run keyword unless    ${create_sms.ok}    fail    ${create_sms.content}
    ${message_id}=    get xml content    ${create_sms.content}
    should not be empty    ${message_id}
    set suite variable    ${message_id}

create_template
    [Documentation]    creates an email template with defaults from the test suite and returns the message ID to the suite
    ${create_template}=    get request    host     /template/create/${token}/${name}/${description}/${subject}/${from}/${fromEmail}/${to}/${encoding}/${replyTo}/${replyToEmail}/${type}
    run keyword unless    ${create_template.ok}    fail    ${create_template.content}
    ${template_id}=    get xml content    ${create_template.content}
    should not be empty    ${template_id}
    set suite variable    ${template_id}

create_segment
    [Documentation]    creates a segment using PUT and returns the segment ID to the suite
    ${body}=    get file    Emails/API/Utils/Resources/ccmd_segment.xml
    ${headers}=    create dictionary    content-type=text/xml    charset=UTF-8
    ${create_segment}=    put request    host     /segmentationservice/${token}/segment    data=${body}    headers=${headers}
    run keyword unless    ${create_segment.ok}    fail    ${create_segment.content}
    ${segment_id}=    get xml content    ${create_segment.content}
    should not be empty    ${segment_id}
    set suite variable    ${segment_id}

close_connection_and_delete_test_data
    [Documentation]    send a delete request for any message or segment and then close all sessions in test suite
    close smart email connection    ${host}    ${token}    message_id=${message_id}    template_id=${template_id}    segment_id=${segment_id}
    delete all sessions
