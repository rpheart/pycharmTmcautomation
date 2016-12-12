*** Settings ***
Documentation       creates new content block, updates, puts in the message (classic builder), sends the test message
Resource            ../Utils/keywords.robot

*** Variables ***
${dynamic_content_ID}    ${EMPTY}

*** Test Cases ***
login and go to create content block
    Login
    Go To ${System_Page["email"]}
    Open Content    ${content_block}    ${content_block["button_add"]}

add message text save confirm
    # Create message
    input text    ${content_block["content_block_name"]}    QA auto Content Block    # Add Content Block name
    input text    ${content_block["content_block_description"]}    QA auto Content Block for testing only    # Add description
    Wait until element is visible    ${content_block["toolbox_table"]}
    Sleep    2
    Click Element    ${generics["text_box"]}
    Sleep    2
    Click Element    ${generics["link_management"]}    # Click Link Management
    Sleep    2
    Select frame    ${generics["popup_window"]}
    Sleep    8
    Double Click Element    ${generics["create_advanced_link"]}
    Wait until Element is Visible    ${generics["mirror_link"]}    timeout=7
    Mouse Over    ${generics["mirror_link"]}    # Select 'Mirror Link'
    Click Element    ${generics["mirror_link"]}
    Sleep    3
    Wait until element is visible    ${generics["button_save_add_link"]}    timeout=10
    Click Element    ${generics["button_save_add_link"]}    # Choice2: Save/Add Link
    Sleep    2
    Unselect frame
    Select frame    ${iframes["top"]}    #Click on main frame
    Select frame    ${iframes["ccmd"]}
    Click Element    ${generics["close_box"]}    # Close pupup window
    Sleep    2
    Click Element    ${generics["save_button"]}    # Save
    Sleep    2
    Choose ok on Next confirmation    # Say 'Ok' to alert
    Confirm Action    # Confirm Alert action
    Sleep    2
    #- go to Message

add dynamic content block
    #- Add Dynamic content block
    Sleep    2
    Unselect frame
    Wait Until Element Is Visible    ${classic_message_builder["menu"]}
    Click Element    ${classic_message_builder["menu"]}
    Sleep    2
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]}
    Click Element    ${classic_message_builder["button_add"]}    # Click: \ Message
    Sleep    2
    Wait until element is visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}
    Wait until element is visible    ${iframes["ccmd"]}    timeout=5
    select frame    ${iframes["ccmd"]}
    Wait until page contains    Your Message Body Below
    Click Element    ${generics["text_box"]}    # Click on Text area
    Sleep    2
    Click Element    ${generics["insert_dynamic_content_block"]}    # Select 'Insert Dynamic Content Block' link
    Sleep    2
    Select Frame    ${generics["popup_window"]}    # From the popup select top option by ID
    Sleep    7
    ${dynamic_content_ID}=    Get Text    ${content_block["grab_id_from_popup"]}    # Grab ID from popup
    Set Global Variable    ${dynamic_content_ID}
    Click Element    ${generics["button_add_criteria"]}    # Select that mirror
    Sleep    2
    Unselect frame
    Select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    Input text    ${generics["text_box"]}    [EMV TEXTPART][EMV HTMLPART]<html><body>QA auto Content Block test<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Attach content
    Sleep    5
    Click Element    ${generics["save_button"]}
    Sleep    5
    Choose ok on Next confirmation    # Say 'Ok' to alert
    Confirm Action    # Confirm Alert action
    Sleep    2
    Input Text    ${classic_message_builder["create"]["message_name_input"]}    QA auto Content Block mirror    # Add Title
    Input Text    ${classic_message_builder["create"]["message_description_input"]}    Qa auto mirror for testing only    # Add description
    Input Text    ${classic_message_builder["create"]["message_from_input"]}    qa.auto@smartfocus.com    # Message from
    Input Text    ${classic_message_builder["create"]["message_to_input"]}    qa.auto@smartfocus.com    # Message to
    Input Text    ${classic_message_builder["create"]["message_reply_to_email"]}    qa.test@smartfocus.com    # Reply to
    Click Element    ${generics["save_button"]}    # Save
    Sleep    5

check content block preview create
    #-Check 'HTML' content
    Click Element    ${classic_message_builder["create"]["button_messages_list"]}
    Sleep    5
    Click Element    ${generics["preview_button"]}    # Click preview
    Sleep    2
    Click Element    ${classic_message_builder["create"]["button_html_source"]}    # Switch to HTML content
    Sleep    2
    Element Should Contain    ${classic_message_builder["create"]["html_content_box"]}    <html><body>QA auto Content Block test<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Validate content
    capture page screenshot    # Take screenshot
    Sleep    2

edit content block
    # Edit Message
    Click Element    ${classic_message_builder["create"]["button_messages_list"]}    # Click 'Messages'
    Sleep    2
    Click Element    ${generics["edit_button"]}    # Click 'Edit'
    Sleep    2
    Wait Until Element Is Visible    ${generics["text_box"]}    timeout=15
    Clear Element text    ${generics["text_box"]}    # Clear textarea
    Sleep    2
    input text    ${generics["text_box"]}    [EMV TEXTPART][EMV HTMLPART]<html><body>QA auto Content Block 'Edit' Test complete<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Modify text in text content area
    Sleep    2
    Click Element    ${generics["save_button"]}    # Click on 'Save'
    Sleep    2

check content block preview edit
    #-Check 'HTML' content
    Click Element    ${classic_message_builder["create"]["button_messages_list"]}    # Click 'Messages'
    Sleep    5
    Click Element    ${generics["preview_button"]}    # Click Preview
    Sleep    2
    Click Element    ${classic_message_builder["create"]["button_html_source"]}    # Switch to HTML
    Sleep    2
    Element Should Contain    ${classic_message_builder["create"]["html_content_box"]}    <html><body>QA auto Content Block 'Edit' Test complete<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Validate content
    capture page screenshot    # Take a screenshot
    Sleep    2

copy content block
    # Copy Content Block
    Click Element    ${classic_message_builder["create"]["button_messages_list"]}    # Click 'Messages'
    Sleep    2
    Click Element    ${generics["copy_button"]}
    Wait Until Page Contains    Choose a new name for your message copy below    timeout=30    # Check content page
    Element Should Be Visible    ${generics["copy_page_title_choose"]}    # Checks
    Element Should Be Visible   ${generics["copy_page_new_name"]}    # Checks
    Clear Element Text    ${generics["new_name_input"]}
    Sleep    2
    Input Text    ${generics["new_name_input"]}    Duplicate Content Block Test    # Input new name for duplication
    Sleep    2
    Click Element    ${generics["save_button"]}    # Save duplicated message
    Sleep    7

test content block
    # Test \ Message
    Open Content    ${classic_message_builder}      ${classic_message_builder["button_list"]}
    Click Element    ${generics["test_message_icon"]}    # Select Test
    send classic test message

delete content block
    # Delete Duplicate Message
    Open Content    ${classic_message_builder}      ${classic_message_builder["button_list"]}
    Select checkbox    ${generics["delete_checkbox"]}    # Select Delete
    Click Element    ${generics["delete_icon"]}    # Trash message
    Wait Until Page Contains    Message(s) to delete    # Check Delete page
    Click Element    ${generics["delete_button"]}    # Confirm Delete

    Select checkbox    ${generics["delete_checkbox"]}    # Select Delete
    Click Element    ${generics["delete_icon"]}    # Trash message
    Wait Until Page Contains    Message(s) to delete    # Check Delete page
    Click Element    ${generics["delete_button"]}    # Confirm Delete

close browser
    close all browsers