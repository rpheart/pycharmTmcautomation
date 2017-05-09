*** Settings ***
Documentation   test for creating a transactional content block
Default Tags    ui transactional
Resource        ../../Utils/keywords.robot
Resource        ../../Utils/transactional_content_block.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
#Suite Teardown  close all browsers

*** Test Cases ***
create_transactional_content_block
  open content  ${transactional_content_block}  ${transactional_content_block["button_add"]["add"]}
  input text  ${transactional_content_block["button_add"]["content_block_name_input"]}  QA Auto personalisaed Content Block
  input text  ${transactional_content_block["button_add"]["content_block_description_input"]}  Auto created
  add basic personlisation
  click element  ${generics["save"]}
  sleep  1
  alert should be present  text=Your Dynamic Content Block has been saved successfully.
  # verify that the message appears in the list page
  open content  ${transactional_content_block}  ${transactional_content_block["button_list"]["list"]}
  wait until element is visible     ${transactional_content_block["button_list"]["table"]}
  table cell should contain  ${transactional_content_block["button_list"]["table"]}  3  2  QA Auto personalisaed Content Block
  # preview the content block to verify personalisation
  some stuff
  # remove the test block
  delete latest transactional content block

*** Keywords ***
add basic personlisation
  click element  ${transactional_content_block["button_add"]["message_personalization"]}
  select frame  ${iframes["popup_frame"]}
  click element  ${transactional_content_block["button_add"]["message_personalization_dialog"]["if"]["tab"]}
  input text  ${transactional_content_block["button_add"]["message_personalization_dialog"]["if"]["parameter_input"]}  EMAIL
  select from list by label  ${transactional_content_block["button_add"]["message_personalization_dialog"]["if"]["if_operator"]}  =
  input text  ${transactional_content_block["button_add"]["message_personalization_dialog"]["if"]["value_input"]}  kseniya.domorad@smartfocus.com
  input text  ${transactional_content_block["button_add"]["message_personalization_dialog"]["if"]["then_input"]}  Your email is kseniya.domorad@smartfocus.com
  input text  ${transactional_content_block["button_add"]["message_personalization_dialog"]["if"]["else_input"]}  You are not Kseniya
  click element  ${transactional_content_block["button_add"]["message_personalization_dialog"]["add_to_body"]}
  alert should be present  text=Your personalisation has been added to your message.
  unselect frame
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
