*** Settings ***
Suite Teardown    Suite_Teardown
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           ImageHorizonLibrary

*** Variables ***
${screenshots}    ${EMPTY}
${dynamic_content_ID}    ${EMPTY}

*** Test Cases ***
C120_Create_Template
    Create_Add_Thumbnail
    Fill_Template_Form_Select_Image
    Create_Message_With_template
    Name_Template_Message
    Test_Template_Message
    Verify_Preview_Export_Replace
    Delete_Template
    Suite_Teardown

*** Keywords ***
Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Create_Add_Thumbnail
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]    timeout=10
    Click Element    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]    # Click 'Create'
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Template")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Template")]/../ul/li    # Click: \ Template
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Wait Until Page Contains    Name    timeout=30

Fill_Template_Form_Select_Image
    # Create the SMS message
    Sleep    5
    input text    name=name    QA Template    # Add \ name
    Sleep    2
    Click Element    name=description
    input text    name=description    QA Template test only    # Add description
    Sleep    5
    Choose File    name=uploadFile    C:\\qa_smartfocus_tests\\qa_dev\\templates\\Easter_Eggs.dwt
    Sleep    3
    Click Element    css=#content > table > tbody > tr > td > a    # Import
    Element Should Contain    //*[@id="templateContent"]/table/tbody/tr[2]/td/div    Happy Easter
    Sleep    2
    Sleep    2
    Click Element    css=#content > form > table > tbody > tr > td.validationR > a.btn.blue    # Save
    Sleep    2
    Dismiss Alert    # Say 'Ok' to alert

Create_Message_With_template
    [Arguments]    ${global_variable}=
    #--- Create Message with Template
    Sleep    2
    Click Element    xpath=//*[@id="ccmd-appBar-lists-templatesButton"]//td[contains(text(),"Templates")]
    Sleep    2
    Click Element    id=iconEdit
    Sleep    2
    Click Element    id=iconButtonSave    #Save
    Dismiss Alert    # Say 'Ok' to alert
    Sleep    2

Name_Template_Message
    #--- Fill up form
    Input Text    name=messageName    Template Message
    Sleep    2
    Input Text    name=messageDescription    Template Message for testing only
    Sleep    2
    Input Text    name=messageFrom    qa.auto@smartfocus.com
    Sleep    2
    Input Text    name=messageTo    qa.auto@smartfocus.com
    Sleep    2
    Input Text    name=messageReplyToEmail    qa.test@smartfocus.com
    Sleep    2
    Click Element    id=iconButtonSave    # Save message
    Sleep    5
    Click Element    //*[@id="toolbox"]//div[contains(text(),"Send Test Message")]    # Send a test Message

Test_Template_Message
    # Test \ Message
    Sleep    5
    Select Frame    id=popupFrame
    # Input Campaign name:
    Input text    name=campaignName    Create Template    # Type 'Test Campaign name'
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
    Unselect Frame
    Select Frame    css=iframe.sfIFrame
    Select Frame    id=emv-ccmd-iframe
    Click Element    id=popCloseBox    # Close
    Unselect Frame

Verify_Preview_Export_Replace
    #-- Check Preview
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]    timeout=15
    Click Element    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Template")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Template")]/../ul/li[2]    # Click: Template List
    Sleep    2
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    3
    Click Element    id=iconToolboxMessagePreview    # Click 'Preview'
    Element Should Contain    //*[@id="templateContent"]//div[contains(text(),"Happy Easter")]    Happy Easter
    capture page screenshot    # Take snapshot
    Sleep    2
    Click Element    css=#content > form > table > tbody > tr > td:nth-child(1) > a
    #-----Replace File

Delete_Template
    # Delete Template
    Click Element    name=deleteTemplate    # Select Delete
    Sleep    2
    Click Element    id=iconTrash    # Trash message
    Wait Until Page Contains    Template(s) to delete    # Check Delete page
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr/td[2]/a    # Confirm Delete
    Sleep    2

Suite_Teardown
    Close All Browsers
