*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           RequestsLibrary
Library           OperatingSystem
Resource          api_keywords.robot
Default Tags      api    email
Test Setup        Run Keywords    Open Connection
...               AND    Create Email
Test Teardown     Close Connection And Delete Test Data

*** Variables ***
${host}    http://${server}/apiccmd/services/rest
${member_id}      1819306545

#-- Email variables
${xml_file}    api/data/email_message.xml
${name}    TestEmail
${description}    This%20is%20a%20test%20message
${subject}    Welcome%20to%20SmartFocus%20test%20session
${from}    SmartFocus
${marketingFromEmail}    test@emvqae1.ccemails.net
${to}    myclient
${body}    %5BEMV%20HTMLPART%5Dhi%20there%20
${encoding}    UTF-8
${replyTo}    Documentation
${replyToEmail}    documentation@smartfocus.com
${isBounceback}    0
${hotmailUnsubFlg}    1
${hotmailUnsubUrl}    www.smarfocus.com

*** Test Cases ***
Create Email Message Get
    Should Not Be Empty    ${message_id}

Create Email Message Post
    #-- Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}

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

Track All Links
    #-- Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    #-- Track All Links
    ${track_links}    Get Request    host    /message/trackAllLinks/${token}/${post_message_id}
    Run Keyword If    ${track_links.status_code} != 200    Fail    ${track_links.content}
    ${email_content}=    Get XML Content    ${track_links.content}
    should be equal as integers    ${email_content}    1
    #-- Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}

Untrack All Links
    #-- Untrack All Links
    ${untrack_links}    Get Request    host    /message/untrackAllLinks/${token}/${message_id}
    Run Keyword If    ${untrack_links.status_code} != 200    Fail    ${untrack_links.content}
    ${email_content}=    Get XML Content    ${untrack_links.content}
    should be equal as strings    ${email_content}    true

Track Link by Position
    #-- Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    #-- Track Link by Position
    ${track_links}    Get Request    host    /message/trackLinkByPosition/${token}/${post_message_id}/1/HTML
    Run Keyword If    ${track_links.status_code} != 200    Fail    ${track_links.content}
    ${email_content}=    Get XML Content    ${track_links.content}
    should be equal as integers    ${email_content}    1
    #-- Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}

Untrack Link by Order
    #-- Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    #-- Untrack Link by Order
    ${untrack_links}    Get Request    host    /message/untrackLinkByOrder/${token}/${post_message_id}/1
    Run Keyword If    ${untrack_links.status_code} != 200    Fail    ${untrack_links.content}
    ${email_content}=    Get XML Content    ${untrack_links.content}
    should be equal as strings    ${email_content}    true
    #-- Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}

Get All Tracked Links
    #-- Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    #-- Track All Links
    ${track_links}    Get Request    host    /message/trackAllLinks/${token}/${post_message_id}
    Run Keyword If    ${track_links.status_code} != 200    Fail    ${track_links.content}
    ${email_content}=    Get XML Content    ${track_links.content}
    #-- Get All Tracked Links
    ${get_tracked_links}    Get Request    host    /message/getAllTrackedLinks/${token}/${post_message_id}
    Run Keyword If    ${get_tracked_links.status_code} != 200    Fail    ${get_tracked_links.content}
    ${email_content}=    Get XML Content List    ${get_tracked_links.content}
    should contain    ${email_content}    1
    #-- Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}

#Get All Unused Tracked Links
#    #-- Create Email message using POST
#    ${message}=    Get File    ${xml_file}
#    ${headers}=    Create Dictionary    content-type=application/xml
#    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
#    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
#    ${post_message_id}=    Get XML Content    ${create_message.content}
#    Should Not Be Empty    ${post_message_id}
#    #-- Track All Links
#    ${track_links}    Get Request    host    /message/trackAllLinks/${token}/${post_message_id}
#    Run Keyword If    ${track_links.status_code} != 200    Fail    ${track_links.content}
#    ${email_content}=    Get XML Content    ${track_links.content}
#    #-- Get All Unused Tracked Links
#    ${get_tracked_links}    Get Request    host    /message/getAllUnusedTrackedLinks/${token}/${post_message_id}
#    Run Keyword If    ${get_tracked_links.status_code} != 200    Fail    ${get_tracked_links.content}
#    ${email_content}=    Get XML Content List    ${get_tracked_links.content}
#    should contain    ${email_content}    1
#    #-- Delete Email message
#    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
#    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}

Get All Trackable Links
    #-- Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    #-- Get All Trackable Links
    ${get_trackable_links}    Get Request    host    /message/getAllTrackableLinks/${token}/${post_message_id}
    Run Keyword If    ${get_trackable_links.status_code} != 200    Fail    ${get_trackable_links.content}
    ${email_content}=    Get XML Content List    ${get_trackable_links.content}
    should contain    ${email_content}    1
    #-- Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}

Test HTML Validity
    #-- Test HTML Validity
    ${validate_html}    Get Request    host    /message/isHtmlValid/${token}/${message_id}
    Run Keyword If    ${validate_html.status_code} != 200    Fail    ${validate_html.content}
    ${email_content}=    Get XML Content    ${validate_html.content}
    should be equal as strings    ${email_content}    true
