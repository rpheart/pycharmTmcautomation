*** Settings ***
Documentation   test for creating a transactional message with content block
Default Tags    ui  email  transactional
Resource         ../../Utils/keywords.robot
Resource        ../../Utils/transactional_content_block.robot
Resource        ../../Utils/transactional_message.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
Test Teardown   delete latest transactional message
Suite Teardown  close all browsers

*** Test Cases ***
create_transactional_message
  open content  ${transactional_message}  ${transactional_message["button_add"]["add"]}
  set headers  QA Auto transactional message
  clear element text  ${transactional_message["button_add"]["text_content"]}
  input text  ${transactional_message["button_add"]["text_content"]}  [EMV TEXTPART][EMV HTMLPART]<html><body>My Test</body></html>
  click element  ${transactional_message["button_add"]["save"]}
  alert should be present  text=Your Template has been saved successfully
  open content  ${transactional_message}  ${transactional_message["button_list"]["list"]}
  table row should contain  ${transactional_message["button_list"]["table"]}  1  	QA Auto transactional message

send_test_message_with_content_block
  open content  ${transactional_content_block}  ${transactional_content_block["button_add"]["add"]}
  input text  ${transactional_content_block["button_add"]["content_block_name_input"]}  QA Auto transactional Content Block
  add basic personlisation
  click element  ${generics["save"]}
  sleep  1
  alert should be present  text=Your Dynamic Content Block has been saved successfully.
  open content  ${transactional_content_block}  ${transactional_content_block["button_list"]["list"]}
  ${block_id}=  get table cell  ${transactional_content_block["button_list"]["table"]}  3  1
  open content  ${transactional_message}  ${transactional_message["button_add"]["add"]}
  set headers  QA Auto transactional message
  click element  ${transactional_message["button_add"]["insert_dynamic_content_block"]}
  select frame  ${iframes["popup_frame"]}
  table row should contain  ${transactional_message["button_list"]["table"]}  1  ${block_id}
  click element  ${transactional_message["button_add"]["add_button"]}
  unselect frame
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  click element  ${transactional_message["button_add"]["save"]}
  alert should be present  text=Your Template has been saved successfully
  click element  ${transactional_message["button_add"]["send_test"]}
  send test emails  personalisation_field=kseniya.domorad@smartfocus.com
  delete latest transactional content block
  [Teardown]

