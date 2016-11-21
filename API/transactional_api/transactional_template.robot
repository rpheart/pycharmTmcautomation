*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           RequestsLibrary
Library           OperatingSystem
Resource          api_keywords.robot
Default Tags      api    email
Test Setup        Run Keywords    Open Connection
...               AND    Create Template
Test Teardown     Close Connection And Delete Test Data

*** Variables ***
${host}             http://${server}/apitransactional/services/rest
${member_id}        1819306545

# template variables
${xml_file}         api/data/email_template.xml
${name}             TemplateName
${description}      Description
${subject}          Hello
${from}             John%20Smith
${fromEmail}        john.smith%40smartfocus.com
${to}               Jane%20Scott
${encoding}         UTF-8
${replyTo}          No%20Reply
${replyToEmail}     noreply%40smartfocus.com
${type}             TRANSACTIONAL

*** Test Cases ***
Create Template Get
    Should Not Be Empty    ${template_id}

#Create Template Post
#    #-- Create template using POST
#    ${template}=    Get File    ${xml_file}
#    ${headers}=    Create Dictionary    content-type=application/x-www-form-urlencoded
#    ${create_template}=    Post Request    host    /template/create/${token}    data=${template}    headers=${headers}
#    Run Keyword If    ${create_template.status_code} != 200    Fail    ${create_template.content}
#    ${post_template_id}=    Get XML Content    ${create_template.content}
#    Should Not Be Empty    ${post_template_id}

Delete Template
    #-- Delete Template
    ${delete_template}=    Get Request    host    /template/delete/${token}/${template_id}
    Run Keyword If    ${delete_template.status_code} != 200    Fail    ${delete_template.content}
    #-- Get Last Templates
    ${search_template}    Get Request    host    /template/getLastTemplates/${token}/TRANSACTIONAL/10
    Run Keyword If    ${search_template.status_code} != 200    Fail    ${search_template.content}
    ${template_id_list}=    Get XML Content List    ${search_template.content}
    Should Not Contain    ${template_id_list}    ${template_id}

Update Template
    #-- Update Template
    ${update_template}=    Get Request    host    /template/update/${token}/${template_id}/name/UpdatedTestName
    Run Keyword If    ${update_template.status_code} != 200    Fail    ${update_template.content}
    #-- Get Template
    ${get_template}=    Get Request    host    /template/get/${token}/${template_id}
    Run Keyword If    ${get_template.status_code} != 200    Fail    ${get_template.content}
    ${get_template_name}=    Get Xml Content    ${get_template.content}    tag=*name
    Should Be Equal As Strings    ${get_template_name}    UpdatedTestName

Clone Template
    #-- Clone Template
    ${clone_template}=    Get Request    host    /template/clone/${token}/${template_id}/TemplateClone
    Run Keyword If    ${clone_template.status_code} != 200    Fail    ${clone_template.content}
    ${clone_template_id}=    Get XML Content    ${clone_template.content}
    #-- Get Template
    ${get_clone_template}=    Get Request    host    /template/get/${token}/${clone_template_id}
    Run Keyword If    ${get_clone_template.status_code} != 200    Fail    ${get_clone_template.content}
    ${get_clone_template_name}=    Get XML Content    ${get_clone_template.content}    tag=*name
    Should Be Equal As Strings    ${get_clone_template_name}    TemplateClone
    #-- Delete Clone Template
    ${delete_template}=    Get Request    host    /template/delete/${token}/${clone_template_id}
    Run Keyword If    ${delete_template.status_code} != 200    Fail    ${delete_template.content}
#
#Get Template
#    #-- Get Email Message
#    ${get_email}=    Get Request    host    /message/getMessage/${token}/${message_id}
#    Should Be Equal As Strings    ${get_email.status_code}    200
#    ${get_email_name}=    Get Xml Content    ${get_email.content}    tag=*name
#    Should Be Equal As Strings    ${get_email_name}    ${name}
#
#Get Templates
#    #-- Get Last Email Messages
#    ${search_email}    Get Request    host    /message/getLastEmailMessages/${token}/10
#    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
#    ${email_id_list}=    Get XML Content List    ${search_email.content}
#    Should contain    ${email_id_list}    ${message_id}
#
#Get Template
#    #-- Get Email Messages by Field
#    ${search_email}    Get Request    host    /message/getEmailMessageByField/${token}/name/${name}/10
#    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
#    ${email_id_list}=    Get XML Content List    ${search_email.content}
#    Should contain    ${email_id_list}    ${message_id}
#
#Get Messages by Period
#    #-- Get Messages by Period
#    ${start_time}=    Get Time    format=timestamp    time_=NOW - 1 hour
#    ${end_time}=    Get Time    format=timestamp    time_=NOW + 1 hour
#    ${search_email}    Get Request    host    /message/getMessagesByPeriod/${token}/${start_time}/${end_time}
#    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
#    ${email_id_list}=    Get XML Content List    ${search_email.content}
#    Should contain    ${email_id_list}    ${message_id}
#
#Get Email Message Preview
#    #-- Get Email Message Preview
#    ${search_email}    Get Request    host    /message/getEmailMessagePreview/${token}/${message_id}/HTML
#    Run Keyword If    ${search_email.status_code} != 200    Fail    ${search_email.content}
#    ${email_content}=    Get XML Content    ${search_email.content}
#    Should Contain    ${email_content}    hi there
#
#Track All Links
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
#    should be equal as integers    ${email_content}    1
#    #-- Delete Email message
#    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
#    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}
#
#Untrack All Links
#    #-- Untrack All Links
#    ${untrack_links}    Get Request    host    /message/untrackAllLinks/${token}/${message_id}
#    Run Keyword If    ${untrack_links.status_code} != 200    Fail    ${untrack_links.content}
#    ${email_content}=    Get XML Content    ${untrack_links.content}
#    should be equal as strings    ${email_content}    true
#
#Track Link by Position
#    #-- Create Email message using POST
#    ${message}=    Get File    ${xml_file}
#    ${headers}=    Create Dictionary    content-type=application/xml
#    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
#    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
#    ${post_message_id}=    Get XML Content    ${create_message.content}
#    Should Not Be Empty    ${post_message_id}
#    #-- Track Link by Position
#    ${track_links}    Get Request    host    /message/trackLinkByPosition/${token}/${post_message_id}/1/HTML
#    Run Keyword If    ${track_links.status_code} != 200    Fail    ${track_links.content}
#    ${email_content}=    Get XML Content    ${track_links.content}
#    should be equal as integers    ${email_content}    1
#    #-- Delete Email message
#    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
#    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}
#
#Untrack Link by Order
#    #-- Create Email message using POST
#    ${message}=    Get File    ${xml_file}
#    ${headers}=    Create Dictionary    content-type=application/xml
#    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
#    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
#    ${post_message_id}=    Get XML Content    ${create_message.content}
#    Should Not Be Empty    ${post_message_id}
#    #-- Untrack Link by Order
#    ${untrack_links}    Get Request    host    /message/untrackLinkByOrder/${token}/${post_message_id}/1
#    Run Keyword If    ${untrack_links.status_code} != 200    Fail    ${untrack_links.content}
#    ${email_content}=    Get XML Content    ${untrack_links.content}
#    should be equal as strings    ${email_content}    true
#    #-- Delete Email message
#    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
#    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}
#
#Get All Tracked Links
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
#    #-- Get All Tracked Links
#    ${get_tracked_links}    Get Request    host    /message/getAllTrackedLinks/${token}/${post_message_id}
#    Run Keyword If    ${get_tracked_links.status_code} != 200    Fail    ${get_tracked_links.content}
#    ${email_content}=    Get XML Content List    ${get_tracked_links.content}
#    should contain    ${email_content}    1
#    #-- Delete Email message
#    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
#    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}
#
##Get All Unused Tracked Links
##    #-- Create Email message using POST
##    ${message}=    Get File    ${xml_file}
##    ${headers}=    Create Dictionary    content-type=application/xml
##    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
##    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
##    ${post_message_id}=    Get XML Content    ${create_message.content}
##    Should Not Be Empty    ${post_message_id}
##    #-- Track All Links
##    ${track_links}    Get Request    host    /message/trackAllLinks/${token}/${post_message_id}
##    Run Keyword If    ${track_links.status_code} != 200    Fail    ${track_links.content}
##    ${email_content}=    Get XML Content    ${track_links.content}
##    #-- Get All Unused Tracked Links
##    ${get_tracked_links}    Get Request    host    /message/getAllUnusedTrackedLinks/${token}/${post_message_id}
##    Run Keyword If    ${get_tracked_links.status_code} != 200    Fail    ${get_tracked_links.content}
##    ${email_content}=    Get XML Content List    ${get_tracked_links.content}
##    should contain    ${email_content}    1
##    #-- Delete Email message
##    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
##    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}
#
#Get All Trackable Links
#    #-- Create Email message using POST
#    ${message}=    Get File    ${xml_file}
#    ${headers}=    Create Dictionary    content-type=application/xml
#    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
#    Run Keyword If    ${create_message.status_code} != 200    Fail    ${create_message.content}
#    ${post_message_id}=    Get XML Content    ${create_message.content}
#    Should Not Be Empty    ${post_message_id}
#    #-- Get All Trackable Links
#    ${get_trackable_links}    Get Request    host    /message/getAllTrackableLinks/${token}/${post_message_id}
#    Run Keyword If    ${get_trackable_links.status_code} != 200    Fail    ${get_trackable_links.content}
#    ${email_content}=    Get XML Content List    ${get_trackable_links.content}
#    should contain    ${email_content}    1
#    #-- Delete Email message
#    ${delete_email}=    Get Request    host    /message/deleteMessage/${token}/${post_message_id}
#    Run Keyword If    ${delete_email.status_code} != 200    Fail    ${delete_email.content}
#
#Test HTML Validity
#    #-- Test HTML Validity
#    ${validate_html}    Get Request    host    /message/isHtmlValid/${token}/${message_id}
#    Run Keyword If    ${validate_html.status_code} != 200    Fail    ${validate_html.content}
#    ${email_content}=    Get XML Content    ${validate_html.content}
#    should be equal as strings    ${email_content}    true

*** Keywords ***
Provided precondition
    Setup system under test