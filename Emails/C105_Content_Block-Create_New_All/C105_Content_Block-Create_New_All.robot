*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword    screenshot_root_directory=.

*** Variables ***
${screenshots}    ${EMPTY}
${dynamic_content_ID}    ${EMPTY}

*** Test Cases ***
C105_Content_Block-Create_New_All
    Hover_Over_Create_sub-tab_Add_Thumbnail
    Add_Message_Text_Save_Confirm
    Add_Dynamic_Content_Block
    Check_Content_Block_Preview_Create
    Edit_Content_Block
    Check_Content_Block_Preview_Edit
    Copy_Content_Block
    Test_Content_Block
    Repeat Keyword    2    Delete_Content_Block    # Run delete
    Suite Teardown

*** Keywords ***
Suite Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Hover_Over_Create_sub-tab_Add_Thumbnail
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click 'Create'
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li[1]    timeout=10    # Wait for SMS Message to appear
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li[1]    # Click 'SMS Message'
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Wait Until Page Contains    Select one of the Content Type options below then insert your Dynamic Content Block code.    timeout=30

Add_Message_Text_Save_Confirm
    # Create message
    Sleep    5
    input text    xpath=//*[@id="content"]/form/table[2]/tbody/tr[1]/td[2]/input    QA auto Content Block    # Add Content Block name
    Sleep    2
    input text    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[2]/input    QA auto Content Block for testing only    # Add description
    Sleep    7
    Wait until element is visible    id=toolbox
    Sleep    2
    Click Element    xpath=//*[@id="textContent"]    # Click Link Management
    Sleep    2
    Click Element    xpath=//*[@id="toolbox"]/tbody/tr[4]/td/a/div
    Sleep    2
    Select frame    id=popupFrame
    Sleep    8
    Double Click Element    xpath=//*[@id="navmenu"]/li[3]/a    # Click 'Create Advanced Link'
    Sleep    2
    Click Element    xpath=//*[@id="navmenu"]/li[3]/ul/li[4]/a    # Select 'Mirror Link'
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr/td[2]/a[2]    # Close Link Management
    Sleep    2
    Unselect frame
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Select frame    id=emv-ccmd-iframe
    Click Element    id=popCloseBox    # Close pupup window
    Sleep    2
    Click Element    css=#content > table > tbody > tr > td:nth-child(2) > a    # Save
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
    Click Element    xpath=//*[@id="engage-create"]/div[1]
    Sleep    2
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[1]
    Wait until element is visible    css=iframe.sfIFrame
    Select frame    css=iframe.sfIFrame
    select frame    id=emv-ccmd-iframe
    Wait until page contains    Your Message Body Below
    Click Element    id=textContent
    Sleep    2
    Click Element    xpath=//*[@id="toolbox"]/tbody/tr[6]/td/a/div    # Select Insert Dynamic Content Block
    Sleep    2
    Select Frame    id=popupFrame
    Sleep    7
    ${dynamic_content_ID}=    Get Text    xpath=//*[@id="content"]/form/table/tbody/tr[1]/td[1]    # Grab ID from popup
    Set Global Variable    ${dynamic_content_ID}
    Click Element    xpath=//*[@id="iconAddCriteria"]    # Select that mirror
    Sleep    2
    Unselect frame
    Select frame    css=iframe.sfIFrame
    select frame    id=emv-ccmd-iframe
    Input text    id=textContent    [EMV TEXTPART][EMV HTMLPART]<html><body>QA auto Content Block test<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Attach content
    Sleep    5
    Click Element    xpath=//*[@id="messageAccordion"]/form/div[3]/table/tbody/tr/td/a[1]
    Choose ok on Next confirmation    # Say 'Ok' to alert
    Confirm Action    # Confirm Alert action
    Sleep    2
    Input Text    xpath=//*[@id="content"]/table[1]/tbody/tr[1]/td[2]/input    QA auto Content Block mirror    # Add Title
    Sleep    2
    Input Text    xpath=//*[@id="content"]/table[1]/tbody/tr[2]/td[2]/input    Qa auto mirror for testing only    # Add description
    Sleep    2
    Input Text    name=messageFrom    razart.hasaj@smartfocus.com
    Sleep    2
    Input Text    name=messageTo    razart.hasaj@smartfocus.com
    Sleep    2
    Input Text    name=messageReplyToEmail    razart.hasaj@smartfocus.com
    Sleep    2
    Click Element    css=#messageAccordion > form > div:nth-child(5) > table > tbody > tr > td > a:nth-child(1)    # Save
    Sleep    2

Check_Content_Block_Preview_Create
    #-Check 'HTML' content
    Click Element    xpath=//*[@id="ccmd-appBar-messagesButton"]/tbody/tr/td[2]    # Click 'Messages' on top of the page'
    Sleep    5
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-preview1"]/a/img[@id="iconView"]    # Click preview
    Sleep    2
    Click Element    xpath=//*[@id="tabHtml-tab"]/a    # Switch to HTML content
    Sleep    2
    Element Should Contain    id=tabHtml    <html><body>QA auto Content Block test<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Validate content
    capture page screenshot    # Take screenshot
    Sleep    2

Edit_Content_Block
    # Edit Message
    Click Element    xpath=//*[@id="ccmd-appBar-messagesButton"]/tbody/tr/td[2]    # Click 'Messages'
    Sleep    2
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-edit1"]/a/img[@id="iconEdit"]    # Click 'Edit'
    Sleep    2
    Clear Element text    id=textContent    # Clear textarea
    Sleep    2
    input text    id=textContent    [EMV TEXTPART][EMV HTMLPART]<html><body>QA auto Content Block 'Edit' Test complete<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Modify text in text content area
    Sleep    2
    Click Element    xpath=//*[@id="messageAccordion"]/form/div[3]/table/tbody/tr/td/a[1]    # Click on 'Save'
    Sleep    2

Check_Content_Block_Preview_Edit
    #-Check 'HTML' content
    Click Element    xpath=//*[@id="ccmd-appBar-messagesButton"]/tbody/tr/td[2]    # Click 'Messages'
    Sleep    5
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-preview1"]/a/img[@id="iconView"]    # Click Preview
    Sleep    2
    Click Element    xpath=//*[@id="tabHtml-tab"]/a    # Switch to HTML
    Sleep    2
    Element Should Contain    id=tabHtml    <html><body>QA auto Content Block 'Edit' Test complete<a href="[EMV INCLUDE]${dynamic_content_ID}[EMV /INCLUDE]">Mirror Test</a></body></html>    # Validate content
    capture page screenshot    # Take a screenshot
    Sleep    2

Copy_Content_Block
    # Copy Content Block
    Click Element    xpath=//*[@id="ccmd-appBar-messagesButton"]/tbody/tr/td[2]    # Click 'Messages'
    Sleep    2
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-copy1"]/a/img[@id="iconCopy"]
    Wait Until Page Contains    Choose a new name for your message copy below    timeout=30    # Check content page
    Element Should Contain    //*[@id="content"]/table[1]/tbody/tr/td/span    Choose    # Checks
    Element Should Contain    //*[@id="content"]/form/table/tbody/tr/td[1]/span    New Name:    # Checks
    Clear Element Text    id=nameInput
    Sleep    2
    Input Text    id=nameInput    Duplicate Content Block Test    # Input new name for duplication
    Sleep    2
    Click Element    css=#content > table.validationTable > tbody > tr > td.validationR > a    # Save duplicated message
    Sleep    7

Test_Content_Block
    # Test \ Message
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-test1"]/a/img[@id="iconCampaignTest"]    # Select Test
    Sleep    7
    Select Frame    id=popupFrame
    Sleep    2
    Input text    xpath=//*[@id="content"]/form[1]/table[1]/tbody/tr[1]/td[2]/input    Content Block Test    # Input Campaign name:
    Sleep    2
    Comment    Input text    xpath=//*[@id="content"]/form[1]/table[3]/tbody/tr/td[2]/input    razart.hasaj@smartfocus.com    # Input New Test Email
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table/tbody/tr/td/table/tbody/tr/td/select/option[contains(text(),"QA_auto")]    # Select Group and atlist one member
    Sleep    2
    Click Element    xpath=//*[@id="content"]/table[2]/tbody/tr/td[2]/a    # Send Test
    Sleep    2
    Click Element    xpath=//*[@id="content"]/p[2]/a    # Close
    Sleep    2
    Unselect Frame    # Move on to next step

Delete_Content_Block
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    # Delete Duplicate Message
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-delete1"]/input[@name="deleteMessage"]    # Select Delete
    Sleep    2
    Click Element    id=iconTrash    # Trash message
    Wait Until Page Contains    Message(s) to delete    # Check Delete page
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr/td[2]/a    # Confirm Delete
    Sleep    2
    Unselect frame
