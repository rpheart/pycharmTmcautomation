*** Settings ***
Documentation
Resource            ../../Utils/api_keywords.robot
Default Tags        api    email
Test Setup          run keywords    open connection
...                 AND    create email
Test Teardown       close connection and delete test data

*** Variables ***
${host}    http://${server}/apiccmd/services/rest

# Email variables
${xml_file}    ${EXECDIR}/Emails/API/Utils/Resources/email_message.xml
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
    # Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}

Delete Email Message
    # Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}
    # Get Last Email Messages
    ${search_email}    Get Request    host    /message/getLastSmsMessages/${token}/10
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_id_list}=    Get XML Content List    ${search_email.content}
    Should Not Contain    ${email_id_list}    ${message_id}

Update Email Message
    # Update Email Message
    ${update_email}=    Get Request    host    /message/updateMessage/${token}/${message_id}/name/UpdatedTestName
    run keyword unless    ${update_email.ok}    fail    ${update_email.content}
    # Get Email Message
    ${get_email}=    Get Request    host    /message/getMessage/${token}/${message_id}
    run keyword unless    ${get_email.ok}    fail    ${get_email.content}
    ${get_email_name}=    Get Xml Content    ${get_email.content}    tag=*name
    Should Be Equal As Strings    ${get_email_name}    UpdatedTestName

Clone Email Message
    # Clone Email Message
    ${clone_email}=    Get Request    host    /message/cloneMessage/${token}/${message_id}/MessageClone
    run keyword unless    ${clone_email.ok}    fail    ${clone_email.content}
    ${clone_email_id}=    Get XML Content    ${clone_email.content}
    # Get Email Message
    ${get_clone_email}=    Get Request    host    /message/getMessage/${token}/${clone_email_id}
    run keyword unless    ${get_clone_email.ok}    fail    ${get_clone_email.content}
    ${get_clone_email_name}=    Get XML Content    ${get_clone_email.content}    tag=*name
    Should Be Equal As Strings    ${get_clone_email_name}    MessageClone
    # Delete Clone Email Message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${clone_email_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

Get Email Message
    # Get Email Message
    ${get_email}=    Get Request    host    /message/getMessage/${token}/${message_id}
    run keyword unless    ${get_email.ok}    fail    ${search_email.content}
    ${get_email_name}=    Get Xml Content    ${get_email.content}    tag=*name
    Should Be Equal As Strings    ${get_email_name}    ${name}

Get Last Email Messages
    # Get Last Email Messages
    ${search_email}    Get Request    host    /message/getLastEmailMessages/${token}/10
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_id_list}=    Get XML Content List    ${search_email.content}
    Should contain    ${email_id_list}    ${message_id}

Get Email Messages by Field
    # Get Email Messages by Field
    ${search_email}    Get Request    host    /message/getEmailMessageByField/${token}/name/${name}/10
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_id_list}=    Get XML Content List    ${search_email.content}
    Should contain    ${email_id_list}    ${message_id}

Get Messages by Period
    # Get Messages by Period
    ${start_time}=    Get Time    format=timestamp    time_=NOW - 1 hour
    ${end_time}=    Get Time    format=timestamp    time_=NOW + 1 hour
    ${search_email}    Get Request    host    /message/getMessagesByPeriod/${token}/${start_time}/${end_time}
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_id_list}=    Get XML Content List    ${search_email.content}
    Should contain    ${email_id_list}    ${message_id}

Get Email Message Preview
    # Get Email Message Preview
    ${search_email}    Get Request    host    /message/getEmailMessagePreview/${token}/${message_id}/HTML
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_content}=    Get XML Content    ${search_email.content}
    Should Contain    ${email_content}    hi there

Track All Links
    # Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    # Track All Links
    ${track_links}    Get Request    host    /message/trackAllLinks/${token}/${post_message_id}
    run keyword unless    ${track_links.ok}    fail    ${track_links.content}
    ${email_content}=    Get XML Content    ${track_links.content}
    should be equal as integers    ${email_content}    1
    # Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

Untrack All Links
    # Untrack All Links
    ${untrack_links}    Get Request    host    /message/untrackAllLinks/${token}/${message_id}
    run keyword unless    ${untrack_links.ok}    fail    ${untrack_links.content}
    ${email_content}=    Get XML Content    ${untrack_links.content}
    should be equal as strings    ${email_content}    true

Track Link by Position
    # Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    # Track Link by Position
    ${track_links}    Get Request    host    /message/trackLinkByPosition/${token}/${post_message_id}/1/HTML
    run keyword unless    ${track_links.ok}    fail    ${track_links.content}
    ${email_content}=    Get XML Content    ${track_links.content}
    should be equal as integers    ${email_content}    1
    # Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

Untrack Link by Order
    # Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    # Untrack Link by Order
    ${untrack_links}    Get Request    host    /message/untrackLinkByOrder/${token}/${post_message_id}/1
    run keyword unless    ${untrack_links.ok}    fail    ${untrack_links.content}
    ${email_content}=    Get XML Content    ${untrack_links.content}
    should be equal as strings    ${email_content}    true
    # Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

Get All Tracked Links
    # Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    # Track All Links
    ${track_links}    Get Request    host    /message/trackAllLinks/${token}/${post_message_id}
    run keyword unless    ${track_links.ok}    fail    ${track_links.content}
    ${email_content}=    Get XML Content    ${track_links.content}
    # Get All Tracked Links
    ${get_tracked_links}    Get Request    host    /message/getAllTrackedLinks/${token}/${post_message_id}
    run keyword unless    ${get_tracked_links.ok}    fail    ${get_tracked_links.content}
    ${email_content}=    Get XML Content List    ${get_tracked_links.content}
    should contain    ${email_content}    1
    # Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

# This test requires a message that has tracked links that are not included in the message,
# this can only be made through the UI and this test needs quite an update for that
#Get All Unused Tracked Links
#    # Create Email message using POST
#    ${message}=    Get File    ${xml_file}
#    ${headers}=    Create Dictionary    content-type=application/xml
#    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
#    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
#    ${post_message_id}=    Get XML Content    ${create_message.content}
#    Should Not Be Empty    ${post_message_id}
#    # Track All Links
#    ${track_links}    Get Request    host    /message/trackAllLinks/${token}/${post_message_id}
#    run keyword unless    ${track_links.ok}    fail    ${track_links.content}
#    ${email_content}=    Get XML Content    ${track_links.content}
#    # Get All Unused Tracked Links
#    ${get_tracked_links}    Get Request    host    /message/getAllUnusedTrackedLinks/${token}/${post_message_id}
#    run keyword unless    ${get_tracked_links.ok}    fail    ${get_tracked_links.content}
#    ${email_content}=    Get XML Content List    ${get_tracked_links.content}
#    should contain    ${email_content}    1
#    # Delete Email message
#    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
#    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

Get All Trackable Links
    # Create Email message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}
    # Get All Trackable Links
    ${get_trackable_links}    Get Request    host    /message/getAllTrackableLinks/${token}/${post_message_id}
    run keyword unless    ${get_trackable_links.ok}    fail    ${get_trackable_links.content}
    ${email_content}=    Get XML Content List    ${get_trackable_links.content}
    should contain    ${email_content}    1
    # Delete Email message
    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

Test HTML Validity
    # Test HTML Validity
    ${validate_html}    Get Request    host    /message/isHtmlValid/${token}/${message_id}
    run keyword unless    ${validate_html.ok}    fail    ${validate_html.content}
    ${email_content}=    Get XML Content    ${validate_html.content}
    should be equal as strings    ${email_content}    true