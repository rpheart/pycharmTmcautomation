*** Settings ***
Documentation  keywords specific to the creation of messages using the new builder

*** Keywords ***
set message name
  [Arguments]  ${name}
  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["message_name"]}
  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["message_name_input"]}
  press key  ${new_message_builder["button_add"]["message_name_input"]}  \u0001  # Select All
  press key  ${new_message_builder["button_add"]["message_name_input"]}  \\127  # Delete
  press key  ${new_message_builder["button_add"]["message_name_input"]}  \u0001  # Select All
  press key  ${new_message_builder["button_add"]["message_name_input"]}  \\127  # Delete
  sleep  0.5
  input text  ${new_message_builder["button_add"]["message_name_input"]}  ${name}
  press key  ${new_message_builder["button_add"]["message_name_input"]}  \\13  # Return

add widget to canvas
  [Arguments]  ${widget}
  run keyword and ignore error  click element  ${new_message_builder["button_add"]["visual"]}

  :for  ${n}  in range  5
  \  ${content_open}=  run keyword and return status  click element  ${new_message_builder["button_add"]["contents_panel"]}
  \  exit for loop if  ${content_open}
  \  click element  ${new_message_builder["button_add"]["add_content"]}
  \  sleep  0.5

  :for  ${n}  in range  5
  \  ${widget_visible}=  run keyword and return status  element should be visible  ${widget}
  \  exit for loop if  ${widget_visible}
  \  run keyword and ignore error  click element  //div[@class='carousel-container']/div[@class='carousel']/div[@class='chevron left']
  \  run keyword and ignore error  click element  ${new_message_builder["button_add"]["basic"]}

  ${dropped}=  run keyword and return status  drag and drop  ${widget}  ${new_message_builder["button_add"]["empty_canvas"]}
  run keyword unless  ${dropped}  run keywords
  ...  click element  ${new_message_builder["button_add"]["add_empty_row"]}
  ...  AND  click element  ${widget}
  ...  AND  drag and drop  ${widget}  ${new_message_builder["button_add"]["empty_canvas"]}

set mandatory headers
  # get to the headers page
  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["chevron_left"]}
  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["headers"]}
  # fill out header info
  press key  ${new_message_builder["button_add"]["reply_to_email"]}  \u0001  # Select All
  press key  ${new_message_builder["button_add"]["reply_to_email"]}  \\127  # Delete
  input text  ${new_message_builder["button_add"]["reply_to_email"]}  test@test.com
  input text  ${new_message_builder["button_add"]["subject"]}  Test Subject

send test emails
  [Arguments]  ${email}
  # open the panel
  :for  ${n}  in range  5
  \  ${tests_open}=  run keyword and return status  click element  ${new_message_builder["button_add"]["tests_panel"]}
  \  exit for loop if  ${tests_open}
  \  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["tests"]}
  \  sleep  0.5
  # check if email is already added
  sleep  0.5
  input text  ${new_message_builder["button_add"]["send_test_search_input"]}  ${email}
  ${can_add_email}=  run keyword and return status  page should contain element  ${new_message_builder["button_add"]["add_recipients"]}
  run keyword if  ${can_add_email}  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["add_recipients"]}
  ...  ELSE  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["first_test_email_slider"]}
  wait until page contains element  ${new_message_builder["button_add"]["first_test_email_slider"]}
  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["send_test_emails"]}
  current frame contains  Test has been sent

delete latest message
  open content  ${new_message_builder}  ${new_message_builder["button_list"]["list"]}
  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_list"]["first_row"]}
  click element  ${new_message_builder["button_list"]["delete_button"]}
  click element  ${generics["yes_button"]}
  wait until page contains  Your message has been successfully deleted.

edit text widget
  [Arguments]  ${text}
  click element  ${new_message_builder["button_add"]["text_content_box"]}
  clear element text  css=div.content-cell.editable.text >h2
  clear element text  css=div.content-cell.editable.text \ > p
  press key  ${new_message_builder["button_add"]["text_content_box"]}  ${text}

create basic message
  open content  ${new_message_builder}  ${new_message_builder["button_add"]["add"]}
  set message name  Qa Automation Test Message
  add widget to canvas  ${new_message_builder["button_add"]["text_widget"]}
  edit text widget  Create New Message Builder\n\nThis message was created using automation
  set mandatory headers
  click element  ${new_message_builder["button_add"]["save_and_finalize"]}
  current frame contains  Your message has been successfully saved.

add image to widget
  [Arguments]  ${link}=http://www.smartfocus.com/en
  click element  ${new_message_builder["button_add"]["add_a_link"]}
  input text  ${new_message_builder["button_add"]["links_dialog"]["link_input"]}  ${link}
  click element  ${new_message_builder["button_add"]["links_dialog"]["save"]}
  click element  ${new_message_builder["button_add"]["add_a_picture"]}
  select frame  ${iframes["image_library_editor"]}
  wait until keyword succeeds  5x  1 sec  click element  ${new_message_builder["button_add"]["first_image"]}
  select window  ${document_title}
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  press key  //*[@id="alt-tag-input"]  \\27  # ESC
