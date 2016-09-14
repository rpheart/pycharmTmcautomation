*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           api_ccmd_email_test.py

*** Variables ***
${server}         p1itgapie.emv2.com
${user}           emvqa_qa_api
${password}       qa11focus!
${apikey}         CdX7CrxD4EeekH9MUf0uq5PtXTEcfdysjzntS4SNd1hmLkbF

*** Test Cases ***
api_ccmd_email_test
    #-- Open connection
    ${response_status}    ${token_result}=    open connection    http://${server}/apiccmd/services/rest/connect/open/${user}/${password}/${apikey}    200    # Open connection return token
    Should be equal    ${response_status}    total response is 200    # response should be 200
    #--Send email request
    ${id}    ${email_status}    ${email_response_status}=    send email request    https://${server}/apiccmd/services/rest/message/create/${token_result}    200    # Send email via API
    Should be equal    ${email_response_status}    success    # check email response status is "success"
    Should be equal    ${email_status}    total response is 200    # check email status is 200
    #-- Send SMS request
    ${sms_status}    ${sms_response_status}=    send_scm_request    https://${server}/apiccmd/services/rest/message/create/${token_result}    200
    Should be equal    ${sms_response_status}    success    # check sms response status is "success"
    Should be equal    ${sms_status}    total response is 200    # check sms status is 200
    #-- Clone Message
    ${clone_status}    ${clone_message_status}=    clone_message    https://${server}/apiccmd/services/rest/message/cloneMessage/${token_result}/${id}/NewMessageName    200    # Clone message
    Should be equal    ${clone_message_status}    success    # check clone message status is "success"
    Should be equal    ${clone_status}    total response is 200    # check clone status is 200
    #-- Get Last Email Messages
    ${last_email_status}    ${last_email_message_status}=    get_last_email_messages    https://${server}/apiccmd/services/rest/message/getLastEmailMessages/${token_result}/3    200    # Get last three messages
    Should be equal    ${last_email_message_status}    success
    Should be equal    ${last_email_status}    total response is 200
    #--Get Email Message Preview
    ${preview_status}    ${email_message_preview_status}=    get_email_message_preview    https://${server}/apiccmd/services/rest/message/getEmailMessagePreview/${token_result}/${id}/HTML    200
    Should be equal     ${email_message_preview_status}    success
    Should be equal    ${preview_status}    total response is 200
    #-- Delete Message
    ${delete_status}    ${delete_response_status}=    delete_message    https://${server}/apiccmd/services/rest/message/deleteMessage/${token_result}/${id}    200    # Delete the message
    Should be equal    ${delete_response_status}    success
    Should be equal    ${delete_status}    total response is 200
    #--Close Connection
    ${close_connection}=    close connection    https://${server}/apiccmd/services/rest/connect/close/${token_result}    #close connection
    Should be equal    ${close_connection}    connection closed    # check connection was closed
