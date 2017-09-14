*** Settings ***
Documentation
Resource            ../../Utils/api_keywords.robot
Default Tags        api    sms
Test Setup          run keywords    open connection
...                 AND    create sms
Test Teardown       close connection and delete test data

*** Variables ***
${host}           http://${${env}["api_server"]}/apiccmd/services/rest

# SMS variables
${xml_file}       ${EXECDIR}/Emails/API/Utils/Resources/sms_message.xml
${sms_name}       TestName
${sms_desc}       APIauto
${sms_from}       SmartFocus
${sms_body}       %5BEMV%20SMSPART%5DSMS%20creation%20test%20by%20API

*** Test Cases ***
create_sms_message
    should not be empty    ${message_id}

create_sms_message_post
    # create sms message using post
    ${message}=    get file    ${xml_file}
    ${headers}=    create dictionary    content-type=application/xml
    ${create_message}=    post request    host    /message/create/${token}    data=${message}    headers=${headers}
    run keyword unless    ${create_message.ok}    fail    ${create_message.content}
    ${post_message_id}=    get xml content    ${create_message.content}
    should not be empty    ${post_message_id}

delete_sms_message
    # delete sms message
    ${delete_sms}=    get request    host    /message/deleteMessage/${token}/${message_id}
    run keyword unless    ${delete_sms.ok}    fail    ${delete_sms.content}
    # get last sms messages
    ${search_sms}    get request    host    /message/getLastSmsMessages/${token}/10
    run keyword unless    ${search_sms.ok}    fail    ${search_sms.content}
    ${sms_id_list}=    get xml content list    ${search_sms.content}
    should not contain    ${sms_id_list}    ${message_id}

update_sms_message
    # update sms message
    ${update_sms}=    get request    host    /message/updateMessage/${token}/${message_id}/name/updatedtestname
    run keyword unless    ${update_sms.ok}    fail    ${update_sms.content}
    # get sms message
    ${get_sms}=    get request    host    /message/getMessage/${token}/${message_id}
    run keyword unless    ${get_sms.ok}    fail    ${get_sms.content}
    ${sms_get_name}=    get xml content    ${get_sms.content}    tag=*name
    should be equal as strings    ${sms_get_name}    updatedtestname

clone_sms_message
    # clone sms message
    ${clone_sms}=    get request    host    /message/cloneMessage/${token}/${message_id}/messageclone
    run keyword unless    ${clone_sms.ok}    fail    ${clone_sms.content}
    ${clone_sms_id}=    get xml content    ${clone_sms.content}
    # get sms message
    ${get_clone_sms}=    get request    host    /message/getMessage/${token}/${clone_sms_id}
    run keyword unless    ${get_clone_sms.ok}    fail    ${get_clone_sms.content}
    ${get_clone_sms_name}=    get xml content    ${get_clone_sms.content}    tag=*name
    should be equal as strings    ${get_clone_sms_name}    messageclone
    # delete clone sms message
    ${delete_sms}=    get request    host    /message/deleteMessage/${token}/${clone_sms_id}
    run keyword unless    ${delete_sms.ok}    fail    ${delete_sms.content}

get_sms_message
    # get message
    ${get_sms}=    get request    host    /message/getMessage/${token}/${message_id}
    run keyword unless    ${get_sms.ok}    fail    ${get_sms.content}
    ${get_sms_name}=    get xml content    ${get_sms.content}    tag=*name
    should be equal as strings    ${get_sms_name}    ${sms_name}

get_last_sms_messages
    # get last sms messages
    ${search_sms}    get request    host    /message/getLastSmsMessages/${token}/10
    run keyword unless    ${search_sms.ok}    fail    ${search_sms.content}
    ${sms_id_list}=    get xml content list    ${search_sms.content}
    should contain    ${sms_id_list}    ${message_id}

get_sms_messages_by_field
    # get sms messages by field
    ${search_sms}    get request    host    /message/getSmsMessagesByField/${token}/name/${sms_name}/10
    run keyword unless    ${search_sms.ok}    fail    ${search_sms.content}
    ${sms_id_list}=    get xml content list    ${search_sms.content}
    should contain    ${sms_id_list}    ${message_id}

get_messages_by_period
    # get messages by period
    ${start_time}=    get time    format=timestamp    time_=now - 2 hour
    ${start_time}=    replace string    ${start_time}    ${space}    %20
    ${end_time}=    get time    format=timestamp    time_=now + 2 hour
    ${end_time}=    replace string    ${end_time}    ${space}    %20
    ${search_sms}    get request    host    /message/getMessagesByPeriod/${token}/${start_time}/${end_time}
    run keyword unless    ${search_sms.ok}    fail    ${search_sms.content}
    ${sms_id_list}=    get xml content list    ${search_sms.content}
    should contain    ${sms_id_list}    ${message_id}

get_sms_message_preview
    # get sms message preview
    ${search_sms}    get request    host    /message/getSmsMessagePreview/${token}/${message_id}
    run keyword unless    ${search_sms.ok}    fail    ${search_sms.content}
    ${sms_content}=    get xml content    ${search_sms.content}
    should be equal as strings    ${sms_content}    SMS creation test by API

test_sms_message
    # test sms message
    ${send_sms}    get request    host    /message/testSmsMessage/${token}/${message_id}/${member_id}/testcampaign
    run keyword unless    ${send_sms.ok}    fail    ${send_sms.content}
    ${send_content}=    get xml content    ${send_sms.content}
    should be equal as strings    ${send_content}    true
