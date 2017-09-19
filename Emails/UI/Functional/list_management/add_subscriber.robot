*** Settings ***
Documentation   test directly adding members to the database
Default Tags    ui  email  list
Resource        ../../Utils/email_keywords.robot
Resource        ../../Utils/subscriber.robot
Suite Setup     run keywords  login
...             AND  go to ${system_page["email"]}
Test Setup      delete all members matching id   EMAIL  equals  ${email}
Test Teardown   delete all members matching id   EMAIL  equals  ${email}
Suite Teardown  close all browsers

*** Variables ***
${email}        add_subscriber@test.com
${firstname}    add
${lastname}     subscriber

*** Test Cases ***
add_new_subscriber
  open content  ${add_subscriber}  ${add_subscriber["button_add"]["add"]}
  input text  ${add_subscriber["button_add"]["input_fields"]["email"]}  ${email}
  input text  ${add_subscriber["button_add"]["input_fields"]["firstname"]}  ${firstname}
  input text  ${add_subscriber["button_add"]["input_fields"]["lastname"]}  ${lastname}
  click element  ${add_subscriber["button_add"]["save_member"]}
  current frame contains  Your member has been successfully saved.

  # verify members have been added
  search for member  EMAIL  contains  ${email}
  table column should contain  css=div#content > form > table.list  4  ${email}
  table column should contain  css=div#content > form > table.list  3  ${firstname}
  table column should contain  css=div#content > form > table.list  2  ${lastname}
