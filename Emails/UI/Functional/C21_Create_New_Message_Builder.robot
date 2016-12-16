*** Settings ***
Documentation
Resource            ../Utils/keywords.robot

*** Variables ***
${content_block}    ${EMPTY}

*** Test Cases ***
login and go to create new message (new message builder)
    Login
    Go To ${System_Page["email"]}
    Open Content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}

#Create_Select_Message_Builder
    #Click Element    ${new_message_builder["menu"]}    # Click on Create
    #Wait until Element Is Visible    ${new_message_builder["button_add"]["add"]}    timeout=5
    #Click Element    ${new_message_builder["button_add"]["add"]}    # Click on Message Builder
    # Wait Until element Is Visible    ${iframes["top"]}    timeout=40
    # Select frame    ${iframes["top"]}    #Click on main frame
    # Wait Until element Is Visible    ${iframes["ccmd"]}
    # Select Frame    ${iframes["ccmd"]}    # Click on inner frame

Construct_Email_Content
    Wait Until Element Is Visible    ${new_message_builder["button_add"]["text_widget"]}    timeout=30
    Click Element    ${new_message_builder["button_add"]["text_widget"]}
    Drag and Drop    ${new_message_builder["button_add"]["text_widget"]}  css=#row-options-container > div > div.action.right # Drag Text Widget and drop into block
    Sleep    5
    #--- Type some text
    Click Element    ${new_message_builder["button_add"]["text_content_box"]}    # too complicated to use the canvas and hence very verbose steps below
    Clear Element Text    css=div.content-cell.editable.text >h2
    Clear Element Text    css=div.content-cell.editable.text \ > p
    Press Key    ${new_message_builder["button_add"]["text_content_box"]}    Create New Message Builder\n\n\nDear Tester\n\nThis is Create New Message Builder\nThis is a test message and will be recaved by no one.\n\n\nKind regards\n\nTested by QA
    Sleep    5
    # --- end text
    #Drag and Drop    ${new_message_builder["button_add"]["image_widget"]}   ${new_message_builder["button_add"]["drop_widgets"]}    # css=#row-options-container > div > div.action.right    # Drag and drop
    #Sleep    5
    Click Element    id=action-bar-name    # Select Untitled
    #Sleep    5
    Click Element    ${new_message_builder["button_add"]["message_name_bar_input"]}    # css=#action-bar-inputname
    input text    ${new_message_builder["button_add"]["message_name_bar_input"]}    QA auto test Message    # action-bar-inputname # Name the email type Testing Create New Message Builder
    Press Key    ${new_message_builder["button_add"]["message_name_bar_input"]}    \\09    # action-bar-inputname
    Sleep    5
    # ----Headers Visual ----
    Click Element    ${new_message_builder["button_add"]["chevron_left"]}    # chevron left
    Sleep    5
    Press Key    ${new_message_builder["button_add"]["reply_to_input"]}    \u0001
    Press Key    ${new_message_builder["button_add"]["reply_to_input"]}    razart.hasaj@smartfocus.com    # Reply to:
    Sleep    2
    Press Key    ${new_message_builder["button_add"]["reply_to_input"]}    \\09
    Press Key    ${new_message_builder["button_add"]["reply_to_comment_input"]}    Auto Test Message Builder    # Coment on Reply to:
    Press Key    ${new_message_builder["button_add"]["reply_to_comment_input"]}    \\09
    Sleep    2
    Press Key    ${new_message_builder["button_add"]["subject_line_input"]}    Confirmation that we are able to automate create message and save. Ignore this content !!!    # Subject:
    Press Key    xpath=//*[@id="editor-headers"]/div[7]/div[2]/input    \\09
    # -- move to Save_Finalize--

Save_Finalize
    Sleep    5
    Click Element    ${new_message_builder["button_add"]["footer"]}
    Click Element    ${new_message_builder["button_add"]["save_and_finalize_button"]}    # Save message
    Wait until element is visible    ${new_message_builder["button_add"]["notification_bar"]}    timeout=15    # Wait for confirmation bar to appear
    run keyword and ignore error    Wait until page contains    Your message has been successfully saved.    timeout=15    # Wait for the confirmation message to appear

Verify_Confirmation_Message
    Unselect Frame
    Sleep    5
    Click Element    ${new_message_builder["menu"]}    # xpath=//*[@id="engage-create"]/div[1]    # Click on Send
    Sleep    5
    Click Element    ${new_message_builder["button_list"]["list"]}    # Click on Message list options to ensure that the created message is listed in the list page
    Sleep    10
    Select frame    ${iframes["top"]}    #Click on main frame
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Element Should Contain    ${new_message_builder["button_list"]["check_message_created]}    QA auto test Message
    Sleep    5

Suite_Teardown
    Close All Browsers
