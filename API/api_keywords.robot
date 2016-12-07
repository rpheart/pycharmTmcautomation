*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           RequestsLibrary
Library           api_functions.py

*** Variables ***
${server}    p1itgapie.emv2.com
${user}    emvqae1_api_psummers
${password}    Standard1!
${apikey}    CdX7CrRD4EeekEUMb8M_sqWXawknQfiBuQKoBs9XKa-sH0-e2hqG8dVsgUw
${template_id}
${message_id}

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
    Run Keyword If    ${create_email.status_code} != 200    Fail    ${create_email.content}
    ${message_id}=    Get XML Content    ${create_email.content}
    Should Not Be Empty    ${message_id}
    Set Suite Variable    ${message_id}

Create SMS
    [Documentation]    Creates an sms message with defaults from the test suite and returns the message ID to the suite
    ${create_sms}=    Get Request    host     /message/createSmsMessage/${token}/${sms_name}/${sms_desc}/${sms_from}/${sms_body}
    Should Be Equal As Strings    ${create_sms.status_code}    200
    ${message_id}=    Get XML Content    ${create_sms.content}
    Should Not Be Empty    ${message_id}
    Set Suite Variable    ${message_id}

Create Template
    [Documentation]    Creates an email template with defaults from the test suite and returns the message ID to the suite
    ${create_template}=    Get Request    host     /template/create/${token}/${name}/${description}/${subject}/${from}/${fromEmail}/${to}/${encoding}/${replyTo}/${replyToEmail}/${type}
    Should Be Equal As Strings    ${create_template.status_code}    200
    ${template_id}=    Get XML Content    ${create_template.content}
    Should Not Be Empty    ${template_id}
    Set Suite Variable    ${template_id}

Close Connection And Delete Test Data
    [Documentation]    send a delete request for any message or segment and then close all sessions in test suite
    Close Smart Email Connection    ${host}    ${token}    message_id=${message_id}    template_id=${template_id}
    Delete All Sessions
