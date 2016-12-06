*** Settings ***
Suite Teardown    Suite_Teardown
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword

*** Variables ***
${screenshots}    ${EMPTY}

*** Test Cases ***
Send_New_Message_Builder
    Create_Select_Message_Builder    # 3.Hover on the Create sub-tab 4.Click on Message Builder -> Add thumbnail.
    Construct_Email_Content    # 5.On the create page, drag and drop the text widget. 6.Click on the title and the body and add sample text. 7.Slide over to 'headers' and enter reply-to address and a subject
    Save_Finalize    # 8.Click on Save&Finalize
    Select_Tests_Enter_Details_Send    # 9.Click on 'Tests' from the menu on the title bar. 10.Enter an email in the recipients list 11.Select the recipient email and select the toggle button 12.Click on 'send test emails' link
    Verify_Message_Sent_Received    # 1.Verify that confirmation message is displayed on the top in the green banner 2.Verify that the email is sent and received by the recipient.
    Suite_Teardown

*** Keywords ***
Suite_Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Create_Select_Message_Builder
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click on Create
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/span    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li[1]    # Click on Message Builder
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=40
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame

Construct_Email_Content
    Wait Until Element Is Visible    css=#content-type-item-text > div    timeout=30
    Click Element    css=#content-type-item-text > div
    Drag and Drop    css=#content-type-item-text > div    //*[@id="message-html"]/table/tbody/tr/td/table/tbody/tr/td/div/table/tbody/tr/td/div/div/div/div/div/div/span    # Drag Text Widget and drop into block
    Sleep    5
    #--- Type some text
    Click Element    css=div.content-cell.editable.text    # too complicated to use the canvas and hence very verbose steps below
    Clear Element Text    css=div.content-cell.editable.text >h2
    Clear Element Text    css=div.content-cell.editable.text \ > p
    Press Key    css=div.content-cell.editable.text    Send New Message Builder\n\n\nDear Tester\n\nThis is a test message and will be recaved by no one.\n\n\nKind regards\n\nTested by QA
    Sleep    5
    # --- end text
    Drag and Drop    css=#content-type-item-text-image > div    css=#row-options-container > div > div.action.right    # Drag and drop
    Sleep    5
    Click Element    xpath=//*[@id="action-bar-name"]    # Select Untitled
    Sleep    5
    Click Element    css=#action-bar-inputname
    input text    action-bar-inputname    Test Send New Message Builder    # Name the email type
    Press Key    action-bar-inputname    \\09
    Sleep    5
    # ----Headers Visual ----
    Click Element    css=#editor-switch > div > div.chevron.left    # chevron left
    Sleep    5
    Press Key    xpath=//*[@id="reply-to-email"]/div[2]/input    \u0001
    Press Key    xpath=//*[@id="reply-to-email"]/div[2]/input    razart.hasaj@smartfocus.com    # Repy to:
    Sleep    2
    Press Key    xpath=//*[@id="reply-to-email"]/div[2]/input    \\09
    Press Key    xpath=//*[@id="editor-headers"]/div[4]/div[2]/input    SmartFocus Test    # Coment on Reply to:
    Press Key    //*[@id="editor-headers"]/div[4]/div[2]/input    \\09
    Sleep    2
    Press Key    xpath=//*[@id="editor-headers"]/div[6]/div/input    This is to confirm that the we are sending a message for testing purposes and this content should \ be ignored    # Subject:
    Press Key    xpath=//*[@id="editor-headers"]/div[7]/div[2]/input    \\09
    # -- move to Save_Finalize--

Save_Finalize
    Sleep    5
    Click Element    css=#message-footer > div
    Click Element    css=#msg-editor-btnsave    # Save message
    Wait until element is visible    css=#notification-bar-container > div.notification-bar    timeout=5    # Wait for confirmation bar to appear
    run keyword and ignore error    Wait until page contains    Your message has been successfully saved.    timeout=5    # Wait for the confirmation message to appear

Select_Tests_Enter_Details_Send
    Sleep    5
    Click Element    css=#action-bar-tests > span
    Sleep    5
    Unselect frame
    Sleep    2
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Click Element    xpath=//*[@id="palette-tests"]/div/div/div/div/div/div/div/div
    Sleep    2
    Click Element    css=#send-test-emails > div.icon    # Send email
    run keyword and ignore error    Wait until element is visible    css=#notification-bar-container > div.notification-bar    timeout=5    # wait 5 seconds for confirmation bar to be displayed
    run keyword and ignore error    Wait until page contains    Test has been sent    # Check the confirmation

Verify_Message_Sent_Received
    Unselect Frame
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click on Send
    Sleep    5
    Click Element    css=#engage-create > div.sfui-menu-dropdown > div > ul > li:nth-child(1) > ul > li:nth-child(1) > ul > li:nth-child(2)    # Click on Message list options to ensure that the created message is listed in the list page
    Sleep    10
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    10
    Element Should Contain    xpath=//*[@id="tabledivColumn-0-0"]/div    Test Send New Message Builder
