*** Settings ***
Documentation   tests for creating different types of landing pages
Default Tags    ui  email  landing_page
Library         DateTime
Resource        ../../Utils/email_keywords.robot
Resource        ../../Utils/landing_page.robot
Resource        ../../Utils/subscriber.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
Test Teardown   delete all members matching id  FIRSTNAME  equals  ${firstname}
Suite Teardown  close all browsers

*** Variables ***
${email}        qa.auto@smartfocus.com
${firstname}    landingPageFirstname
${lastname}     landingPageFirstname

*** Test Cases ***
create_insert_and_update_landing_page
  create and schedule landing page  ${landing_page["button_add"]["data_sync"]["insert_and_update_type"]}
  fill out basic landing page  ${email}  ${firstname}  ${lastname}
  verify members

create_unsubscribe_landing_page
  ${date}=  get current date  result_format=%m/%d/%Y
  add member  ${email}  ${firstname}   ${lastname}
  create and schedule landing page  ${landing_page["button_add"]["data_sync"]["unsubscribe_type"]}
  fill out basic landing page  ${email}  ${firstname}  ${lastname}
  verify members
  table column should contain  css=div#content > form > table.list  6  ${date}

*** Keywords ***
verify members
  [Documentation]  searches for members by email and verifies email/firstname/lastname combination
  search for member  EMAIL  equals  ${email}
  table column should contain  css=div#content > form > table.list  4  ${email}
  table column should contain  css=div#content > form > table.list  3  ${firstname}
  table column should contain  css=div#content > form > table.list  2  ${lastname}
