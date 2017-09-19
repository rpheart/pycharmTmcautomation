*** Settings ***
Documentation   test for creating a transactional content block
Default Tags    ui  email  transactional
Resource        ../../Utils/email_keywords.robot
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
  # preview the content block true value
  verify personalisation value  kseniya.domorad@smartfocus.com  Your email is kseniya.domorad@smartfocus.com
  # preview the content block false value
  verify personalisation value  patrick.summers@smartfocus.com  You are not Kseniya
  # remove the test block
  delete latest transactional content block

*** Keywords ***
verify personalisation value
  [Documentation]  verifies the returned value in a personlisation if statement
  [Arguments]  ${input}  ${expected_text}
  click element  ${transactional_content_block["button_list"]["preview_button"]}
  select frame  ${iframes["popup_frame"]}
  input text  ${transactional_content_block["button_list"]["preview_personalization"]}  ${input}
  click element  ${transactional_content_block["button_list"]["preview_button_confirmation"]}
  current frame contains  ${expected_text}
  unselect frame
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  click element  ${generics["close_popup_box"]}
