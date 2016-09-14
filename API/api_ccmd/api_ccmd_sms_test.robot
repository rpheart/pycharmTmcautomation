*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           api_ccmd_sms_tests.py

*** Variables ***
${server}         p1itgapie.emv2.com
${user}           emvqa_qa_api
${password}       qa11focus!
${apikey}         CdX7CrxD4EeekH9MUf0uq5PtXTEcfdysjzntS4SNd1hmLkbF

*** Test Cases ***
api_ccmd_sms_test
    #-- Open connection
    ${open_response_status}    ${open_status}    ${token_result}=    open connection    http://${server}/apiccmd/services/rest/connect/open/${user}/${password}/${apikey}    200    # Open connection return token
    Should be equal    ${open_response_status}    total response is 200    # response should be 200
    Should be equal    ${open_status}    success    # check open connection response status is 'success'
    #-- Create SMS message
    ${create_sms_status}    ${create_sms_response_status}    ${id}    create_sms_request    https://${server}/apiccmd/services/rest/message/create/${token_result}    200
    Should be equal    ${create_sms_status}    total response is 200    # check sms status is 200
    Should be equal    ${create_sms_response_status}    success    # check sms response status is "success"
    #-- Update SMS message
    ${update_sms_status}    ${update_sms_response_status}    update_sms_request    https://${server}/apiccmd/services/rest/message/updateMessage/${token_result}/${id}/name/edited_name    200
    Should be equal    ${update_sms_status}    total response is 200    # check sms status is 200
    Should be equal    ${update_sms_response_status}    success    # check sms response status is "success"
    #-- Clone SMS message
    ${clone_sms_status}    ${clone_sms_response_status}    ${clone_id}    clone_sms_request    https://${server}/apiccmd/services/rest/message/cloneMessage/${token_result}/${id}/cloned_sms    200
    Should be equal    ${update_sms_status}    total response is 200    # check sms status is 200
    Should be equal    ${update_sms_response_status}    success    # check sms response status is "success"
    #-- Get last SMS messages
    ${get_last_sms_status}    ${get_last_sms_response_status}    get_last_sms_request    https://${server}/apiccmd/services/rest/message/getLastSmsMessages/${token_result}/2    200    # gets last 2 messages, original and clone
    Should be equal    ${get_last_sms_status}    total response is 200    # check sms status is 200
    Should be equal    ${get_last_sms_response_status}    success    # check sms response status is "success"
    #-- Get SMS messages by field
    ${get_sms_field_status}    ${get_sms_field_response_status}    get_sms_field_request    https://${server}/apiccmd/services/rest/message/getSmsMessagesByField/${token_result}/name/name/2    200    # gets messages that have 'name' in their name
    Should be equal    ${get_sms_field_status}    total response is 200    # check sms status is 200
    Should be equal    ${get_sms_field_response_status}    success    # check sms response status is "success"
    #-- Get SMS message preview
    ${get_sms_preview_status}    ${get_sms_preview_response_status}    get_sms_preview_request    https://${server}/apiccmd/services/rest/message/getSmsMessagePreview/${token_result}/${id}    200    # preview message by token
    Should be equal    ${get_sms_preview_status}    total response is 200    # check sms status is 200
    Should be equal    ${get_sms_preview_response_status}    success    # check sms response status is "success"
    #-- Delete SMS message
    ${delete_sms_status}    ${delete_sms_response_status}    delete_sms_request    https://${server}/apiccmd/services/rest/message/deleteMessage/${token_result}/${id}    200    # delete original message
    Should be equal    ${delete_sms_status}    total response is 200    # check sms status is 200
    Should be equal    ${delete_sms_response_status}    success    # check sms response status is "success"
    #-- Delete cloned SMS message
    ${delete_sms_status}    ${delete_sms_response_status}    delete_sms_request    https://${server}/apiccmd/services/rest/message/deleteMessage/${token_result}/${clone_id}    200    # delete cloned message
    Should be equal    ${delete_sms_status}    total response is 200    # check sms status is 200
    Should be equal    ${delete_sms_response_status}    success    # check sms response status is "success"
    #--Close Connection
    ${close_connection}=    close connection    https://${server}/apiccmd/services/rest/connect/close/${token_result}    #close connection
    Should be equal    ${close_connection}    connection closed    # check connection was closed
