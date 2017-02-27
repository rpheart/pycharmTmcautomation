*** Settings ***
Documentation
Resource            ../../Utils/api_keywords.robot
Default Tags        api    sms
Test Setup          run keywords    open connection
...                 AND    create sms
Test Teardown       close connection and delete test data

*** Variables ***
${host}           http://${server}/apiccmd/services/rest

# SMS variables
${xml_file}       ${EXECDIR}/Emails/API/Utils/Resources/sms_message.xml
${sms_name}       TestName
${sms_desc}       APIauto
${sms_from}       SmartFocus
${sms_body}       %5BEMV%20SMSPART%5DSMS%20creation%20test%20by%20API

*** Test Cases ***
Create SMS Message
    Should Not Be Empty    ${message_id}

Create SMS Message Post
    # Create SMS message using POST
    ${message}=    Get File    ${xml_file}
    ${headers}=    Create Dictionary    content-type=application/xml
    ${create_message}=    Post Request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    Get XML Content    ${create_message.content}
    Should Not Be Empty    ${post_message_id}

Delete SMS Message
    # Delete SMS message
    ${delete_sms}=    Get Request    host    /message/deleteMessage/${token}/${message_id}
    Should Be Equal As Strings    ${delete_sms.status_code}    200

    # Get Last SMS Messages
    ${search_sms}    Get Request    host    /message/getLastSmsMessages/${token}/10
    Should Be Equal As Strings    ${search_sms.status_code}    200
    ${sms_id_list}=    Get XML Content List    ${search_sms.content}
    Should Not Contain    ${sms_id_list}    ${message_id}

Update SMS Message
    # Update SMS Message
    ${update_sms}=    Get Request    host    /message/updateMessage/${token}/${message_id}/name/UpdatedTestName
    Should Be Equal As Strings    ${update_sms.status_code}    200
    # Get SMS Message
    ${get_sms}=    Get Request    host    /message/getMessage/${token}/${message_id}
    Should Be Equal As Strings    ${get_sms.status_code}    200
    ${sms_get_name}=    Get Xml Content    ${get_sms.content}    tag=*name
    Should Be Equal As Strings    ${sms_get_name}    UpdatedTestName

Clone SMS Message
    # Clone SMS Message
    ${clone_sms}=    Get Request    host    /message/cloneMessage/${token}/${message_id}/MessageClone
    Should Be Equal As Strings    ${clone_sms.status_code}    200
    ${clone_sms_id}=    Get XML Content    ${clone_sms.content}
    # Get SMS Message
    ${get_clone_sms}=    Get Request    host    /message/getMessage/${token}/${clone_sms_id}
    Should Be Equal As Strings    ${get_clone_sms.status_code}    200
    ${get_clone_sms_name}=    Get XML Content    ${get_clone_sms.content}    tag=*name
    Should Be Equal As Strings    ${get_clone_sms_name}    MessageClone
    # Delete Clone SMS Message
    ${delete_sms}=    Get Request    host    /message/deleteMessage/${token}/${clone_sms_id}
    Should Be Equal As Strings    ${delete_sms.status_code}    200

Get SMS Message
    # Get Message
    ${get_sms}=    Get Request    host    /message/getMessage/${token}/${message_id}
    Should Be Equal As Strings    ${get_sms.status_code}    200
    ${get_sms_name}=    Get Xml Content    ${get_sms.content}    tag=*name
    Should Be Equal As Strings    ${get_sms_name}    ${sms_name}

Get Last SMS Messages
    # Get Last SMS Messages
    ${search_sms}    Get Request    host    /message/getLastSmsMessages/${token}/10
    Should Be Equal As Strings    ${search_sms.status_code}    200
    ${sms_id_list}=    Get XML Content List    ${search_sms.content}
    Should contain    ${sms_id_list}    ${message_id}

Get SMS Messages by Field
    # Get SMS Messages by Field
    ${search_sms}    Get Request    host    /message/getSmsMessagesByField/${token}/name/${sms_name}/10
    Should Be Equal As Strings    ${search_sms.status_code}    200
    ${sms_id_list}=    Get XML Content List    ${search_sms.content}
    Should contain    ${sms_id_list}    ${message_id}

Get Messages by Period
    # Get Messages by Period
    ${start_time}=    Get Time    format=timestamp    time_=NOW - 1 hour
    ${end_time}=    Get Time    format=timestamp    time_=NOW + 1 hour
    ${search_sms}    Get Request    host    /message/getMessagesByPeriod/${token}/${start_time}/${end_time}
    Should Be Equal As Strings    ${search_sms.status_code}    200
    ${sms_id_list}=    Get XML Content List    ${search_sms.content}
    Should contain    ${sms_id_list}    ${message_id}

Get SMS Message Preview
    # Get SMS Message Preview
    ${search_sms}    Get Request    host    /message/getSmsMessagePreview/${token}/${message_id}
    Should Be Equal As Strings    ${search_sms.status_code}    200
    ${sms_content}=    Get XML Content    ${search_sms.content}
    Should Be Equal As Strings    ${sms_content}    SMS creation test by API

Test SMS Message
    # Test SMS Message
    ${send_sms}    Get Request    host    /message/testSmsMessage/${token}/${message_id}/${member_id}/TestCampaign
    Should Be Equal As Strings    ${send_sms.status_code}    200
    ${send_content}=    Get XML Content    ${send_sms.content}
    Should Be Equal As Strings    ${send_content}    true