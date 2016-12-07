*** Settings ***
Suite Teardown    Suite_Teardown
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword
Library           ImageHorizonLibrary

*** Variables ***
${screenshots}    ${EMPTY}
${dynamic_content_ID}    ${EMPTY}

*** Test Cases ***
C99_Landing_Page-Create_New_All
    Create_Add_Thumbnail
    Create_Landing_Page_Submit
    General_Properties_Scheduler
    Activate_Data_Synchronization
    Test_Lending_Page
    Verify_Lending_Page_And_Delete
    Suite_Teardown

*** Keywords ***
Suite_Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Create_Add_Thumbnail
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click 'Create'
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[1]    timeout=10    # Wait \ 'Landing Page' to appear
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[1]    # Click 'Landing Page'
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    2

Create_Landing_Page_Submit
    # Create Landing Page
    Wait Until Element is Visible    //*[@id="lpages-editor-panel"]/div/div[@id="lpages-editor-rows"]    timeout=80
    Sleep    2
    #------Email
    Click Element    //*[@id="lpages-editor-rows"]/div/div/div/div/div/div/div/button[@class="btn btn-large lpages-editor-wizardform"]
    Sleep    5
    Input Text    xpath=//*[@id="lpages-editor-columnid-1-0"]/div[1]/div/form/div[1]/div/div[2]/div    Email:    #Label 'Email'
    Sleep    2
    Assign ID to Element    xpath=//*[@id="lpages-editor-columnid-1-0"]/div[1]/div/form/div[1]/div/div[3]/input    value="{{EMAIL}}"    # Link to 'EMAIL'
    Click Element    xpath=//*[@id="lpages-editor-columnid-1-0"]/div[1]/div/form/div[1]/div/div[3]/input
    Sleep    2
    Click Element    xpath=//*[@id="lpages-editorform-selecttype"]/div/div[1]
    Sleep    1
    Click Element At Coordinates    xpath=//*[@id="lpages-editorform-selecttype"]/div/div[1]    0    75
    Sleep    1
    Click Element    xpath=//*[@id="lpages-editorform-selectfields"]
    Click Element    xpath=//*[@id="lpages-editorform-selectfields"]/div/div/div/div[contains(text(),"EMAIL")]
    #------First Name
    Sleep    10
    Click Element    xpath=//*[@id="lpages-editor-columnid-1-0"]/div[1]/div
    Sleep    2
    Click Element    id=lpages-editor-form-addfield-selector-button
    Sleep    2
    Click Element At Coordinates    id=lpages-editor-form-addfield-selector-button    0    25
    #Sleep    2
    Input Text    xpath=//*[@id="lpages-editor-columnid-1-0"]/div[1]/div/form/div[2]/div/div[2]/div    Name:    # Lable Name:
    #----Last Name
    Sleep    5
    Click Element    id=lpages-editor-form-addfield-selector-button
    Sleep    3
    Click Element At Coordinates    id=lpages-editor-form-addfield-selector-button    0    25
    Sleep    3
    Input Text    xpath=//*[@id="lpages-editor-columnid-1-0"]/div[1]/div/form/div[3]/div/div[2]/div    Surname:    # Lable Surname
    #---Add Title    #QA auto landing page
    #Click Element    xpath=//*[@id="lpages-pagebar-name" and contains(text(),"Untitled")]
    Comment    ${h_point}=    Get Horizontal Position    xpath=//*[@id="lpages-pagebar-name" and contains(text(),"Untitled")]
    Comment    ${v_point}=    Get Vertical Position    xpath=//*[@id="lpages-pagebar-name" and contains(text(),"Untitled")]
    Comment    Move To    ${h_point}    ${v_point}
    Comment    Sleep    2
    Comment    Press combination    Key.ctrl    x
    Comment    Comment    Type    QA auto landing page test    Key.ENTER
    Comment    Comment    landing_page_title
    #---------end--------
    Sleep    5
    Click Element    id=lpages-editor-btnsave    # Save
    Wait until Element Contains    id=lpages-notification-content    This page has been saved.    timeout=25

General_Properties_Scheduler
    #- General_Properties_Scheduler
    Sleep    5
    Unselect frame
    Click Element    xpath=//*[@id="engage-create"]/div[1]
    Sleep    2
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[2]
    Wait until element is visible    css=iframe.sfIFrame    timeout=20
    Select frame    css=iframe.sfIFrame
    select frame    id=emv-ccmd-iframe
    Wait until Element is visible    xpath=//*[@id="lpages-pages-tablediv"]/div/div/div/div[@id="tabledivColumn-0-1"]/div[contains(text(),"Untitled")]    timeout=25
    Mouse Over    xpath=//*[@id="lpages-pages-tablediv"]/div/div/div/div[@id="tabledivColumn-0-1"]/div[contains(text(),"Untitled")]
    Wait Until Element is Visible    xpath=//*[@id="lpages-pages-tablediv"]/div/div/div/div[contains(@class,"tabledivColumnAction lpages-pages-icon-prop")]    timeout=10
    Click Element    xpath=//*[@id="lpages-pages-tablediv"]/div/div/div/div[contains(@class,"tabledivColumnAction lpages-pages-icon-prop")]
    Sleep    5
    Click Element    id=lpages-prop-scheduler-start-date    # Select Insert Dynamic Content Block
    Sleep    2
    Click Element    id=lpages-prop-scheduler-stop-date

Activate_Data_Synchronization
    [Arguments]    ${global_variable}=
    Sleep    2
    Click Element    id=ui-id-2    # Click Data Synchronization
    Sleep    2
    Click Element    id=lpages-prop-datasync-toggleButton    # Click 'Activate'
    Sleep    2
    Click Element    xpath=//*[@id="lpages-prop-datasync-activation-popup"]/div[2]/div[3]/div[contains(text(),"Activate")]    # Popup 'Activate'
    Sleep    2
    Click Element    id=lpages-prop-datasync-insert-and-update    # Insert + update
    Sleep    2
    Click Element    id=lpages-prop-datasync-formField-toggle2    #Click toggle 'Name'
    Sleep    2
    Click Element    id=lpages-prop-datasync-fieldSelector2
    Sleep    1
    Click Element    //*[@id="lpages-prop-datasync-fieldSelector2"]/../div/div[contains(text(),"FIRSTNAME")]    # Manual mapping 'Firstname'
    Sleep    2
    Click Element    id=lpages-prop-datasync-formField-toggle3    # Click toggle 'Surname'
    Sleep    2
    Click Element    id=lpages-prop-datasync-fieldSelector3
    Sleep    1
    Click Element    //*[@id="lpages-prop-datasync-fieldSelector3"]/../div/div[contains(text(),"LASTNAME")]    # Manual mapping 'Surname'
    Click Element    id=lpages-prop-datasync-source-toggle    # Tick 'Source field value'
    Sleep    2
    : FOR    ${index}    IN RANGE    8
    \    Press Key    id=lpages-prop-datasync-source-input    \\8
    \    Run Keyword If    ${index}==7    Press Key    id=lpages-prop-datasync-source-input    QA automation test
    Sleep    2
    Click Element    id=lpages-prop-btnsave    # Save
    Sleep    1
    Wait Until Element Contains    xpath=//*[@id="lpages-notification-content"]/div[contains(text(),"Your modifications have been saved.")]    Your modifications have been saved.    timeout=25

Test_Lending_Page
    # Test Lending Page
    Sleep    5
    Click Element    xpath=//*[@id="lpages-prop-header-tabs"]/ul/li[@aria-controls="lpages-prop-fragment-general-properties"]/a[@href="#lpages-prop-fragment-general-properties"]    # Click 'General properties'
    Sleep    5
    ${url_value}=    Get Text    xpath=//*[@id="lpages-prop-overview-url"]/a    # Get dinamic value
    Sleep    1
    Go To    ${url_value}    # Select dinamic value
    Sleep    2
    Input Text    xpath=//*[@id="root"]/div/div/div/form/div[1]/div/div[3]/input    qa.test@smartfocus.com    # Input 'Email'
    Sleep    2
    Input Text    xpath=//*[@id="root"]/div/div/div/form/div[2]/div/div[3]/input    QaTester    # Input 'Name'
    Sleep    2
    Input Text    xpath=//*[@id="root"]/div/div/div/form/div[3]/div/div[3]/input    AutoTest    # Input 'Surname;
    Sleep    2
    Click Element    xpath=//*[@id="root"]/div/div/div/form/div/button[@type="submit"]    # Click 'Submit'
    Sleep    3
    Element Should Be Visible    xpath=//*[@id="root"]/div/div/div/form/img[@class="lpages-prop-submission-preview-icononly"]    # Confirm the form was submitted
    Sleep    1
    Go Back    # Go back to the main page
    Unselect Frame

Verify_Lending_Page_And_Delete
    #-Verify Lending Page and Delete
    Wait Until Page Contains Element    xpath=//*[@id="engage-list-management"]/div[contains(text(),"List Management")]    timeout=30
    Click Element    xpath=//*[@id="engage-list-management"]/div[contains(text(),"List Management")]
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    3
    Wait Until Page Contains    Search Criteria    timeout=30
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[1]/select
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[1]/select/option[contains(text(), 'EMAIL')]    # Search criteria
    Sleep    3
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[2]/select
    Sleep    3
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[2]/select/option[contains(text(), 'contains')]    # Search criteria
    Sleep    3
    Input Text    name=textFieldValue    qa.test@smartfocus.com    # Search criteria
    Sleep    2
    Click Element    xpath=//*[@id="iconAddCriteria"]
    Sleep    5
    Click Element    id=iconSearch    # Select search option
    Sleep    10
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"AutoTest")]    AutoTest    # Check 'Surname'
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"QaTester")]    QaTester    # Check 'Name'
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"qa.test@smartfocus.com")]    qa.test@smartfocus.com    # Check 'Email'
    capture page screenshot
    #-- Now Delete it
    Sleep    2
    Click Element    xpath=//*[@id="ccmd-member-archive-cell-delete0"]/input[@name="deleteMember"]    # Select delete
    Sleep    2
    Click Element    id=iconTrash    # Click delete Trash
    Sleep    3
    Click Element    css=#content > form > table.validationTable > tbody > tr > td.validationR > a    # Confirm
    Sleep    10
    capture page screenshot
