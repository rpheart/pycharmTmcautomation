*** Settings ***
Documentation    keywords specific to the creation of webforms

*** Keywords ***
create basic update webform
    [Documentation]    creates an update webform with email, firstname, lastname and code
    open content    ${webform}    ${webform["button_add"]["add"]}
    # page 1
    input text    ${webform["button_add"]["name"]}    Qa Automation Test Webform
    input text    ${webform["button_add"]["description"]}    auto generated
    select from list by label    ${webform["button_add"]["select_languages"]}    English
    click element    ${webform["button_add"]["select_date"]}
    click element    ${webform["button_add"]["today_date"]}
    input text    ${webform["button_add"]["confirm_url"]}    http://www.smartfocus.com
    input text    ${webform["button_add"]["error_url"]}    https://imgs.xkcd.com/comics/new_bug.png
    click element    ${webform["button_add"]["next_step"]}
    # page 2
    select from list by label    ${webform["button_add"]["webform_type"]}    Update webform
    # field 1
    select from list by label    //*[@id='entry[0]']/td[1]/select    EMAIL
    input text    //*[@id='entry[0]']/td[3]/input    Email
    select from list by label    //*[@id='entry[0]']/td[4]/select    TEXT
    select from list by label    //*[@id='entry[0]']/td[7]/select    EMAIL
    # field 2
    click element    ${webform["button_add"]["add_criteria"]}
    select from list by label    //*[@id='entry[1]']/td[1]/select    FIRSTNAME
    input text    //*[@id='entry[1]']/td[3]/input    Firstname
    select from list by label    //*[@id='entry[1]']/td[4]/select    TEXT
    select from list by label    //*[@id='entry[1]']/td[7]/select    NONE
    # field 3
    click element    ${webform["button_add"]["add_criteria"]}
    select from list by label    //*[@id='entry[2]']/td[1]/select    LASTNAME
    input text    //*[@id='entry[2]']/td[3]/input    Lastname
    select from list by label    //*[@id='entry[2]']/td[4]/select    TEXT
    select from list by label    //*[@id='entry[2]']/td[7]/select    NONE
    # field 4
    click element    ${webform["button_add"]["add_criteria"]}
    select from list by label    //*[@id='entry[3]']/td[1]/select    CODE
    input text    //*[@id='entry[3]']/td[3]/input    Code
    select from list by label    //*[@id='entry[3]']/td[4]/select    TEXT
    select from list by label    //*[@id='entry[3]']/td[7]/select    INTEGER
    click element    ${webform["button_add"]["next_step"]}
    # page 3
    select from list by label    ${webform["button_add"]["bounce_back_type"]}    User
    input text    ${webform["button_add"]["reply_to_email"]}    qa.test@smartfocus.com
    click element    ${webform["button_add"]["first_message_id"]}
    click element    ${webform["button_add"]["save_webform"]}

submit update members
    [Arguments]    ${email}    ${firstname}    ${lastname}    ${code}
    input text    //*[@id='EMAIL_FIELD']    ${email}    # qa.auto@smartfocus.com
    input text    //*[@id='FIRSTNAME_FIELD']    ${firstname}    # NameWebForm
    input text    //*[@id='LASTNAME_FIELD']    ${lastname}    # SurnameWebForm
    input text    //*[@id='CODE_FIELD']    ${code}    # 1234
    click element    ${webform["button_add"]["submit_form"]}
    ${url}=    get location
    should contain    ${url}    http://www.smartfocus.com
    go to    ${${env}["ui_server"]}
    go to ${system_page["email"]}
