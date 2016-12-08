*** Settings ***
Suite Teardown    Suite_Teardown
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Resource          ../Utils/keywords.robot

*** Variables ***
${screenshots}    ${EMPTY}
${dynamic_content_ID}    ${EMPTY}

*** Test Cases ***
Login
    Login
    Set Selenium Speed    0.1
    Go To ${System_Page["email"]}
    Open Content    ${content_block}    ${content_block["button_add"]}

C105_Content_Block-Create_New_All
    Create_Add_Thumbnail
    Add_Message_Text_Save_Confirm
    Add_Dynamic_Content_Block
    Check_Content_Block_Preview_Create
    Edit_Content_Block
    Check_Content_Block_Preview_Edit
    Copy_Content_Block
    Test_Content_Block
    Repeat Keyword    2    Delete_Content_Block    # Run delete
    Suite_Teardown

*** Keywords ***
Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Create_Add_Thumbnail
    Open Content    ${content_block}    ${content_block["button_add"]}

Add_Message_Text_Save_Confirm
    # Create message
    Sleep    5
    Click Element    ${content_block["content_block_name"]}
    input text    ${content_block["content_block_name"]}    QA auto Content Block    # Add Content Block name
    Sleep    2
    input text    ${content_block["content_block_description"]}    QA auto Content Block for testing only    # Add description
    Sleep    7
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
    Click Element    ${generics["button_save"]}    # Save
    Sleep    2
    Choose ok on Next confirmation    # Say 'Ok' to alert
    Confirm Action    # Confirm Alert action
    Sleep    2
    #- go to Message

Add_Dynamic_Content_Block
    [Arguments]    ${global_variable}=
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
    Input Text    ${classic_message_builder["message_name_input"]}    QA auto Content Block mirror    # Add Title
    Sleep    2
    Input Text    ${classic_message_builder["message_description_input"]}    Qa auto mirror for testing only    # Add description
    Sleep    2
    Input Text    ${classic_message_builder["message_from_input"]}    qa.auto@smartfocus.com    # Message from
    Sleep    2
    Input Text    ${classic_message_builder["message_to_input"]}    qa.auto@smartfocus.com    # Message to
    Sleep    2
    Input Text    ${classic_message_builder["message_reply_to_email"]}    qa.test@smartfocus.com    # Reply to
    Sleep    2
    Click Element    ${generics["save_button"]}    # Save
    Sleep    5

Check_Content_Block_Preview_Create
    #-Check 'HTML' content
    Click Element    ${classic_message_builder["button_messages_list"]}
    Sleep    5
    Click Element    ${generics["preview_button"]}    # Click preview
    Sleep    2
    Click Element    ${classic_message_builder["button_html_source"]}    # Switch to HTML content
    Sleep    2
    Element Should Contain    ${classic_message_builder["html_content_box"]}    <html><body>QA auto Content Block test<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Validate content
    capture page screenshot    # Take screenshot
    Sleep    2

Edit_Content_Block
    # Edit Message
    Click Element    ${classic_message_builder["button_messages_list"]}    # Click 'Messages'
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

Check_Content_Block_Preview_Edit
    #-Check 'HTML' content
    Click Element    ${classic_message_builder["button_messages_list"]}    # Click 'Messages'
    Sleep    5
    Click Element    ${generics["preview_button"]}    # Click Preview
    Sleep    2
    Click Element    ${classic_message_builder["button_html_source"]}    # Switch to HTML
    Sleep    2
    Element Should Contain    ${classic_message_builder["html_content_box"]}    <html><body>QA auto Content Block 'Edit' Test complete<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Validate content
    capture page screenshot    # Take a screenshot
    Sleep    2

Copy_Content_Block
    # Copy Content Block
    Click Element    ${classic_message_builder["button_messages_list"]}    # Click 'Messages'
    Sleep    2
    Click Element    ${generics["copy_button"]}
    Wait Until Page Contains    Choose a new name for your message copy below    timeout=30    # Check content page
    Element Should Be Visible    ${generics["copy_page_title_choose"]}    # Checks
    Element Should Be Visible    ${copy_page_new_name"]}    # Checks
    Clear Element Text    id=nameInput
    Sleep    2
    Input Text    id=nameInput    Duplicate Content Block Test    # Input new name for duplication
    Sleep    2
    Click Element    css=#content > table.validationTable > tbody > tr > td.validationR > a    # Save duplicated message
    Sleep    7

Test_Content_Block
    # Test \ Message
    Click Element    xpath=//*[@id="content"]//td[@id="ccmd-messages-cell-test1"]/a/img[@id="iconCampaignTest"]    # Select Test
    Sleep    5
    Select Frame    id=popupFrame
    # Input Campaign name:
    Input text    name=campaignName    Add two emails for testing    # Type 'Test Campaign name'
    Sleep    2
    Input text    //*[@id="content"]//input[@name='emailToAdd']    qa.auto@smartfocus.com    # Input New Test Email
    Sleep    2
    Click Element    id=iconAddCriteria    # Add email to 'Test recipients list'
    Sleep    2
    Input text    //*[@id="content"]//input[@name='emailToAdd']    qa.test@smartfocus.com    # Input New Test Email
    Sleep    2
    Click Element    id=iconAddCriteria    # Add email to 'Test recipients list'
    Sleep    2
    Click Element    xpath=//*[@id="content"]//option[contains(text(),"QA_auto")]    # Select Group 'QA_auto'
    Sleep    2
    #-- Is Checkbox 'checked'
    ${check_qa_test}=    Run Keyword And Return Status    Checkbox Should Be Selected    //*[@id="content"]//td[contains(.,'qa.test@smartfocus.com')]/input
    Run Keyword If    ${check_qa_test}==False    Click Element    //*[@id="content"]//td[contains(.,'qa.test@smartfocus.com')]/input
    Sleep    1
    ${check_qa_auto}=    Run Keyword And Return Status    Checkbox Should Be Selected    //*[@id="content"]//td[contains(.,'qa.auto@smartfocus.com')]/input
    Run Keyword If    ${check_qa_auto}==False    Click Element    //*[@id="content"]//td[contains(.,'qa.auto@smartfocus.com')]/input
    Sleep    1
    Click Element    id=updateGroupBtn    # Update Group
    Sleep    2
    Click Element    xpath=//*[@id="content"]//option[contains(text(),"QA_auto")]    # Select Group 'QA_auto'
    Sleep    3
    Click Element    //*[@id="iconArrowBack"]/../a    # Send a Tests
    Sleep    2
    Unselect Frame
    Select Frame    css=iframe.sfIFrame
    Select Frame    id=emv-ccmd-iframe
    Click Element    id=popCloseBox    # Close

Delete_Content_Block
    # Delete Duplicate Message
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-delete1"]/input[@name="deleteMessage"]    # Select Delete
    Sleep    2
    Click Element    id=iconTrash    # Trash message
    Wait Until Page Contains    Message(s) to delete    # Check Delete page
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr/td[2]/a    # Confirm Delete
    Sleep    2

Suite_Teardown
    Close All Browsers
