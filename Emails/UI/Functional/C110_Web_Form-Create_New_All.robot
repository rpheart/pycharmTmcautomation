*** Settings ***
Suite Teardown    Suite_Teardown
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword

*** Variables ***
${screenshots}    ${EMPTY}
${dynamic_content_ID}    ${EMPTY}

*** Test Cases ***
C110_Web_Form-Create_New_All
    Create_Add_Thumbnail
    Fill_Input_Webform_Information
    Choose_A_Webform_Type
    Set_Confirmation_Email_Info_And_Save
    Search_Subsriibe_Checks
    Delete_Subscriber
    Suite_Teardown

*** Keywords ***
Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Create_Add_Thumbnail
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
    Click Element    name=name
    input text    name=name    QA Webform test    # Add \ name
    Sleep    2
    input text    name=description    QA Webform for testing only    # Add description
    Sleep    7
    Click Element    name=language    # Controls warning language
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table/tbody/tr/td/select/option[contains(text(),"English")]    # Selects 'English'
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
    Input Text    xpath=//*[@id="entry[0]"]/td[3]/input    Email
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
    Input Text    xpath=//*[@id="entry[1]"]/td[3]/input    Firstname    #Display Name
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
    Input Text    xpath=//*[@id="entry[2]"]/td[3]/input    Lastname    #Display Name
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
    Input Text    xpath=//*[@id="entry[3]"]/td[3]/input    Code
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
    Click Element    xpath=//*[@id="bounceBackSection"]/tbody/tr[2]/td[2]/select/option[contains(text(), 'User')]    # Select 'Users' from Send Confirmation to
    Sleep    2
    Input Text    name=replyTo    qa.test@smartfocus.com    # Reply-To Email address
    Sleep    2
    Click Element    name=messageId    # Tick 'Confirmation message
    Sleep    2
    Click Element    id=iconButtonPersonnalisation    # Click 'Save Webform'
    Sleep    2
    #--- Webform Preview
    Input Text    id=EMAIL_FIELD    qa.auto@smartfocus.com    # Input 'Email'
    Sleep    2
    Input Text    id=FIRSTNAME_FIELD    NameWebForm    # Input 'Name'
    Sleep    2
    Input Text    id=LASTNAME_FIELD    SurnameWebForm    # Input 'Surname'
    Sleep    2
    Input Text    id=CODE_FIELD    1234    # input 'Code'
    Sleep    3
    Click Element    xpath=//*[@id="emvForm"]/table/tbody/tr[5]/td/input    # Save
    Sleep    5
    capture page screenshot    # Snapshot after deleting content

Search_Subsriibe_Checks
    # ----Edit Message
    Go To    ${URL}sfui/i#engage/list/search/subscriber    # Go to: \ 'Search Subsribe'
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click: \ on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click: on inner frame
    Sleep    3
    Wait Until Page Contains    Search Criteria    timeout=30
    #----Go to: List Management > Search Subsribe
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[1]/select    # Click: 'Database Field'
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[1]/select/option[contains(text(), 'EMAIL')]    # Select: \ 'EMAIL'
    Sleep    3
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[2]/select    # Click: 'Select Operator'
    Sleep    3
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr[2]/td[2]/select/option[contains(text(), 'contains')]    # Select: 'Contains'
    Sleep    3
    Input Text    name=textFieldValue    qa.auto@smartfocus.com    # Input: 'Email'
    Sleep    2
    Click Element    xpath=//*[@id="iconAddCriteria"]    # Click: on Icond 'Add'
    Sleep    5
    Click Element    id=iconSearch
    # ----Check Values
    Wait Until Element is Visible    //*[@id="content"]/form/table/thead/tr/th[contains(text(),"Last name")]    timeout=15
    Wait Until Element is Visible    //*[@id="content"]/form/table/thead/tr/th[contains(text(),"First Name")]    timeout=15
    Sleep    2
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"SurnameWebForm")]    SurnameWebForm    # Check 'Surname'
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"NameWebForm")]    NameWebForm    # Check 'Name'
    Element Should Contain    xpath=//*[@id="rows"]/tr/td[contains(text(),"qa.auto@smartfocus.com")]    qa.auto@smartfocus.com    # Check 'Email'
    capture page screenshot    # Teke snapshot befor deleted

Delete_Subscriber
    #-- Now Delete it
    Sleep    2
    Click Element    xpath=//*[@id="ccmd-member-archive-cell-delete0"]/input[@name="deleteMember"]    # Select delete
    Sleep    2
    Click Element    id=iconTrash    # Click delete Trash
    Sleep    3
    Click Element    css=#content > form > table.validationTable > tbody > tr > td.validationR > a    # Confirm
    Sleep    10
    capture page screenshot    # Take snapshot after deleted

Suite_Teardown
    Close All Browsers
