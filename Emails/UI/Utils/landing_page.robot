*** Settings ***
Documentation    Keywords specific to the creation of landing pages

*** Keywords ***
set page name
    [Arguments]    ${name}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_add"]["page_name"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_add"]["page_name"]}
    press key    ${landing_page["button_add"]["page_name_input"]}    \u0001    # Select All
    press key    ${landing_page["button_add"]["page_name_input"]}    \\127    # Delete
    input text    ${landing_page["button_add"]["page_name_input"]}    ${name}
    press key    ${landing_page["button_add"]["page_name_input"]}    \\13    # Return

add block
    [Arguments]    ${type}
    :for    ${n}    in range    10
    \    ${block_set}=    run keyword and return status    click element    ${type}
    \    exit for loop if    ${block_set}
    \    click element    ${landing_page["button_add"]["add_a_row"]}

create and schedule basic landing page
    open content    ${landing_page}    ${landing_page["button_add"]["add"]}
    set page name    Qa Auto Landing Page
    add block    ${landing_page["button_add"]["button_form"]}
    # add email
    input text    ${landing_page["button_add"]["label_input_field"]}    Email
    click element    ${landing_page["button_add"]["first_input_container"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_add"]["input_selector"]}
    click element at coordinates    ${landing_page["button_add"]["input_selector"]}    0    75
    # add firstname
    click element    //div[@class='lpages-editor-options-popup-iconpreference']
    sleep    1
    click element    //*[@id='lpages-editor-form-addfield-selector-button']
    click element    //*[@id='lpages-editor-form-addfield-input']
    input text    ${landing_page["button_add"]["label_input_field"]}    Firstname
    # add surname
    click element    //*[@id='lpages-editor-form-addfield-selector-button']
    click element    //*[@id='lpages-editor-form-addfield-input']
    input text    ${landing_page["button_add"]["label_input_field"]}    Surname
    click element    ${landing_page["button_add"]["save_and_schedule"]}
    # start landing page
    click element    //*[@id="lpages-prop-scheduler-start-date"]
    click element    //*[@id="lpages-prop-scheduler-stop-date"]
    # save and go to data sync page
    click element    ${landing_page["button_add"]["data_sync_page"]}
    click element    ${landing_page["button_add"]["data_sync_button"]}
    click element    ${landing_page["button_add"]["activate"]}
    # setup field personalisation link
    wait until keyword succeeds    15x    1 sec    click element    //*[@id="lpages-prop-datasync-insert-and-update"]
    click element    //*[@id="lpages-prop-datasync-formField-toggle1"]
    click element    //*[@id="lpages-prop-datasync-formField-toggle2"]
    click element    //*[@id="lpages-prop-datasync-fieldSelector2"]
    click element    //*[@id="lpages-prop-datasync-fieldSelector2"]/../div/*[@title='FIRSTNAME']
    click element    //*[@id="lpages-prop-datasync-formField-toggle3"]
    click element    //*[@id="lpages-prop-datasync-fieldSelector3"]
    click element    //*[@id="lpages-prop-datasync-fieldSelector3"]/../div/*[@title='LASTNAME']
    click element    //*[@id="lpages-prop-datasync-source-toggle"]
    click element    //*[@id="lpages-prop-btnsave"]

fill out basic landing page
    [Arguments]    ${email}    ${firstname}    ${lastname}
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_list"]["first_row"]}
    click element    ${landing_page["button_list"]["properties"]}
    ${landing_page_url}=    get text    ${landing_page["button_add"]["landing_page_url"]}
    click element    ${landing_page["button_add"]["landing_page_url"]}
    wait until keyword succeeds    15x    1 sec    select window    url=${landing_page_url}
    input text    //input[@name='Email']    ${email}
    input text    //input[@name='Firstname']    ${firstname}
    input text    //input[@name='Surname']    ${lastname}
    click element    //*[@type="submit"]
    close window
    select window    ${document_title}

delete latest landing page
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_list"]["first_row"]}
    click element    ${landing_page["button_list"]["delete"]}
    click element    ${landing_page["button_list"]["yes"]}
    current frame contains    The page has been deleted.
