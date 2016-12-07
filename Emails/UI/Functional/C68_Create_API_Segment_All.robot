*** Settings ***
Suite Teardown    Suite_Teardown
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           create_segment.py

*** Variables ***
${screenshots}    ${EMPTY}
${API_SERVER}     p4apic.emv2.com
${API_USERNAME}    auto_t4_api
${PASSWORD}       qa11focus$
${API_KEY}        CdX7CrxH-EWArlQJb8M_svCiVSoFfM6snjztS5hcAP1orkaL

*** Test Cases ***
C68_Create_API_Segment_All
    #-- Open connection
    ${response_status}    ${token}=    open connection    http://${API_SERVER}/apiccmd/services/rest/connect/open/${API_USERNAME}/${PASSWORD}/${API_KEY}    200
    Comment    ${response_status}    ${token}=    open connection    http://${server}/apiccmd/services/rest/connect/open/${user}/${password}/${apikey}    200    # Open connection return token
    Should be equal    ${response_status}    total response is 200    # response should be 200
    #--Create Segment
    ${id}    ${create_status}    ${create_response}=    create segment    https://${API_SERVER}/apiccmd/services/rest/segmentationservice/${token}/segment    200    # Create
    Should be equal    ${create_status}    total response is 200    # check email status is 200
    Should be equal    ${create_response}    success    # check response status is "success"
    #--Update Segment
    ${update_status}    ${update_response}=    update segment    https://${API_SERVER}/apiccmd/services/rest/segmentationservice/${token}/segment/${id}/criteria/addStringDemographic    200
    Should be equal    ${update_response}    success    # check response status is "success"
    Should be equal    ${update_status}    total response is 200    # check email status is 200
    #--Delete Message
    Comment    ${delete_status}    ${delete_response_status}=    delete_message    https://${API_SERVER}/apiccmd/services/rest/message/deleteMessage/${token_result}/${id}    200    # Delete the message
    Comment    Should be equal    ${delete_response_status}    success
    Comment    Should be equal    ${delete_status}    total response is 200
    #--Close Connection
    ${close_connection}=    close connection    https://${API_SERVER}/apiccmd/services/rest/connect/close/${token}    #close connection
    Should be equal    ${close_connection}    connection closed    # check connection was closed

*** Keywords ***
Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Suite_Teardown
    Close All Browsers
