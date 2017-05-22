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
  set message name  Qa Automation Image Message
  add widget to canvas  ${new_message_builder["button_add"]["image_widget"]}
  add image to widget
  set mandatory headers
  click element  ${new_message_builder["button_add"]["save_and_finalize"]}
  verify message saved  Qa Automation Image Message

verify_content_block_links_in_message
  open content  ${new_message_builder}  ${new_message_builder["button_add"]["add"]}
  set message name  Qa Content Block Link Duplication
  click element  ${new_message_builder["button_add"]["empty_canvas"]}
  click element  ${new_message_builder["button_add"]["empty_block_menu"]}
  click element  ${new_message_builder["button_add"]["add_column"]}
  add widget to canvas  ${new_message_builder["button_add"]["image_widget"]}
  add image to widget
  add widget to canvas  ${new_message_builder["button_add"]["image_widget"]}
  add image to widget  link=https://www.google.co.uk
  create content block from row  link duplication
  insert content block  link duplication
  set mandatory headers
  click element  ${new_message_builder["button_add"]["save_and_finalize"]}
  preview message
  # verify links are as defined in the message
  xpath should match x times  //a[@href='http://www.smartfocus.com/en']  2
  xpath should match x times  //a[@href='https://www.google.co.uk']  2
  close window

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

create content block from row
  [Documentation]  drags the first row of the message into the content block panel to save it
  [Arguments]  ${content_block_name}
  :for  ${n}  in range  5
  \  ${tests_open}=  run keyword and return status  click element  ${new_message_builder["button_add"]["contents_panel"]}
  \  exit for loop if  ${tests_open}
  \  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["add_content"]}
  \  sleep  0.5
  sleep  0.5
  click element  ${new_message_builder["button_add"]["content_blocks"]}
  click element  ${new_message_builder["button_add"]["editor_table"]}
  click element  //div[@class='action right']
  drag and drop  ${new_message_builder["button_add"]["drag_icon"]}  ${new_message_builder["button_add"]["content_blocks"]}
  input text  ${new_message_builder["button_add"]["content_block_name_input"]}  ${content_block_name}
  click element  ${new_message_builder["button_add"]["content_block_save"]}

insert content block
  [Documentation]  adds a content block to the message by name
  [Arguments]  ${block_name}
  :for  ${n}  in range  5
  \  ${tests_open}=  run keyword and return status  click element  ${new_message_builder["button_add"]["contents_panel"]}
  \  exit for loop if  ${tests_open}
  \  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["add_content"]}
  \  sleep  0.5
  sleep  0.5
  click element  ${new_message_builder["button_add"]["content_blocks"]}
  wait until keyword succeeds  5x  1 sec  input text  ${new_message_builder["button_add"]["content_block_search_input"]}  ${block_name}
  click element  ${new_message_builder["button_add"]["content_block_search_button"]}
  ${block_xpath}=  catenate  SEPARATOR=  //div[./text()='  ${block_name}  ']/../div[@class="insert-button"]
  wait until keyword succeeds  5x  1 sec  click element  ${block_xpath}

preview message
  [Documentation]  opens the tests panel and opens a preview in a new tab
  :for  ${n}  in range  5
  \  ${tests_open}=  run keyword and return status  click element  ${new_message_builder["button_add"]["tests_panel"]}
  \  exit for loop if  ${tests_open}
  \  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["tests"]}
  \  sleep  0.5
  sleep  0.5
  click element  ${new_message_builder["button_add"]["preview_button"]}
  select window  Message builder
  select frame  ${iframes["tab_preview"]}
