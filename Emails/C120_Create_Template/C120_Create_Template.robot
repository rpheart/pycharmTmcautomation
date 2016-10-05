*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword    screenshot_root_directory=.
Library           ImageHorizonLibrary

*** Variables ***
${screenshots}    ${EMPTY}
${dynamic_content_ID}    ${EMPTY}

*** Test Cases ***
C120_Create_Template
    Hover_Over_Create_sub-tab_Add_Thumbnail
    Fill_Template_Form_Select_Image
    Create_Message_With_template
    Name_Template_Message
    Test_Template_Message
    Verify_Preview_Export_Replace
    Delete_Template
    Comment    Suite Teardown

*** Keywords ***
Suite Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Hover_Over_Create_sub-tab_Add_Thumbnail
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click 'Create'
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[1]    timeout=10    # Wait for SMS Message to appear
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[1]    # Click 'SMS Message'
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
    Sleep    7
    Click Element    name=uploadFile    # Click 'Choose File
    Sleep    3
    Press combination    Key.ctrl    Key.shift
    Type    C:\\qa_smartfocus_tests\\qa_dev\\templates\\Easter_Eggs.dwt    Key.ENTER
    Sleep    3
    Click Element    css=#content > table > tbody > tr > td > a    # Import
    Element Should Contain    //*[@id="templateContent"]/table/tbody/tr[2]/td/div    Happy Easter
    Sleep    2
    Sleep    2
    Click Element    css=#content > form > table > tbody > tr > td.validationR > a.btn.blue    # Save
    Sleep    2
    Dismiss Alert    # Say 'Ok' to alert
    unselect frame

Create_Message_With_template
    [Arguments]    ${global_variable}=
    #--- Create Message with Template
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    2
    Click Element    //*[@id="ccmd-appBar-lists-templatesButton"]/tbody/tr/td[contains(text(),"Templates")]
    Sleep    2
    Click Element    id=iconEdit
    Sleep    2
    Click Element    css=#messageAccordion > form > div:nth-child(5) > table > tbody > tr > td > a:nth-child(1)
    Dismiss Alert    # Say 'Ok' to alert
    Sleep    2

Name_Template_Message
    #--- Fill up form
    Input Text    name=messageName    Template Message
    Sleep    2
    Input Text    name=messageDescription    Template Message for testing only
    Sleep    2
    Input Text    name=messageReplyToEmail    razart.hasaj@smartfocus.com
    Sleep    2
    Click Element    css=#messageAccordion > form > div:nth-child(5) > table > tbody > tr > td > a:nth-child(1)
    Sleep    2
    Click Element     //*[@id="toolbox"]/tbody/tr[11]/td/a/div

Test_Template_Message
    # Test \ Template Message
    Sleep    5
    Select Frame    id=popupFrame
    Sleep    2
    Input text    xpath=//*[@id="content"]/form[1]/table[1]/tbody/tr[1]/td[2]/input    SmartFocus    # Input Campaign name:
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

Verify_Preview_Export_Replace
    #-- Check Preview
    Click Element    //*[@id="engage-create"]/div[1]    # Select 'Create'
    Sleep    2
    Click Element    //*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[2]    # Click 'Temlate'
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    3
    Click Element    id=iconToolboxMessagePreview    # Click 'Preview'
    Element Should Contain    //*[@id="templateContent"]/table/tbody/tr[2]/td/div    Happy Easter
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
