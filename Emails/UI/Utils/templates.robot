*** Settings ***
Documentation    keywords specific to the creation of messages using the classic builder

*** Keywords ***
set template name
    [Arguments]    ${template_name}
    wait until keyword succeeds    15x    1 sec    input text    ${template["button_add"]["template_name"]}    ${template_name}
    input text    ${template["button_add"]["template_description"]}    auto template

upload file
    choose file    ${template["button_add"]["upload_file"]}    ${EXECDIR}/Emails/UI/Utils/Resources/easter_eggs.dwt
    click element    ${template["button_add"]["import_file"]}

delete latest template
    open content    ${template}    ${template["button_list"]["list"]}
    select checkbox    //input[@name='deleteTemplate']
    click element    //*[@id='iconTrash']
    click element    //*[@id='iconTrash']

create basic template
    open content    ${template}    ${template["button_add"]["add"]}
    set template name    Qa Automation Test Template
    upload file
    current frame contains    Happy Easter
    click element    ${template["button_add"]["save"]}
    ${alert_message}=    get alert message
    should be equal as strings    ${alert_message}    template was successfully saved    ignore_case=True
