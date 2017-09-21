*** Settings ***
Documentation   tests for creating different types of messages
Default Tags    ui  email  cmb
Resource        ../../Utils/email_keywords.robot
Resource        ../../Utils/classic_message_builder.robot
Resource        ../../Utils/dynamic_content_block.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
Test Teardown   delete latest message
Suite Teardown  close all browsers

*** Test Cases ***
create_classic_message
  [Tags]  smoke
  create basic message
  open content  ${classic_message_builder}  ${classic_message_builder["button_list"]["list"]}
  table row should contain  ${classic_message_builder["button_list"]["table"]}  1  Qa Automation Test Message

create_classic_message_with_dynamic_content_block
  open content  ${classic_message_builder}  ${classic_message_builder["button_add"]["add"]}
  set headers  Qa Automation Test Message
  click element  ${classic_message_builder["button_add"]["body_accordion"]}
  wait until keyword succeeds  5x  1 sec  click element  ${generics["insert_dynamic_content_block"]["link"]}
  select frame  ${iframes["popup_frame"]}
  ${block_id}=  get text  //table[@class='list']//tbody/tr[1]/td[1]
  click element  ${generics["first_add_button"]}
  select window  ${document_title}
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  textarea should contain  ${classic_message_builder["button_add"]["text_editor"]}  ${block_id}
  click element  ${classic_message_builder["button_add"]["save_button"]}

create_bounce_back_message
  [Documentation]  verify that only bounce back messages appear in the webform bounce back table
  delete bounce back messages
  # create bounce back message
  open content  ${classic_message_builder}  ${classic_message_builder["button_add"]["add"]}
  set headers  Qa Automation Bounce Back Message
  click element  ${classic_message_builder["button_add"]["bounce_back_checkbox"]}
  click element  ${classic_message_builder["button_add"]["save_button"]}
  # verify it appears in bounce back table in webform
  verify bounce back table in webform builder
  element should contain  ${webform["button_add"]["first_row_bounce_back_table"]}  Qa Automation Bounce Back Message
  # remove the 'is bounce back message' flag
  open content  ${classic_message_builder}  ${classic_message_builder["button_list"]["list"]}
  click element  ${classic_message_builder["button_list"]["edit"]}
  current frame contains  Qa Automation Bounce Back Message
  click element  ${classic_message_builder["button_add"]["header_accordion"]}
  click element  ${classic_message_builder["button_add"]["bounce_back_checkbox"]}
  click element  ${classic_message_builder["button_add"]["save_button"]}
  # verify it appears in bounce back table in webform
  verify bounce back table in webform builder
  element should not contain  ${webform["button_add"]["first_row_bounce_back_table"]}  Qa Automation Bounce Back Message
  delete bounce back messages
  [Teardown]

create_message_with_emojis
  [Documentation]  verify that you can open the emoji dialog more than once and add emojis to a message and save
  open content  ${classic_message_builder}  ${classic_message_builder["button_add"]["add"]}
  set headers  Qa Automation Emoji Message
  click element  ${classic_message_builder["button_add"]["body_accordion"]}
  # open the insert emoji dialog
  click element  ${classic_message_builder["button_add"]["insert_emoji_link"]}
  wait until element is visible  ${iframes["popup_frame"]}
  click element  ${generics["close_popup_box"]}
  # open the insert emoji dialog again
  click element  ${classic_message_builder["button_add"]["insert_emoji_link"]}
  select frame  ${iframes["popup_frame"]}
  double click element  ${classic_message_builder["button_add"]["first_emoji"]}
  unselect frame
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  click element  ${generics["close_popup_box"]}
  # verify the emoji is present in the message
  click element  ${classic_message_builder["button_add"]["save_button"]}
  element should contain  ${classic_message_builder["button_add"]["text_editor"]}  [EMV EMOJI]
  # verify the message is saved
  open content  ${classic_message_builder}  ${classic_message_builder["button_list"]["list"]}
  table row should contain  ${classic_message_builder["button_list"]["table"]}  3  1  Qa Automation Emoji Message

external_content_block
  [Documentation]  verify that you can insert external content blocks into a message and save
  open content  ${classic_message_builder}  ${classic_message_builder["button_add"]["add"]}
  set headers  Qa Automation External Content Message
  set body  [EMV TEXTPART][EMV HTMLPART]<html><body>&&&</body></html>
  click element  ${classic_message_builder["button_add"]["external_content_link"]}
  select frame  ${iframes["popup_frame"]}
  input text  ${classic_message_builder["button_add"]["content_file_url"]}  https://www.google.co.uk/search?q=
  select from list by label  ${classic_message_builder["button_add"]["external_content_field_selector"]}  FIRSTNAME
  click element  ${generics["first_add_button"]}
  click element  ${classic_message_builder["button_add"]["generate_external_content"]}
  unselect frame
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  click element  ${classic_message_builder["button_add"]["save_button"]}
  element should contain  ${classic_message_builder["button_add"]["text_editor"]}  [EMV URLNAME]https://www.google.co.uk/search?q=[EMV FIELD]FIRSTNAME[EMV /FIELD][EMV /URLNAME]
  open content  ${classic_message_builder}  ${classic_message_builder["button_list"]["list"]}
  table row should contain  ${classic_message_builder["button_list"]["table"]}  3  1  Qa Automation External Content Message

*** Keywords ***
verify bounce back table in webform builder
  open content  ${webform}  ${webform["button_add"]["add"]}
  # page 1
  input text  ${webform["button_add"]["name"]}  Qa Automation Test Webform
  input text  ${webform["button_add"]["description"]}  auto generated
  select from list by label  ${webform["button_add"]["select_languages"]}  English
  click element  ${webform["button_add"]["select_date"]}
  click element  ${webform["button_add"]["today_date"]}
  input text  ${webform["button_add"]["confirm_url"]}  http://www.smartfocus.com
  input text  ${webform["button_add"]["error_url"]}  https://imgs.xkcd.com/comics/new_bug.png
  click element  ${webform["button_add"]["next_step"]}
  # page 2
  select from list by label  ${webform["button_add"]["webform_type"]}  Update or subscribe webform
  # field 1
  select from list by label  //*[@id='entry[0]']/td[1]/select  EMAIL
  input text  //*[@id='entry[0]']/td[3]/input  Email
  select from list by label  //*[@id='entry[0]']/td[4]/select  TEXT
  select from list by label  //*[@id='entry[0]']/td[7]/select  EMAIL
  click element  ${webform["button_add"]["next_step"]}
  # page 3
  select from list by label  ${webform["button_add"]["bounce_back_type"]}  User

delete bounce back messages
  open content  ${classic_message_builder}  ${classic_message_builder["button_list"]["list"]}
  input text  ${generics["search_input"]}  Qa Automation Bounce Back Message
  click element  ${generics["search_button"]}
  run keyword and ignore error  click element  ${generics["select_all"]}
  run keyword and ignore error  click element  ${classic_message_builder["button_list"]["delete"]}
  run keyword and ignore error  click element  ${classic_message_builder["button_list"]["delete"]}
