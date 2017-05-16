*** Settings ***
Documentation   basic set of tests for the new message builder
Default Tags    ui  email  nmb
Resource        ../../Utils/email_keywords.robot
Resource        ../../Utils/new_message_builder.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
Test Teardown   delete latest message
Suite Teardown  close all browsers

*** Test Cases ***
create_message_with_text
  create basic message
  verify message saved  Qa Automation Test Message

create_message_with_image
  open content  ${new_message_builder}  ${new_message_builder["button_add"]["add"]}
  set message name  Qa Automation Test Message
  add widget to canvas  ${new_message_builder["button_add"]["image_widget"]}
  add image to widget
  set mandatory headers
  click element  ${new_message_builder["button_add"]["save_and_finalize"]}
  verify message saved  Qa Automation Test Message

*** Keywords ***
verify message saved
  [Documentation]  verifies that the first row of the list page contains a message with the name provided
  [Arguments]  ${message_name}
  :for  ${n}  in range  5
  \  open content  ${new_message_builder}  ${new_message_builder["button_list"]["list"]}
  \  wait until element is visible  ${new_message_builder["button_list"]["first_row"]}
  \  ${message_created}=  run keyword and return status  element should contain  ${new_message_builder["button_list"]["first_row"]}  ${message_name}
  \  exit for loop if  ${message_created}
  element should contain  ${new_message_builder["button_list"]["first_row"]}  ${message_name}
