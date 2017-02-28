*** Settings ***
Documentation
Resource            ../../Utils/api_keywords.robot
Default Tags        api    email
Test Setup          run keywords    open connection
...                 AND    create email
Test Teardown       close connection and delete test data

*** Variables ***
${host}    http://${${env}_environment["api_server"]}/apiccmd/services/rest

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
create_email_message_get
    should not be empty    ${message_id}

create_email_message_post
    # create email message using post
    ${message}=    get file    ${xml_file}
    ${headers}=    create dictionary    content-type=application/xml
    ${create_message}=    post request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    get xml content    ${create_message.content}
    should not be empty    ${post_message_id}

delete_email_message
    # delete email message
    ${delete_email}=    get request    host    /message/deleteMessage/${token}/${message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}
    # get last email messages
    ${search_email}    get request    host    /message/getLastSmsMessages/${token}/10
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_id_list}=    get xml content list    ${search_email.content}
    should not contain    ${email_id_list}    ${message_id}

update_email_message
    # update email message
    ${update_email}=    get request    host    /message/updateMessage/${token}/${message_id}/name/updatedtestname
    run keyword unless    ${update_email.ok}    fail    ${update_email.content}
    # get email message
    ${get_email}=    get request    host    /message/getMessage/${token}/${message_id}
    run keyword unless    ${get_email.ok}    fail    ${get_email.content}
    ${get_email_name}=    get xml content    ${get_email.content}    tag=*name
    should be equal as strings    ${get_email_name}    updatedtestname

clone_email_message
    # clone email message
    ${clone_email}=    get request    host    /message/cloneMessage/${token}/${message_id}/messageclone
    run keyword unless    ${clone_email.ok}    fail    ${clone_email.content}
    ${clone_email_id}=    get xml content    ${clone_email.content}
    # get email message
    ${get_clone_email}=    get request    host    /message/getMessage/${token}/${clone_email_id}
    run keyword unless    ${get_clone_email.ok}    fail    ${get_clone_email.content}
    ${get_clone_email_name}=    get xml content    ${get_clone_email.content}    tag=*name
    should be equal as strings    ${get_clone_email_name}    messageclone
    # delete clone email message
    ${delete_email}=    get request    host    /message/deleteMessage/${token}/${clone_email_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

get_email_message
    # get email message
    ${get_email}=    get request    host    /message/getMessage/${token}/${message_id}
    run keyword unless    ${get_email.ok}    fail    ${search_email.content}
    ${get_email_name}=    get xml content    ${get_email.content}    tag=*name
    should be equal as strings    ${get_email_name}    ${name}

get_last_email_messages
    # get last email messages
    ${search_email}    get request    host    /message/getLastEmailMessages/${token}/10
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_id_list}=    get xml content list    ${search_email.content}
    should contain    ${email_id_list}    ${message_id}

get_email_messages_by_field
    # get email messages by field
    ${search_email}    get request    host    /message/getEmailMessageByField/${token}/name/${name}/10
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_id_list}=    get xml content list    ${search_email.content}
    should contain    ${email_id_list}    ${message_id}

get_messages_by_period
    # get messages by period
    ${start_time}=    get time    format=timestamp    time_=now - 1 hour
    ${end_time}=    get time    format=timestamp    time_=now + 1 hour
    ${search_email}    get request    host    /message/getMessagesByPeriod/${token}/${start_time}/${end_time}
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_id_list}=    get xml content list    ${search_email.content}
    should contain    ${email_id_list}    ${message_id}

get_email_message_preview
    # get email message preview
    ${search_email}    get request    host    /message/getEmailMessagePreview/${token}/${message_id}/html
    run keyword unless    ${search_email.ok}    fail    ${search_email.content}
    ${email_content}=    get xml content    ${search_email.content}
    should contain    ${email_content}    hi there

track_all_links
    # create email message using post
    ${message}=    get file    ${xml_file}
    ${headers}=    create dictionary    content-type=application/xml
    ${create_message}=    post request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    get xml content    ${create_message.content}
    should not be empty    ${post_message_id}
    # track all links
    ${track_links}    get request    host    /message/trackAllLinks/${token}/${post_message_id}
    run keyword unless    ${track_links.ok}    fail    ${track_links.content}
    ${email_content}=    get xml content    ${track_links.content}
    should be equal as integers    ${email_content}    1
    # delete email message
    ${delete_email}=    get request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

untrack_all_links
    # untrack all links
    ${untrack_links}    get request    host    /message/untrackAllLinks/${token}/${message_id}
    run keyword unless    ${untrack_links.ok}    fail    ${untrack_links.content}
    ${email_content}=    get xml content    ${untrack_links.content}
    should be equal as strings    ${email_content}    true

track_link_by_position
    # create email message using post
    ${message}=    get file    ${xml_file}
    ${headers}=    create dictionary    content-type=application/xml
    ${create_message}=    post request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    get xml content    ${create_message.content}
    should not be empty    ${post_message_id}
    # track link by position
    ${track_links}    get request    host    /message/trackLinkByPosition/${token}/${post_message_id}/1/html
    run keyword unless    ${track_links.ok}    fail    ${track_links.content}
    ${email_content}=    get xml content    ${track_links.content}
    should be equal as integers    ${email_content}    1
    # delete email message
    ${delete_email}=    get request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

untrack_link_by_order
    # create email message using post
    ${message}=    get file    ${xml_file}
    ${headers}=    create dictionary    content-type=application/xml
    ${create_message}=    post request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    get xml content    ${create_message.content}
    should not be empty    ${post_message_id}
    # untrack link by order
    ${untrack_links}    get request    host    /message/untrackLinkByOrder/${token}/${post_message_id}/1
    run keyword unless    ${untrack_links.ok}    fail    ${untrack_links.content}
    ${email_content}=    get xml content    ${untrack_links.content}
    should be equal as strings    ${email_content}    true
    # delete email message
    ${delete_email}=    get request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

get_all_tracked_links
    # create email message using post
    ${message}=    get file    ${xml_file}
    ${headers}=    create dictionary    content-type=application/xml
    ${create_message}=    post request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    get xml content    ${create_message.content}
    should not be empty    ${post_message_id}
    # track all links
    ${track_links}    get request    host    /message/trackAllLinks/${token}/${post_message_id}
    run keyword unless    ${track_links.ok}    fail    ${track_links.content}
    ${email_content}=    get xml content    ${track_links.content}
    # get all tracked links
    ${get_tracked_links}    get request    host    /message/getAllTrackedLinks/${token}/${post_message_id}
    run keyword unless    ${get_tracked_links.ok}    fail    ${get_tracked_links.content}
    ${email_content}=    get xml content list    ${get_tracked_links.content}
    should contain    ${email_content}    1
    # delete email message
    ${delete_email}=    get request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

# This test requires a message that has tracked links that are not included in the message,
# this can only be made through the UI and this test needs quite an update for that
#get_all_unused_tracked_links
#    # create email message using post
#    ${message}=    get file    ${xml_file}
#    ${headers}=    create dictionary    content-type=application/xml
#    ${create_message}=    post request    host    /message/create/${token}    data=${message}    headers=${headers}
#    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
#    ${post_message_id}=    get xml content    ${create_message.content}
#    should not be empty    ${post_message_id}
#    # track all links
#    ${track_links}    get request    host    /message/trackAllLinks/${token}/${post_message_id}
#    run keyword unless    ${track_links.ok}    fail    ${track_links.content}
#    ${email_content}=    get xml content    ${track_links.content}
#    # get all unused tracked links
#    ${get_tracked_links}    get request    host    /message/getAllUnusedTrackedLinks/${token}/${post_message_id}
#    run keyword unless    ${get_tracked_links.ok}    fail    ${get_tracked_links.content}
#    ${email_content}=    get xml content list    ${get_tracked_links.content}
#    should contain    ${email_content}    1
#    # delete email message
#    ${delete_email}=    get request    host    /message/deleteMessage/${token}/${post_message_id}
#    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

get_all_trackable_links
    # create email message using post
    ${message}=    get file    ${xml_file}
    ${headers}=    create dictionary    content-type=application/xml
    ${create_message}=    post request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    get xml content    ${create_message.content}
    should not be empty    ${post_message_id}
    # get all trackable links
    ${get_trackable_links}    get request    host    /message/getAllTrackableLinks/${token}/${post_message_id}
    run keyword unless    ${get_trackable_links.ok}    fail    ${get_trackable_links.content}
    ${email_content}=    get xml content list    ${get_trackable_links.content}
    should contain    ${email_content}    1
    # delete email message
    ${delete_email}=    get request    host    /message/deleteMessage/${token}/${post_message_id}
    run keyword unless    ${delete_email.ok}    fail    ${delete_email.content}

test_html_validity
    # test html validity
    ${validate_html}    get request    host    /message/isHtmlValid/${token}/${message_id}
    run keyword unless    ${validate_html.ok}    fail    ${validate_html.content}
    ${email_content}=    get xml content    ${validate_html.content}
    should be equal as strings    ${email_content}    true
