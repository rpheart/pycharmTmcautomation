*** Settings ***
Documentation   test for transactional content block list options
Default Tags    ui  email  cmb
Resource        ../../Utils/email_keywords.robot
Resource        ../../Utils/transactional_content_block.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
...             AND  create basic content block
Suite Teardown  run keywords  delete latest transactional content block
...             AND  close all browsers

*** Test Cases ***
transactional_content_block_preview
  open content  ${transactional_content_block}  ${transactional_content_block["button_list"]["list"]}
  click element   ${transactional_content_block["button_list"]["preview_button"]}
  select frame  ${iframes["popup_frame"]}
  click element   ${transactional_content_block["button_list"]["preview_button_confirmation"]}
  current frame contains  Dynamic Content Block Preview
  current frame contains  QA Auto Content Block
  unselect frame
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  click element  ${generics["close_popup_box"]}

transactional_content_block_edit
   open content  ${transactional_content_block}  ${transactional_content_block["button_list"]["list"]}
   click element   ${transactional_content_block["button_list"]["edit_button"]}
   input text  ${transactional_content_block["button_add"]["content_block_name_input"]}  QA Auto transactional Content Block Edit
   input text  ${transactional_content_block["button_add"]["content_block_body_input"]}  <p>QA Auto Content Block Edited</p>
   click element  ${generics["save"]}
   sleep  1
   alert should be present  text=Your Dynamic Content Block has been saved successfully.

transactional_content_block_copy
   open content  ${transactional_content_block}  ${transactional_content_block["button_list"]["list"]}
   click element   ${transactional_content_block["button_list"]["copy_button"]}
   click element   ${generics["save"]}
   current frame contains  Copy of QA Auto transactional Content Block

transactional_content_block_delete
   delete latest transactional content block
   current frame should not contain  Copy of QA Auto transactional Content Block
