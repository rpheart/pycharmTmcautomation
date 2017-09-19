*** Settings ***
Documentation   tests for creating different types of webforms
Default Tags    ui  email  webform
Resource        ../../Utils/email_keywords.robot
Resource        ../../Utils/webform.robot
Resource        ../../Utils/subscriber.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
Test Setup      delete all members matching id  FIRSTNAME  equals  ${firstname}
Test Teardown   delete all members matching id  FIRSTNAME  equals  ${firstname}
Suite Teardown  close all browsers

*** Variables ***
${email}  qa.auto@smartfocus.com
${firstname}  NameWebForm
${lastname}  SurnameWebForm
${code}  1234

*** Test Cases ***
create_update_webform
  create basic update webform
  submit update members  ${email}  ${firstname}  ${lastname}  ${code}
  open content  ${webform}  ${webform["button_list"]["list"]}
  table row should contain  ${webform["button_list"]["table"]}  1  Qa Automation Test Webform
  # verify members added
  search for member  FIRSTNAME  equals  ${firstname}
  table column should contain  css=div#content > form > table.list  4  ${email}
  table column should contain  css=div#content > form > table.list  3  ${firstname}
  table column should contain  css=div#content > form > table.list  2  ${lastname}
