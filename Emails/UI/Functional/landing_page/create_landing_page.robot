*** Settings ***
Documentation       tests for creating different types of landing pages
Default Tags        ui    email    landing_page
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
create_landing_page
    create and schedule basic landing page
    fill out basic landing page    ${email}    ${firstname}    ${lastname}

verify_members_added
    search for member    FIRSTNAME    equals    ${firstname}
    table column should contain    css=div#content > form > table.list    4    ${email}
    table column should contain    css=div#content > form > table.list    3    ${firstname}
    table column should contain    css=div#content > form > table.list    2    ${lastname}
    delete all members matching id        FIRSTNAME    equals    ${firstname}
