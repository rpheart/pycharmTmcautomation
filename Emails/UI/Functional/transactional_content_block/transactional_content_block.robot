*** Settings ***
Documentation   test for creating a transactional content block
Default Tags    ui transactional
Resource        ../../Utils/keywords.robot
Resource        ../../Utils/transactional_content_block.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
Suite Teardown  close all browsers

*** Test Cases ***
create_transactional_content_block
  open content  ${transactional_content_block}  ${transactional_content_block["button_add"]["add"]}
  input text  ${transactional_content_block["button_add"]["content_block_name_input"]}  QA Auto personalised Content Block
  input text  ${transactional_content_block["button_add"]["content_block_description_input"]}  Auto created
  add basic personlisation
  click element  ${generics["save"]}
  sleep  1
  alert should be present  text=Your Dynamic Content Block has been saved successfully.
  # verify that the message appears in the list page
  open content  ${transactional_content_block}  ${transactional_content_block["button_list"]["list"]}
  wait until element is visible     ${transactional_content_block["button_list"]["table"]}
  table cell should contain  ${transactional_content_block["button_list"]["table"]}  3  2  QA Auto personalised Content Block
  # preview the content block to verify personalisation
  click element  ${transactional_content_block["button_list"]["preview_button"]}
  select frame  ${iframes["popup_frame"]}
  input text  ${transactional_content_block["button_list"]["preview_personalization"]}  kseniya.domorad@smartfocus.com
  click element  ${transactional_content_block["button_list"]["preview_button_confirmation"]}
  current frame contains  Your email is kseniya.domorad@smartfocus.com
  unselect frame
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  click element  ${generics["close_popup_box"]}
  # preview the content block with default value
  click element  ${transactional_content_block["button_list"]["preview_button"]}
  select frame  ${iframes["popup_frame"]}
  input text  ${transactional_content_block["button_list"]["preview_personalization"]}  patrick.summers@smartfocus.com
  click element  ${transactional_content_block["button_list"]["preview_button_confirmation"]}
  current frame contains  You are not Kseniya
  unselect frame
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  click element  ${generics["close_popup_box"]}
  # remove the test block
  delete latest transactional content block
