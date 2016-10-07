*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword    screenshot_root_directory=.
Library           create_segment.py

*** Variables ***
${screenshots}    ${EMPTY}
${server}         p1itgapie.emv2.com
${user}           emvqa_qa_api
${password}       qa11focus!
${apikey}         CdX7CrxD4EeekH9MUf0uq5PtXTEcfdysjzntS4SNd1hmLkbF

*** Test Cases ***
Create_Message
    # Hover Create and Select Message Builder
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click on Create
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/span    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li[1]    # Click on Message Builder
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=40
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    # Construct Email
    Wait Until Element Is Visible    css=#content-type-item-text > div    timeout=30
    Click Element    css=#content-type-item-text > div
    Drag and Drop    css=#content-type-item-text > div    //*[@id="message-html"]/table/tbody/tr/td/table/tbody/tr/td/div/table/tbody/tr/td/div/div/div/div/div/div/span    #css=#column-276 > div    # Drag Text Widget and drop into block
    Sleep    5
    #--- Type some text
    Click Element    css=div.content-cell.editable.text    # too complicated to use the canvas and hence very verbose steps below
    Clear Element Text    css=div.content-cell.editable.text >h2
    Clear Element Text    css=div.content-cell.editable.text \ > p
    Press Key    css=div.content-cell.editable.text    C70 \ Message Builder\n\n\nDear Tester\n\nThis Message is being testedi\nThis is a test message and will be recaved by no one.\n\n\nKind regards\n\nTested by QA
    Sleep    5
    # --- end text
    Drag and Drop    css=#content-type-item-text-image > div    css=#row-options-container > div > div.action.right    # Drag and drop
    Sleep    5
    Click Element    xpath=//*[@id="action-bar-name"]    # Select Untitled
    Sleep    5
    Click Element    css=#action-bar-inputname
    input text    action-bar-inputname    QA auto test Message    # Name the email type Testing Create New Message Builder
    Press Key    action-bar-inputname    \\09
    Sleep    5
    # ----Headers Visual ----
    Click Element    css=#editor-switch > div > div.chevron.left    # chevron left
    Sleep    5
    Press Key    xpath=//*[@id="reply-to-email"]/div[2]/input    \u0001
    Press Key    xpath=//*[@id="reply-to-email"]/div[2]/input    razart.hasaj@smartfocus.com    # Repy to:
    Sleep    2
    Press Key    xpath=//*[@id="reply-to-email"]/div[2]/input    \\09
    Press Key    xpath=//*[@id="editor-headers"]/div[4]/div[2]/input    QA auto Message    # Coment on Reply to:
    Press Key    //*[@id="editor-headers"]/div[4]/div[2]/input    \\09
    Sleep    2
    Press Key    xpath=//*[@id="editor-headers"]/div[6]/div/input    Create for QA auto test purposes    # Subject:
    Press Key    xpath=//*[@id="editor-headers"]/div[7]/div[2]/input    \\09
    # -- Save_Finalize--
    Sleep    5
    Click Element    css=#message-footer > div
    Click Element    css=#msg-editor-btnfinalise > div    # Save message
    Wait until element is visible    css=#notification-bar-container > div.notification-bar    timeout=15    # Wait for confirmation bar to appear
    run keyword and ignore error    Wait until page contains    Your message has been successfully saved.    timeout=15    # Wait for the confirmation message to appear
    Suite Teardown

Create_Segment
    #-- Open connection
    ${response_status}    ${token}=    open connection    http://${server}/apiccmd/services/rest/connect/open/${user}/${password}/${apikey}    200
    Comment    ${response_status}    ${token}=    open connection    http://${server}/apiccmd/services/rest/connect/open/${user}/${password}/${apikey}    200    # Open connection return token
    Should be equal    ${response_status}    total response is 200    # response should be 200
    #--Create Segment
    ${id}    ${create_status}    ${create_response}=    create segment    https://${server}/apiccmd/services/rest/segmentationservice/${token}/segment    200    # Create
    Should be equal    ${create_status}    total response is 200    # check email status is 200
    Should be equal    ${create_response}    success    # check response status is "success"
    #--Update Segment
    ${update_status}    ${update_response}=    update segment    https://${server}/apiccmd/services/rest/segmentationservice/${token}/segment/${id}/criteria/addStringDemographic    200
    Should be equal    ${update_response}    success    # check response status is "success"
    Should be equal    ${update_status}    total response is 200    # check email status is 200
    #--Delete Message
    Comment    ${delete_status}    ${delete_response_status}=    delete_message    https://${server}/apiccmd/services/rest/message/deleteMessage/${token_result}/${id}    200    # Delete the message
    Comment    Should be equal    ${delete_response_status}    success
    Comment    Should be equal    ${delete_status}    total response is 200
    #--Close Connection
    ${close_connection}=    close connection    https://${server}/apiccmd/services/rest/connect/close/${token}    #close connection
    Should be equal    ${close_connection}    connection closed    # check connection was closed

*** Keywords ***
Suite Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot
