*** Settings ***
Suite Teardown    Suite_Teardown
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword

*** Variables ***
${screenshots}    ${EMPTY}
${get_date_value}    ${EMPTY}

*** Test Cases ***
C77_ Classic_Builder_Create_New_Message_All
    Create_Add_Thumbnail
    Add_Message_Text_Save_Confirm
    Check_Message_Preview_Create
    Edit_Message
    Check_Message_Preview_Edit
    Copy_Message
    Test_Message
    Repeat Keyword    2    Delete_Message
    Suite_Teardown

*** Keywords ***
Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Create_Add_Thumbnail
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click 'Create'
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[1]    timeout=10    # Wait for Message to appear
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[1]    # Click 'Message'
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Wait Until Page Contains    Create and Personalize    timeout=30

Add_Message_Text_Save_Confirm
    # Create the message
    Sleep    5
    Clear Element text    id=textContent    # Clear textarea
    Sleep    2
    input text    id=textContent    [EMV TEXTPART]QA auto message test one. [EMV HTMLPART] <html> <body> <p>QA auto message test one</p> </body> </html>    # Add text to text Content area
    Sleep    2
    Click Element    xpath=//*[@id="messageAccordion"]/form/p[1]    # Click on Header
    Sleep    2
    Input text    name=messageName    C77_Classic Message    # Input message name
    Sleep    2    \    # Input description
    Input text    name=messageDescription    Testing Classic Message
    Sleep    2
    Input text    name=messageFrom    qa.auto@smartfocus.com
    Sleep    2
    Input text    name=messageTo    qa.auto@smartfocus.com
    Sleep    2
    Input text    name=messageReplyToEmail    qa.test@smartfocus.com
    Sleep    2
    Click Element    //*[@id="messageAccordion"]/form/div[3]/table/tbody/tr/td/a[1]    # Click on 'Save'
    Sleep    2

Check_Message_Preview_Create
    #- Check 'Text' content
    Click Element    id=ccmd-appBar-messagesButton    # Click 'Messages'
    Sleep    5
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-preview1"]/a/img[@id="iconView"]
    Sleep    2
    Element should contain    id=tabText    QA auto message test one.
    capture page screenshot
    Sleep    2
    #-Check 'HTML' content
    Click Element    xpath=//*[@id="tabHtml-tab"]/a
    Sleep    2
    Element Should Contain    id=tabHtml    <html> <body> <p>QA auto message test one</p> </body> </html>
    Sleep    2

Edit_Message
    # Edit Message
    Click Element    xpath=//*[@id="ccmd-appBar-messagesButton"]/tbody/tr/td[2]    # Click 'Messages'
    Sleep    2
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-edit1"]/a/img[@id="iconEdit"]    # Click 'Edit'
    Sleep    2
    Clear Element text    id=textContent    # Clear textarea
    Sleep    2
    input text    id=textContent    [EMV TEXTPART]QA auto message test one. The message was copied for testing purposes [EMV HTMLPART] <html> <body> <p>QA auto message test one</p> <p>The message was copied for testing purposes</p> </body> </html>    # Modify text in text content area
    Sleep    2
    Click Element    xpath=//*[@id="messageAccordion"]/form/div[3]/table/tbody/tr/td/a[1]    # Click on 'Save'
    Sleep    2

Check_Message_Preview_Edit
    #- Check 'Edit' message
    Click Element    xpath=//*[@id="ccmd-appBar-messagesButton"]/tbody/tr/td[2]    # Click 'Messages'
    Sleep    2
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-preview1"]/a/img[@id="iconView"]
    Sleep    2
    Element should contain    id=tabText    QA auto message test one. The message was copied for testing purposes
    capture page screenshot
    Sleep    2
    #-Check HTML content
    Click Element    xpath=//*[@id="tabHtml-tab"]/a
    Sleep    2
    Element Should Contain    id=tabHtml    <html> <body> <p>QA auto message test one</p> <p>The message was copied for testing purposes</p> </body> </html>
    Sleep    2

Copy_Message
    # Copy message
    Click Element    xpath=//*[@id="ccmd-appBar-messagesButton"]/tbody/tr/td[2]    # Click 'Messages'
    Sleep    2
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-copy1"]/a/img[@id="iconCopy"]
    Wait Until Page Contains    Choose a new name for your message copy below    timeout=30    # Check content page
    Element Should Contain    //*[@id="content"]/table[1]/tbody/tr/td/span    Choose    # Checks
    Element Should Contain    //*[@id="content"]/form/table/tbody/tr/td[1]/span    New Name:    # Checks
    Clear Element Text    id=nameInput
    Sleep    2
    Input Text    id=nameInput    Duplicate Message for testing    # Input new name for duplication
    Sleep    2
    Click Element    css=#content > table.validationTable > tbody > tr > td.validationR > a    # Save duplicated message
    Sleep    7

Test_Message
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
    Run Keyword If    '${check_qa_test}'=='False'    Click Element    //*[@id="content"]//td[contains(.,'qa.test@smartfocus.com')]/input
    Sleep    1
    ${check_qa_auto}=    Run Keyword And Return Status    Checkbox Should Be Selected    //*[@id="content"]//td[contains(.,'qa.auto@smartfocus.com')]/input
    Run Keyword If    '${check_qa_auto}'=='False'    Click Element    //*[@id="content"]//td[contains(.,'qa.auto@smartfocus.com')]/input
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

Delete_Message
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
