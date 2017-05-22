*** Settings ***
Documentation   keywords specific to the creation of content blocks

*** Keywords ***
create basic content block
  open content  ${content_block}  ${content_block["button_add"]["add"]}
  input text  ${content_block["button_add"]["name"]}  QA Auto Content Block
  input text  ${content_block["button_add"]["description"]}  auto created
  input text  ${content_block["button_add"]["text_content"]}  <p>QA Auto Content Block</p>
  click element  ${content_block["button_add"]["save"]}
  sleep  1
  alert should be present  text=Your Dynamic Content Block has been saved successfully.

delete latest content block
  open content  ${content_block}  ${content_block["button_list"]["list"]}
  wait until keyword succeeds  5x  1 sec  click element  ${content_block["button_list"]["first_row"]}
  click element  ${content_block["button_list"]["delete_button"]}
  click element  ${content_block["button_list"]["delete_confirm"]}
  wait until page contains  Your message has been successfully deleted.
