*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           RequestsLibrary
Resource          api_keywords.robot
Test Setup        Run Keywords    Open Connection
...               AND    Create Email
Test Teardown     Close Connection And Delete Test Data

*** Variables ***
${host}    http://${server}/apiccmd/services/rest
${member_id}      1819306545

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
Create Email Message
    Should Not Be Empty    ${message_id}

Delete Email Message
    #-- Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${message_id}
    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}
    #-- Get Last Email Messages
    ${search_email}    Get Request    host    /message/getLastSmsMessages/${token}/10
    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
    ${email_id_list}=    Get XML Content List    ${search_email.content}
    Should Not Contain    ${email_id_list}    ${message_id}

Update Email Message
    #-- Update Email Message
    ${update_email}=    Get Request    host    /message/updateMessage/${token}/${message_id}/name/UpdatedTestName
    Run Keyword If    ${update_email.status_code} != 200    Fail    ${update_email.content}
    #-- Get Email Message
    ${get_email}=    Get Request    host    /message/getMessage/${token}/${message_id}
    Run Keyword If    ${get_email.status_code} != 200    Fail    ${get_email.content}
    ${get_email_name}=    Get Xml Content    ${get_email.content}    tag=*name
    Should Be Equal As Strings    ${get_email_name}    UpdatedTestName

Clone Email Message
    #-- Clone Email Message
    ${clone_email}=    Get Request    host    /message/cloneMessage/${token}/${message_id}/MessageClone
    Run Keyword If    ${clone_email.status_code} != 200    Fail    ${clone_email.content}
    ${clone_email_id}=    Get XML Content    ${clone_email.content}
    #-- Get Email Message
    ${get_clone_email}=    Get Request    host    /message/getMessage/${token}/${clone_email_id}
    Run Keyword If    ${get_clone_email.status_code} != 200    Fail    ${get_clone_email.content}
    ${get_clone_email_name}=    Get XML Content    ${get_clone_email.content}    tag=*name
    Should Be Equal As Strings    ${get_clone_email_name}    MessageClone
    #-- Delete Clone Email Message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${clone_email_id}
    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}

Get Email Message
    #-- Get Email Message
    ${get_email}=    Get Request    host    /message/getMessage/${token}/${message_id}
    Should Be Equal As Strings    ${get_email.status_code}    200
    ${get_email_name}=    Get Xml Content    ${get_email.content}    tag=*name
    Should Be Equal As Strings    ${get_email_name}    ${name}

Get Last Email Messages
    #-- Get Last Email Messages
    ${search_email}    Get Request    host    /message/getLastEmailMessages/${token}/10
    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
    ${email_id_list}=    Get XML Content List    ${search_email.content}
    Should contain    ${email_id_list}    ${message_id}

Get Email Messages by Field
    #-- Get Email Messages by Field
    ${search_email}    Get Request    host    /message/getEmailMessageByField/${token}/name/${name}/10
    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
    ${email_id_list}=    Get XML Content List    ${search_email.content}
    Should contain    ${email_id_list}    ${message_id}

Get Messages by Period
    #-- Get Messages by Period
    ${start_time}=    Get Time    format=timestamp    time_=NOW - 1 hour
    ${end_time}=    Get Time    format=timestamp    time_=NOW + 1 hour
    ${search_email}    Get Request    host    /message/getMessagesByPeriod/${token}/${start_time}/${end_time}
    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
    ${email_id_list}=    Get XML Content List    ${search_email.content}
    Should contain    ${email_id_list}    ${message_id}

Get Email Message Preview
    #-- Get Email Message Preview
    ${search_email}    Get Request    host    /message/getEmailMessagePreview/${token}/${message_id}/HTML
    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
    ${email_content}=    Get XML Content    ${search_email.content}
    Should Contain    ${email_content}    hi there
