*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           RequestsLibrary
Library           api_functions.py

*** Variables ***
${server}    p1itgapie.emv2.com
${user}    emvqae1_api_psummers
${password}    Standard1!
${apikey}    CdX7CrRD4EeekEUMb8M_sqWXawknQfiBuQKoBs9XKa-sH0-e2hqG8dVsgUw

*** Keywords ***
Open Connection
    #-- Open Connection
    Create Session    host    ${host}
    ${open}=    Get Request    host    /connect/open/${user}/${password}/${apikey}
    Run Keyword If    ${open.status_code} != 200    Fail    ${open.content}
    ${token}=    Get XML Content    ${open.content}
    Set Suite Variable    ${token}

Create Email
    #-- Create Email message
    ${create_email}=    Get Request    host     /message/createEmailMessage/${token}/${name}/${description}/${subject}/${from}/${fromEmail}/${to}/${body}/${encoding}/${replyTo}/${replyToEmail}/${isBounceback}/${hotmailUnsubFlg}/${hotmailUnsubUrl}
    Run Keyword If    ${create_email.status_code} != 200    Fail    ${create_email.content}
    ${message_id}=    Get XML Content    ${create_email.content}
    Should Not Be Empty    ${message_id}
    Set Suite Variable    ${message_id}

Create SMS
    #-- Create SMS message
    ${create_sms}=    Get Request    host     /message/createSmsMessage/${token}/${sms_name}/${sms_desc}/${sms_from}/${sms_body}
    Should Be Equal As Strings    ${create_sms.status_code}    200
    ${message_id}=    Get XML Content    ${create_sms.content}
    Should Not Be Empty    ${message_id}
    Set Suite Variable    ${message_id}

Close Connection And Delete Test Data
    Close Smart Email Connection    ${host}    ${token}    message_id=${message_id}
    Delete All Sessions
