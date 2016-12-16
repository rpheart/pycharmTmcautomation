*** Settings ***
Documentation
Resource            ../Utils/keywords.robot

*** Variables ***
${sms_message_builder}    ${EMPTY}

# *** Test Cases ***
#C95_SMS_Message-Create_Message_All
    #Create_Add_Thumbnail
    #Add_Message_Text_Save_Confirm
    #Edit_SMS_Message
    #Copy_SMS_Message
    #Repeat Keyword    2    Delete_SMS_Message
    #Suite_Teardown

#*** Keywords ***
#Fail keyword
    #log source
    #run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

*** Test Cases ***
login and go to create new sms message
    Login
    Go To ${System_Page["email"]}
    Open Content    ${sms_message_builder}    ${sms_message_builder["button_add"]["add"]}

#Create_Add_Thumbnail
    #Click Element    xpath=//*[@id="engage-create"]/div[1]    # Click 'Create'
    #Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    timeout=10    # Wait for SMS Message to appear
    #Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    # Click 'SMS Message'
    #Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    #Select frame    ${iframes["top"]}    #Click on main frame
    #Wait Until element Is Visible    ${iframes["ccmd"]}
    #Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    #Wait Until Page Contains    Create Your Message Header and Body Below    timeout=30

Add_Message_Text_Save_Confirm
    # Create the SMS message
    Sleep    5
    Click Element    ${sms_message_builder["button_add"]["name_input"]}
    input text    ${sms_message_builder["button_add"]["name_input"]}    SMS Message Test    # Add SMS message name
    Sleep    2
    input text    ${sms_message_builder["button_add"]["description_input"]}    SMS Message for automation test    # Add description
    Sleep    2
    input text    ${sms_message_builder["button_add"]["from_input"]} qa-sms-message-from    07904444615    # Add number
    Sleep    2
    input text    ${generics["text_box"]}    SMS body text added for automation test only    # Add some body text
    Sleep    2
    Click Element    ${sms_message_builder["button_add"]["save_and_go_to_sms_messages_button"]}    # Save and go to SMS Messages
    Sleep    2
    Element Should Contain    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-name1"]    SMS Message Test
    Sleep    2

Edit_SMS_Message
    # Edit the SMS message
    Click Element    ${generics["edit_button"]}
    Sleep    2
    Wait Until Page Contains    Create Your Message Header and Body Below    timeout=30
    Sleep    2
    input text    ${generics["text_box"]}    I am adding some more text for testing    # Edit the existing message
    Sleep    2
    Click Element    ${sms_message_builder["button_add"]["save_and_go_to_sms_messages_button"]}    #Save and go to SMS Messages

Copy_SMS_Message
    # Copy Existing message
    Click Element    ${generics["copy_button"]}
    Wait Until Page Contains    Choose a new name for your message copy below    timeout=30
    Element Should Contain    //*[@id="content"]/table[1]/tbody/tr/td/span    Choose    # Checks
    Element Should Contain    //*[@id="content"]/form/table/tbody/tr/td[1]/span    New Name:    # Checks
    Clear Element Text    ${generics["new_name_input"]}
    Sleep    2
    Input Text    ${generics["new_name_input"]}    Duplicate from SMS Message Test
    Sleep    2
    Click Element    css=#content > table.validationTable > tbody > tr > td.validationR > a    # Save duplicated message
    Sleep    2
    Unselect Frame

Delete_SMS_Message
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    # Delete SMS Message
    Click Element    xpath=//*[@id="content"]/table/tbody/tr/td[@id="ccmd-messages-cell-delete1"]/input[@name="deleteMessage"]    # Select Delete
    Sleep    2
    Click Element    ${generics["delete_icon"]}    # Trash message
    Wait Until Page Contains    Message(s) to delete    # Check Delete page
    Sleep    2
    Click Element    xpath=//*[@id="content"]/form/table[2]/tbody/tr/td[2]/a    # Confirm Delete
    Sleep    2
    Unselect frame
    Sleep    5

Suite_Teardown
    Close All Browsers
