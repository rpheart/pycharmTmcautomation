*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword    screenshot_root_directory=.

*** Variables ***
${screenshots}    ${EMPTY}

*** Test Cases ***
Create_New_Message_Builder
    Hover_Create_Select_Message_Builder    # 3.Hover on the Create sub-tab 4.Click on Message Builder -> Add thumbnail.
    Construct_Email_Content    # 5.On the create page, drag and drop the text widget. 6.Click on the title and the body and add sample text. 7.Slide over to 'headers' and enter reply-to address and a subject
    Save_Finalize    # 8.Click on Save&Finalize
    Verify_Confirmation_Message    #1.Verify that a confirmation message is displayed on a green banner on the top that the message is saved 2.Click on Message list option to ensue that the created message is listed in the list page. 3.Click on the message from the list page to verify the content of the message and the headers set.
    Suite Teardown

*** Keywords ***
Suite Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Hover_Create_Select_Message_Builder
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
    Press Key    css=div.content-cell.editable.text    Create New Message Builder\n\n\nDear Tester\n\nThis is Create New Message Builder\nThis is a test message and will be recaved by no one.\n\n\nKind regards\n\nTested by QA
    Sleep    5
    # --- end text
    Drag and Drop    css=#content-type-item-text-image > div    css=#row-options-container > div > div.action.right    # Drag and drop
    Sleep    5
    Click Element    xpath=//*[@id="action-bar-name"]    # Select Untitled
    Sleep    5
    Click Element    css=#action-bar-inputname
    input text    action-bar-inputname    Testing Create New Message Builder    # Name the email type Testing Create New Message Builder
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
    Press Key    xpath=//*[@id="editor-headers"]/div[6]/div/input    Confirmation that we are able to automate create message and save. Ignore this content !!!    # Subject:
    Press Key    xpath=//*[@id="editor-headers"]/div[7]/div[2]/input    \\09
    # -- move to Save_Finalize--

Save_Finalize
    Sleep    5
    Click Element    css=#message-footer > div
    Click Element    css=#msg-editor-btnsave    # Save message
    Wait until element is visible    css=#notification-bar-container > div.notification-bar    timeout=5    # Wait for confirmation bar to appear
    run keyword and ignore error    Wait until page contains    Your message has been successfully saved.    timeout=5    # Wait for the confirmation message to appear

Verify_Confirmation_Message
    Unselect Frame
    Sleep    5
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click on Send
    Sleep    5
    Click Element    css=#engage-create > div.sfui-menu-dropdown > div > ul > li:nth-child(1) > ul > li:nth-child(1) > ul > li:nth-child(2)    # Click on Message list options to ensure that the created message is listed in the list page
    Sleep    10
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    5
    Element Should Contain    xpath=//*[@id="tabledivColumn-0-0"]/div    Testing Create New Message Builder
    Sleep    5
