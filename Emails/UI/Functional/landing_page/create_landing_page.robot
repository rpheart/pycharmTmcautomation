*** Settings ***
Documentation       tests for creating different types of landing pages
Default Tags        ui    email    landing_page
Library             DateTime
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/landing_page.robot
Resource            ../../Utils/subscriber.robot
Suite Setup         run keywords    login
...                 AND    go to ${System_Page["email"]}
Suite Teardown      close all browsers

*** Variables ***
${email}    qa.auto@smartfocus.com
${firstname}    landingPageFirstname
${lastname}    landingPageFirstname

*** Test Cases ***
create_landing_page_insert_and_update
    create and schedule basic landing page
    fill out basic landing page    ${email}    ${firstname}    ${lastname}
    search for member    FIRSTNAME    equals    ${firstname}
    table column should contain    css=div#content > form > table.list    4    ${email}
    table column should contain    css=div#content > form > table.list    3    ${firstname}
    table column should contain    css=div#content > form > table.list    2    ${lastname}
    delete all members matching id        FIRSTNAME    equals    ${firstname}

create_basic_landing_page_unsubscribe
    ${date} =    get time
    ${date}=    Get Current Date    result_format=%m/%d/%Y
    add member    suspensiontest@qa.com    suspensionFirstname     suspensionLastname
    open content    ${landing_page}    ${landing_page["button_add"]["add"]}
    # add suspension form and save and schedule
    set page name    Qa Auto Landing Page Unsubscribe
    add block    ${landing_page["button_add"]["button_form"]}
    # add email
    input text    ${landing_page["button_add"]["input_container_field"]}    Email
    double click element     ${landing_page["button_add"]["input_container_field"]}      #   click inside the field
    sleep   2
    click element      //div[@class='flecheContainer']       # choose field type
    click element      //div[@class='absoluteSelect absoluteSelectBottom']/div[text()='Email']  # choose type email
    click element    //div[@class='lpages-emvfields']     # click on emv field personalisation
    sleep   2
    click element    //div[@class='lpages-emvfields lpages-emvfields-opened-bottom']//div[@class='lpages-emvfield-container']/div[text()='EMAIL']      #  map to email field
    click element    //div[@class='lpages-editor-options-popup-iconpreference']

    # add firstname
    click element    //div[@id='lpages-editor-form-addfield-selector-button']     #   add new field
    sleep    2
    click element      //div[@id='lpages-editor-form-addfield-input']        # choose field type

    input text    ${landing_page["button_add"]["input_container_field"]}    Firstname     # input a label
    click element    //div[./text()='Firstname']      # click on label to open options
    sleep   2
    click element      //div[@class='flecheContainer']       # choose field type
    click element    //div[@class='lpages-emvfields']     # click on emv field personalisation
    sleep   2
    click element    //div[@class='lpages-emvfields lpages-emvfields-opened-bottom']//div[@class='lpages-emvfield-container']/div[text()='FIRSTNAME']   #  map to firstname field
    click element    //div[@class='lpages-editor-options-popup-iconpreference']

     # add lastname
    click element    //div[@id='lpages-editor-form-addfield-selector-button']     #   add new field
    sleep    2
    click element      //div[@id='lpages-editor-form-addfield-input']        # choose field type

    input text    ${landing_page["button_add"]["input_container_field"]}    Lastname     # input a label
    click element    //div[./text()='Lastname']      # click on label to open options
    sleep   2
    click element      //div[@class='flecheContainer']       # choose field type
    click element    //div[@class='lpages-emvfields']     # click on emv field personalisation
    sleep   2
    click element    //div[@class='lpages-emvfields lpages-emvfields-opened-bottom']//div[@class='lpages-emvfield-container']/div[text()='LASTNAME']   #  map to firstname field

    # save and schedule
    click element    ${landing_page["button_add"]["save_and_schedule"]}

     # start landing page
    click element    //*[@id="lpages-prop-scheduler-start-date"]
    click element    //*[@id="lpages-prop-scheduler-stop-date"]
    # save and go to data sync page
    click element    ${landing_page["button_add"]["data_sync_page"]}
    click element    ${landing_page["button_add"]["data_sync_button"]}
    click element    ${landing_page["button_add"]["activate"]}
    # setup field personalisation link
    wait until keyword succeeds    15x    1 sec    click element    //*[@id="lpages-prop-datasync-unsubscribe"]
    click element    //*[@id="lpages-prop-btnsave"]

    fill out basic landing page    suspensiontest@qa.com    suspensionFirstname     suspensionLastname
    search for member    EMAIL    equals    suspensiontest@qa.com
    table column should contain    css=div#content > form > table.list    4    suspensiontest@qa.com
    table column should contain    css=div#content > form > table.list    3    suspensionFirstname
    table column should contain    css=div#content > form > table.list    2    suspensionLastname
    table column should contain    css=div#content > form > table.list    6    ${date}
    delete all members matching id        EMAIL    equals    suspensiontest@qa.com

