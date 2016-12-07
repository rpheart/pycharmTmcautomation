*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword

*** Variables ***
${screenshots}    ${EMPTY}

*** Test Cases ***
Send_MultiVariate_Verification_Test
    Comment    #-- \ MultiVariate --
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]    timeout=15    # Check 'Send' exists
    Click Element    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]    # Click \ 'Send'
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiVariate")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiVariate")]/../ul/li    # Click MultiVariate
    Sleep    2
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe    timeout=50
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Comment    Verify: \ #-- Define Campaign and recipients
    Click Element    //*[@id="splitrunUI-builderView-breadcrumb-2"]//div[contains(text(),"Define versions and samples")]    # Remove navigation tags
    Element Should Contain    //*[@id="splitrunUI-builderView-breadcrumb-1"]//div[contains(text(),"Define campaign and recipients")]    Define campaign and recipients
    Element Should Be Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"1. Campaign name and description")]
    Element Should Be Visible    //*[@id="splitrunuidiv"]//div[contains(text(),"Campaign Name")]
    Sleep    2
    Click Element    id=splitrunUI-builderView-nameInput
    Input Text    id=splitrunUI-builderView-nameInput    Test MultiVariate Name
    Sleep    2
    Element Should Be Visible    //*[@id="splitrunuidiv"]//div[contains(text(),"Campaign description")]
    Sleep    2
    Input Text    id=splitrunUI-builderView-descriptionInput    Test MultiVariate Description
    Sleep    2
    Element Should Be Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"2. Select message")]
    Element Should Be Visible    //*[@id="splitrunuidiv"]//div[contains(text(),"Message")]
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-messagesExplorer-openButton"]//div[contains(text(),"Select a message")]
    Sleep    2
    Click Element    id=splitrunUI-builderView-messagesExplorer-idColumn
    Sleep    2
    Element Should Be Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"3. Select recipients")]
    Element Should Be Visible    //*[@id="splitrunuidiv"]//div[contains(text(),"Segment")]
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-segmentsExplorer-openButton"]//div[contains(text(),"Select one or more segments")]
    Sleep    2
    Click Element    id=splitrunUI-builderView-segmentsExplorer-idColumn
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-segmentsExplorer-addEntitiesButton"]//div[contains(text(),"Ok")]
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-nextButton"]//div[contains(text(),"Continue")]
    Sleep    5
    Comment    Verify: #-- Define versions and samples
    Wait Until Element Is Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"1. Select the variable you want to test")]    timeout=10
    Element Should Contain    //*[@id="splitrunUI-builderView-breadcrumb-2"]//div[contains(text(),"Define versions and samples")]    Define versions and samples
    Element Should Be Visible    //*[@id="splitrunUI-builderView-testElementMenuBar-Subject"]/img    # Subject
    Element Should Be Visible    //*[@id="splitrunUI-builderView-testElementMenuBar-SendDateTime"]/img    # Send Date & Time
    Element Should Be Visible    //*[@id="splitrunUI-builderView-testElementMenuBar-Sender"]/img    # Sender
    Element Should Be Visible    //*[@id="splitrunUI-builderView-testElementMenuBar-Banner"]/img    # Dynamic Content
    Element Should Be Visible    //*[@id="splitrunUI-builderView-testElementMenuBar-Image"]/img    # Image
    Element Should Be Visible    //*[@id="splitrunUI-builderView-testElementMenuBar-Message"]/img    # Message
    Element Should Contain    //*[@id="splitrunuidiv"]//legend[contains(text(),"2. Define test versions (up to 20)")]    2. Define test versions (up to 20)
    Element Should Contain    //*[@id="splitrunuidiv"]//div[contains(text(),"Sample Selection")]    Sample Selection
    Element Should Be Visible    //*[@id="splitrunUI-builderView-percentSegmentationButton"]/tbody/tr/td/div/img    # %
    Element Should Be Visible    //*[@id="splitrunUI-builderView-numberSegmentationButton"]/tbody/tr/td/div/img    # Image
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-testSubject-persoFieldsButton-version1"]/div    # Select a field
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-testSubject-persoFieldsList-version1"]/option[contains(text(),"EMAIL")]    # Select 'EMAIL' from dropdown list in the 'Insert a field'
    Sleep    2
    Input Text    id=splitrunUI-builderView-testSubject-subjectInput-version1    Test Subject    # input text
    Sleep    2
    Element Should Contain    //*[@id="splitrunUI-builderView-addVersionButton"]//div[contains(text(),"Add version")]    Add version    # Add version
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-nextButton"]//div[contains(text(),"Continue")]    # Select: Continure: button
    Sleep    5
    Comment    Verify: #-- Send test and schedule winning campaign
    Wait Until Element Is Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"1. Schedule the MultiVariate Test")]    timeout=10
    Element Should Contain    //*[@id="splitrunUI-builderView-breadcrumb-3"]//div[contains(text(),"Send test and schedule winning campaign")]    Send test and schedule winning campaign
    Element Should Be Visible    id=splitrunUI-builderView-sendNowRadioButton    # RedioButton
    Element Should Be Visible    id=splitrunUI-builderView-sendLaterRadioButton    # RedioButton
    Element Should Contain    //*[@id="splitrunuidiv"]//legend[contains(text(),"2. Select success key indicator and schedule the winning campaign")]    2. Select success key indicator and schedule the winning campaign
    Element Should Be Visible    id=splitrunUI-builderView-kpiInput    # RedioButton
    Element Should Be Visible    id=splitrunUI-builderView-autoSendInput    # RedioButton
    Element Should Be Visible    id=splitrunUI-builderView-autoSendRadioButton    # RedioButton
    Element Should Be Visible    id=splitrunUI-builderView-optiSendRadioButton    # RedioButton
    Element Should Be Visible    id=splitrunUI-builderView-manualRadioButton    # RedioButton
    Element Should Be Visible    //*[@id="splitrunUI-builderView-previousButton"]//div[contains(text(),"Back")]    # Previous Button
    Element Should Be Visible    //*[@id="splitrunUI-builderView-sendCampaignButton"]//div[contains(text(),"Schedule")]    # Send Button
    Unselect Frame

Send_MultiMessage_Verification_Test
    Comment    #-- \ MultiMessage --
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]    timeout=15    # Check 'Send' exists
    Click Element    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]    # Click \ 'Send'
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiMessage")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiMessage")]/../ul/li    # Click MultiVariate
    Sleep    2
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe    timeout=50
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Comment    Verify: \ #-- Define Campaign and recipients
    Click Element    //*[@id="splitrunUI-builderView-breadcrumb-2"]//div[contains(text(),"Define messages and partitions")]    # Remove navigation tags
    Element Should Contain    //*[@id="splitrunUI-builderView-breadcrumb-1"]//div[contains(text(),"Define campaign and recipients")]    Define campaign and recipients
    Element Should Be Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"1. Campaign name and description")]
    Element Should Be Visible    //*[@id="splitrunuidiv"]//div[contains(text(),"Campaign Name")]
    Sleep    2
    Click Element    id=splitrunUI-builderView-nameInput
    Input Text    id=splitrunUI-builderView-nameInput    Test MultiMessage name    # Input: name
    Sleep    2
    Wait Until Element Is visible    //*[@id="splitrunuidiv"]//div[contains(text(),"Campaign description")]    timeout=5
    Sleep    2
    Input Text    id=splitrunUI-builderView-descriptionInput    Test MultiMessage description    # Input description
    Sleep    2
    Wait Until Element Is Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"2. Select recipients")]    timeout=5
    Element Should Be Visible    //*[@id="splitrunuidiv"]//div[contains(text(),"Segment")]
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-segmentsExplorer-openButton"]//div[contains(text(),"Select one or more segments")]    # Click: Select one or more segments
    Sleep    2
    Click Element    id=splitrunUI-builderView-segmentsExplorer-idColumn    # Select: first record from segment
    Click Element    //*[@id="splitrunUI-builderView-segmentsExplorer-addEntitiesButton"]//div[contains(text(),"Ok")]    # Click: OK
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-nextButton"]//div[contains(text(),"Continue")]    # Click: Continure
    Sleep    5
    Comment    Verify: #-- Define messages and partitions
    Wait Until Element Is Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"1. Define campaign messages (up to 20)")]    timeout=5    # Verify: Message display
    Element Should Be Visible    //*[@id="splitrunUI-builderView-breadcrumb-2"]//div[contains(text(),"Define messages and partitions")]
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton"]//div[contains(text(),"Select a message")]    # Click: Dublicate Content Block Test: Message 1
    Sleep    2
    Click Element    id=splitrunUI-builderView-testMessage-messagesExplorer-version1-idColumn    # Select: one record: Message 1
    Sleep    2
    Click Element    //*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton"]//div[contains(text(),"Select a message")]    # Click: Dublicate Content Block Test: Message 2
    Sleep    2
    Click Element    id=splitrunUI-builderView-testMessage-messagesExplorer-version2-idColumn    # Select: one record: Message 2
    Sleep    2
    Element Should Be Visible    //*[@id="splitrunUI-builderView-addVersionButton"]//div[contains(text(),"Add message")]    # Check: Add message
    Element Should Be Visible    //*[@id="splitrunUI-builderView-previousButton"]//div[contains(text(),"Back")]    # Check: Back button
    Element Should Be Visible    //*[@id="splitrunUI-builderView-previewVersionsButton"]//div[contains(text(),"Preview all versions")]    # Check: Preview button
    Sleep    2    # Click: Continue button
    Click Element    //*[@id="splitrunUI-builderView-nextButton"]//div[contains(text(),"Continue")]
    Sleep    5
    Comment    Verify: \ #-- Schedule campaign
    Wait Until Element Is Visible    //*[@id="splitrunuidiv"]//legend[contains(text(),"1. Schedule the campaign")]    timeout=5
    Element Should Be Visible    //*[@id="splitrunUI-builderView-breadcrumb-3"]//div[contains(text(),"Schedule campaign")]
    Element Should Be Visible    id=splitrunUI-builderView-sendNowRadioButton    # Verify: Check Box: Send now
    Element Should Be Visible    id=splitrunUI-builderView-sendLaterRadioButton    # Verify: Check Box: Send later
    Element Should Be Visible    //*[@id="splitrunUI-builderView-previousButton"]//div[contains(text(),"Back")]    # Verify: Back: Button
    Element Should Be Visible    //*[@id="splitrunUI-builderView-sendCampaignButton"]//div[contains(text(),"Schedule")]    # Verify: Schedule: Button
    Unselect Frame

Create_Message_Verification_Test
    Comment    #-- \ Create Message --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]    timeout=15    # Check 'Send' exists
    Click Element    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Standard Content")]/../ul/li[2]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Standard Content")]/../ul/li[2]/ul/li    # Click: Message
    Sleep    2
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe    timeout=50
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    2
    Comment    Verify: \ #--Create Your Message Header Belwo
    Click Element     name=expertContent
    Sleep    2
    Click Element    id=accordionIcon    # Header: Creeate Your Message Header Below
    Click Element     name=messageName    # Click: Message Name
    Input Text     name=messageName    Message Name
    Sleep    2
    Sleep    2
    Click Element     name=messageDescription    # Click: \ Description
    Input Text    name=messageDescription    Description
    Sleep     2
    Click Element     name=messageFrom    # Click: From:
    Input Text     name=messageFrom    qa.auto@smartfocus.com
    Sleep    1
    Click Element     name=fromMemberColumns
    Click Element     //*[@id="content"]//select[@name="fromMemberColumns"]//option[contains(text(),"FIRSTNAME")]
    Sleep    2
    Click Element     name=messageTo    # Click: To:
    Input Text    name=messageTo    qa.test@smartfocus.com
    Sleep    1
    Click Element     name=toMemberColumns
    Click Element     //*[@id="content"]//select[@name="toMemberColumns"]//option[contains(text(),"MEMBER_ID")]
    Sleep    2
    Click Element     name=messageSubject    # Click: Subject:
    Input Text    name=messageSubject    Subject
    Sleep    1
    Click Element     name=subjectMemberColumns
    Click Element     //*[@id="content"]//select[@name="subjectMemberColumns"]//option[contains(text(),"TITLE")]
    Sleep    2
    Click Element     name=messageReplyToEmail    # Click: Reply To Email address:
    Input Text    name=messageReplyToEmail    qa.test@smartfocus.com
    Sleep    2
    Click Element     name=toReplyToEmail
    Click Element     //*[@id="content"]//select[@name="toReplyToEmail"]//option[contains(text(),"EMAIL")]
    Sleep    2
    Click Element     name=messageReplyTo    # Click: Reply To Lable
    Input Text    name=messageReplyTo    Reply To Label
    Sleep    1
    Click Element     name=toReplyTo
    Click Element     //*[@id="content"]//select[@name="toReplyTo"]//option[contains(text(),"SOURCE")]
    Sleep    2
    Click Element     name=messageEncoding    #Click: \ Encoding
    Click Element     //*[@id="content"]//option[contains(text(),"General US & West European (iso-8859-15)")]    # Select: General US
    Sleep    2
    Click Element     xpath=//*[@id="messageAccordion"]//b[contains(text(),"Create and Personalize")]    # Close Form
    Wait Until Element Is Visible     id=textContent    timeout=5    # Text Area
    Sleep    5
    Comment    #-- Verify / Body, Links & Personalization: Create and Personalize Your Message Body Below
    Element Should Be Visible     id=EXPERT    # Expert
    Element Should Be Visible     id=VISUAL    # Visual
    Element Should Be Visible     id=TEMPLATE    # Template
    Element Should Be Visible     //*[@id="iconToolboxShare"]/../../a[contains(text(), 'Share') or ./text() = 'Share']    # Share
    Element Should Be Visible     //*[@id="iconToolboxContentUpload"]/../../a/div[contains(text(), 'Content Upload') or ./text() = 'Content Upload']    # Content Upload Link
    Element Should Be Visible     //*[@id="iconToolboxCopyHtmlToText"]/../../a/div[contains(text(), 'Copy Html to Text') or ./text() = 'Copy Html to Text']    # Copy Html to Text
    Element Should Be Visible     //*[@id="iconToolboxInsertImage"]/../../a/div[contains(text(), 'Insert Image') or ./text() = 'Insert Image']    # Insert Image
    Element Should Be Visible     //*[@id="iconBannerSmall"]/../../a/div[contains(text(), 'Insert Dynamic Content Block') or ./text() = 'Insert Dynamic Content Block']    # Insert Dynamic Content Block
    Element Should Be Visible     //*[@id="iconToolboxTrackLinks"]/../../a/div[contains(text(), 'Track All Links') or ./text() = 'Track All Links']    # Track All Links
    Element Should Be Visible     //*[@id="iconToolboxLinksManagt"]/../../a/div[contains(text(), 'Link Management') or ./text() = 'Link Management']    # Links Management
    Element Should Be Visible     //*[@id="iconToolboxCMS"]/../../a/div[contains(text(), 'External Content') or ./text() = 'External Content']    # External Content
    Element Should Be Visible     //*[@id="iconToolboxMessagePerso"]/../../a/div[contains(text(), 'Message Personalization') or ./text() = 'Message Personalization']    # Message Personalization
    Element Should Be Visible     //*[@id="iconToolboxMessageEmoji"]/../../a/div[contains(text(), 'Insert Emoji') or ./text() = 'Insert Emoji']    # Insert Emoji
    Element Should Be Visible     //*[@id="iconToolboxMessageSendTest"]/../../a/div[contains(text(), 'Send Test Message') or ./text() = 'Send Test Message']    # Send Test Message
    Element Should Be Visible     //*[@id="iconDeliverability"]/../../a/div[contains(text(), 'Deliverability Test') or ./text() = 'Deliverability Test']    # Deliverability Test
    Element Should Be Visible     css=#messageAccordion > form > div:nth-child(5) > table > tbody > tr > td > a:nth-child(1)    # Save
    Element Should Be Visible     css=#messageAccordion > form > div:nth-child(5) > table > tbody > tr > td > a:nth-child(3)    # Save and view the result

Create_SMS_Message_Verification_Test
    Comment    #-- \ SMS Message --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]    timeout=15    # Check 'Send' exists
    Click Element    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]    # Click \ 'Send'
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"SMS Message")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"SMS Message")]/../ul/li    # Click MultiVariate
    Sleep    2
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe    timeout=50
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Comment    Verify: \ #-- Define Campaign and recipients
    Comment    Page Should Contain    Your Message Header and Body Below
    Sleep    2
    Click Element    id=qa-sms-message-name
    Input Text    id=qa-sms-message-name    Test SMS Message    # Check: Message Name
    Sleep    2
    Click Element    id=qa-sms-message-description
    Input Text    id=qa-sms-message-description    Test SMS Description    # Check: Description
    Sleep    2
    Click Element    id=qa-sms-message-from
    Input Text    id=qa-sms-message-from    qa.test    # Check: From:
    Sleep    2
    Click Element    id=textContent
    Input Text    id=textContent    Test Content area    # Check: SMS Body area
    Sleep    2
    Element Should Be Visible    //a[contains(text(), 'Message Personalization') or ./text() = 'Message Personalization']    # Check: Message Personalization
    Element Should Be Visible    //a[contains(text(), 'Message Personalization') or ./text() = 'Message Personalization']    # Check: Message Personalization
    Element Should Be Visible    //a[contains(text(),"Message Preview") or ./text() = 'Message Preview']    # Check: Message Preview
    Element Should Be Visible    //a[contains(text(),"Send Test Message") or ./text() = 'Send Test Message']    # Check: Send Test Message
    Element Should Be Visible    //a[contains(text(),"Back") or ./text() = 'Back']    # Check: Back
    Element Should Be Visible    //a[contains(text(),"Save") or ./text() = 'Save']    # Check: Save
    Element Should Be Visible    //a[contains(text(),"Save and go to SMS Messages") or ./text() = 'Save and go to SMS Messages']    # Check: Save and go to SMS Messages

Create_Landing_Page_Verification_Test

Create_Content_Block_Verification_Test

Create_Webform_Verification_Test

Create_Template_Verification_Test

*** Keywords ***
Calendar
    #-- Calendar --
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-calendar"]/div[contains(text(),"Calendar")]    timeout=15
    Click Element    xpath=//*[@id="engage-calendar"]/div[contains(text(),"Calendar")]
    Sleep    2

Send
    #-- Send --
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]    timeout=15    # Check 'Send' exists
    Click Element    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]    # Click \ 'Send'
    Sleep    2
    #-- Standard --
    Wait Until Element is Visible    xpath=//*[@id="engage-send"]/div/div/ul/li/span[contains(text(),"Campaigns")]    timeout=10    # Check 'Campaigns' exists
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[1]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[1]/ul/li[1]    # Click Standard
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[1]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[1]/ul/li[2]    # Click Standard List
    Sleep    2
    #-- MultiVariate --
    Mouse Over    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[1]    # Click MultiVariate
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[2]    # Click MultiVariate List
    Sleep    3
    #-- MultiMessage --
    Mouse Over    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[3]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[3]/ul/li[1]    # Click MultiMessage
    Sleep    3
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[3]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[3]/ul/li[2]    # Click MultiMessage List
    Sleep    3
    #--Trigger --
    Mouse Over    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[4]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[4]/ul/li[1]    # Click Trigger
    Sleep    3
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[4]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[4]/ul/li[2]    # Click Trigger List
    Sleep    3

Create
    #-- Create --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]    timeout=15
    Click Element    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]
    Sleep    2
    #-- Message Builder --
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div/div/ul/li/span[contains(text(),"Standard Content")]    timeout=5    # Check 'Standard Content' is visible
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li[1]    # Click on Message Builder
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li[2]
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li[2]
    Sleep    2
    #-- Message --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[1]    # Click Message
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[2]
    Sleep    2
    #-- SMS Message --
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    # Click SMS Message
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
    Sleep    2
    #-- Landing Page --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[1]    # Click Landing Page
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[2]
    Sleep    2
    #-- Content Block --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li[1]
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li[1]    # Click Content Block
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li[2]
    Sleep    2
    #-- Webform --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li[1]    # Click Webform
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li[2]
    Sleep    2
    #-- Template --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[1]    # Click Template
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[2]
    Sleep    2
    #-- Transaction Content Message --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/span[contains(text(),"Transactional Content")]    timeout=5    # Transactional Content is visible
    #-- Message --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[1]    # Click Transaction Content Message
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[2]
    Sleep    2
    #-- Content Block --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[1]    # Click Content Block
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[2]
    Sleep    3

List_Management
    #-- List_Management --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[contains(text(),"List Management")]    timeout=15
    Click Element    xpath=//*[@id="engage-list-management"]/div[contains(text(),"List Management")]
    Sleep    2
    #-- Segment Lable
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div/div/ul/li/span[contains(text(),"Segments")]    timeout=5
    #-- Segment --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[1]/ul/li/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[1]/ul/li/ul/li[1]    # Click \ Segment
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[1]/ul/li/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[1]/ul/li/ul/li[2]
    Sleep    2
    #-- Subscriber Management Lable--
    Wait Until Element is Visible    //*[@id="engage-list-management"]/div/div/ul/li/span[contains(text(),"Subscriber Management")]    timeout=5    # Check Description
    #-- Add Subscriber --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li    # Click Add Subscriber
    Sleep    2
    #-- Search Subscriber --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li    # Click Search Subsriber
    Sleep    2
    #-- Import Subscriber --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[3]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[3]/ul/li[1]    # Click Import Subscriber
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[3]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[3]/ul/li[2]
    Sleep    2
    #-- Export Subscriber --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[4]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[4]/ul/li[1]    # Click Export Subscriber
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[4]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[4]/ul/li[2]
    Sleep    2

Image_Library
    #-- Image_Library --
    Wait Until Element Is Visible    xpath=//*[@id="image-library"]/div[contains(text(),"Image Library")]    timeout=15
    Click Element    xpath=//*[@id="image-library"]/div[contains(text(),"Image Library")]
    Sleep    2

Deliverability
    #-- Deliverability --
    Wait Until Element Is Visible    xpath=//*[@id="engage-deliverability"]/div[contains(text(),"Deliverability")]    timeout=15
    Click Element    xpath=//*[@id="engage-deliverability"]/div[contains(text(),"Deliverability")]
    Sleep    2

Reports
    #-- Reports --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[contains(text(),"Reports")]    timeout=15
    Click Element    xpath=//*[@id="engage-reports"]/div[contains(text(),"Reports")]
    Sleep    2
    #--Email --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/span    timeout=5
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    # Click Emails
    Sleep    2
    #-- Multivviriete --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    # Click Multiviriete
    Sleep    2
    #-- MultiMessage --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li    # Click MultiMessage
    Sleep    2
    #-- Test --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li    # Click Test
    Sleep    2
    #-- Transactional --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li    # Click Transactional
    Sleep    2
    #-- Trigger --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li    # Click Trigger
    Sleep    2
    #-- Lending Page --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li    # Click Lending Page
    Sleep    2
    #-- Mobile Lable --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div/div/ul/li/span[contains(text(),"Mobile")]    timeout=5    # Check 'Mobile Lable '
    #-- Mobile --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[2]/ul/li/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[2]/ul/li/ul/li    # Click Mobile
    Sleep    2
    #-- Growth Lable --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div/div/ul/li/span[contains(text(),"List Growth")]    timeout=5
    #-- Growth --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[3]/ul/li/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[3]/ul/li/ul/li    # Click List Growth
    Sleep    2

Folders
    #-- Folders --
    Wait Until Element Is Visible    xpath=//*[@id="engage-folders"]/div[contains(text(),"Folders")]    timeout=15
    Click Element    xpath=//*[@id="engage-folders"]/div[contains(text(),"Folders")]
    Sleep    2

Workflow
    #-- Workflow --
    Wait Until Element Is Visible    xpath=//*[@id="engage-workflow"]/div[contains(text(),"Workflow")]    timeout=15
    Click Element    xpath=//*[@id="engage-workflow"]/div[contains(text(),"Workflow")]
    Wait Until Element Is Visible    //*[@id="engage-workflow"]/div/div/ul/li/span[contains(text(),"Workflow management")]    timeout=5    # Check if 'Workflow management' is visble
    Click Element    xpath=//*[@id="engage-workflow"]/div[2]/div/ul/li/ul/li[1]/ul/li    # Click on elements
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-workflow"]/div[2]/div/ul/li/ul/li[2]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-workflow"]/div[2]/div/ul/li/ul/li[2]/ul/li
    Sleep    2

Social
    #-- Social --
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[1]    timeout=15
    Click Element    xpath=//*[@id="social"]/div[1]
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/span    timeout=15
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    # Click Post
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    # Click Multiwall
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    # Click Objectives
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
    Sleep    2    # Click Statistics
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[2]/ul/li/ul/li    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[2]/ul/li/ul/li    # Click Social Administration
    Sleep    2

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot
