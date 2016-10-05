*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword    screenshot_root_directory=.

*** Variables ***
${screenshots}    ${EMPTY}
${dynamic_content_ID}    ${EMPTY}

*** Test Cases ***
C110_Web_Form-Create_New_All
    Hover_Over_Create_sub-tab_Add_Thumbnail
    Fill_Input_Webform_Information
    Choose_A_Webform_Type
    Set_Confirmation_Email_Info_And_Save
    Search_Subsriibe_Checks
    Suite Teardown

*** Keywords ***
Suite Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Hover_Over_Create_sub-tab_Add_Thumbnail
    Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click 'Create'
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li[1]    timeout=10    # Wait for SMS Message to appear
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li[1]    # Click 'SMS Message'
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Wait Until Page Contains    Fill in Webform Information    timeout=30

Fill_Input_Webform_Information
    # Create the SMS message
    Sleep    5
    input text    xpath=//*[@id="content"]/form/table/tbody/tr[2]/td[2]/input    QA Webform test    # Add \ name
    Sleep    2
    input text    xpath=//*[@id="content"]/form/table/tbody/tr[3]/td[2]/input    QA Webform for testing only    # Add description
    Sleep    7
    Click Element    xpath=//*[@id="content"]/form/table/tbody/tr[4]/td[2]/select    # Controls warning language
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table/tbody/tr[4]/td[2]/select/option[contains(text(), 'English')]    # Selects 'English'
    Sleep    2
    Click Element    id=datepicker    # Webform Expiration DAte & Time
    Sleep    2
    Click Button    Today    # Selects today's date
    Sleep    5
    Input Text    name=confirmUrl    http://www.smartfocus.com
    Sleep    2
    input text    name=errorUrl    http://www.google.com
    Sleep    2
    Click Element    css=#content > table.validationTable > tbody > tr > td.validationR > a    # Save
    Sleep    2

Choose_A_Webform_Type
    [Arguments]    ${global_variable}=
    #- Choose Webform Type
    #Page Should Contain    Webform Type
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table/tbody/tr[2]/td[2]/select
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table/tbody/tr[2]/td[2]/select/option[contains(text(), 'Update webform')]    # Select: 'Unsubscribe webform'
    # --- Field 1
    Sleep    2
    Click Element    xpath=//*[@id="entry[0]"]/td[1]/select/option[contains(text(), 'EMAIL')]    # Email
    Sleep    3
    Input Text    xpath=//*[@id="entry[0]"]/td[3]/input    Email:
    Sleep    3
    Click Element    xpath=//*[@id="entry[0]"]/td[4]/select/option[contains(text(), 'TEXT')]    # Input Type 'TEXT'
    Sleep    3
    Click Element    xpath=//*[@id="entry[0]"]/td[7]/select/option[contains(text(), 'EMAIL')]    # validation Type
    #-----Field 2
    Sleep    3
    Click Element    xpath=//*[@id="iconAddCriteria"]    # Select 'Add a Field
    Sleep    3
    Click Element    xpath=//*[@id="entry[1]"]/td[1]/select/option[contains(text(), 'FIRSTNAME')]    #Field Name
    Sleep    3
    Input Text    xpath=//*[@id="entry[1]"]/td[3]/input    Firstname:    #Display Name
    Sleep    3
    Click Element    xpath=//*[@id="entry[1]"]/td[4]/select/option[contains(text(), 'TEXT')]    # Input Type
    Sleep    3
    Click Element    xpath=//*[@id="entry[1]"]/td[7]/select/option[contains(text(), 'NONE')]    #Validation Type
    #------ Field 3
    Sleep    3
    Click Element    xpath=//*[@id="iconAddCriteria"]    # Select 'Add a Field
    Sleep    3
    Click Element    xpath=//*[@id="entry[2]"]/td[1]/select/option[contains(text(), 'LASTNAME')]    #Field Name
    Sleep    3
    Input Text    xpath=//*[@id="entry[2]"]/td[3]/input    Lastname:    #Display Name
    Sleep    3
    Click Element    xpath=//*[@id="entry[2]"]/td[4]/select/option[contains(text(), 'TEXT')]    # Input Type
    Sleep    3
    Click Element    xpath=//*[@id="entry[2]"]/td[7]/select/option[contains(text(), 'NONE')]    #Validation Type
    Sleep    3
    #------ Field 4
    Click Element    xpath=//*[@id="iconAddCriteria"]
    Sleep    3
    Click Element    xpath=//*[@id="entry[3]"]/td[1]/select/option[contains(text(), 'CODE')]    # Field Name
    Sleep    3
    Input Text    xpath=//*[@id="entry[3]"]/td[3]/input    Code:
    Sleep    3
    Click Element    xpath=//*[@id="entry[3]"]/td[4]/select/option[contains(text(), 'TEXT')]    # Input Type
    Sleep    3
    Click Element    xpath=//*[@id="entry[3]"]/td[7]/select/option[contains(text(), 'INTEGER')]    #Validation Type
    Sleep    3
    #--- Move 'Next Step'
    Click Element    css=#content > table.validationTable > tbody > tr > td.validationR > a    #Click Next
    Sleep    3

Set_Confirmation_Email_Info_And_Save
    Sleep    5
    Click Element    xpath=//*[@id="bounceBackSection"]/tbody/tr[2]/td[2]/select/option[contains(text(), 'User')]
    Sleep    2
    Input Text    name=replyTo    qa@user.com    # Reply-To Email address
    Sleep    2
    Click Element    name=messageId
    Sleep    2
    Click Element    css=#content > table.validationTable > tbody > tr > td.validationR > a
    Sleep    2
    #--- Webform Preview
    Input Text    id=EMAIL_FIELD    razart.hasaj@smartfocus.com
    Sleep    2
    Input Text    id=FIRSTNAME_FIELD    NameWebForm
    Sleep    2
    Input Text    id=LASTNAME_FIELD    SurnameWebForm
    Sleep    2
    Input Text    id=CODE_FIELD    1234
    Sleep    3
    Click Element    xpath=//*[@id="emvForm"]/table/tbody/tr[5]/td/input
    Sleep    5
    capture page screenshot

Search_Subsriibe_Checks
    # ----Edit Message
    Go To    ${LOGIN URL}sfui/i#engage/list/search/subscriber    # Go to 'Search Subsribe'
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    3
    Wait Until Page Contains    Search Criteria    timeout=30
    #----Back to search form
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[1]/select
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[1]/select/option[contains(text(), 'EMAIL')]
    Sleep    3
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[2]/select
    Sleep    3
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[2]/select/option[contains(text(), 'contains')]
    Sleep    3
    Input Text    name=textFieldValue    razart.hasaj@smartfocus.com
    Sleep    2
    Click Element    xpath=//*[@id="iconAddCriteria"]
    Sleep    5
    Click Element    id=iconSearch
    Sleep    10
    # ----Check Values
    #Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"1234")]    1234    # Check 'Code'
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"SurnameWebForm")]    SurnameWebForm    # Check 'Surname'
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"NameWebForm")]    NameWebForm    # Check 'Name'
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"razart.hasaj@smartfocus.com")]    razart.hasaj@smartfocus.com    # Check 'Email'
    capture page screenshot    # Teke snapshot befor deleted
    #-- Now Delete it
    Sleep    2
    Click Element    xpath=//*[@id="ccmd-member-archive-cell-delete0"]/input[@name="deleteMember"]    # Select delete
    Sleep    2
    Click Element    id=iconTrash    # Click delete Trash
    Sleep    3
    Click Element    css=#content > form > table.validationTable > tbody > tr > td.validationR > a    # Confirm
    Sleep    10
    capture page screenshot    # Take snapshot after deleted
