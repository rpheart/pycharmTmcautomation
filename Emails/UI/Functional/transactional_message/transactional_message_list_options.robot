*** Settings ***
Documentation   test for creating a transactional message and testing the list options
Default Tags    ui  email  transactional
Resource        ../../Utils/keywords.robot
Resource        ../../Utils/transactional_message.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
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

transactional_message_edit
  open content  ${transactional_message}  ${transactional_message["button_list"]["list"]}
  click element  ${transactional_message["button_list"]["edit"]}
  clear element text  ${transactional_message["button_add"]["text_content"]}
  input text  ${transactional_message["button_add"]["text_content"]}  [EMV TEXTPART][EMV HTMLPART]<html><body>My Test EDIT</body></html>
  click element  ${transactional_message["button_add"]["save"]}
  alert should be present  text=Your Template has been saved successfully

transactional_message_copy
  open content  ${transactional_message}  ${transactional_message["button_list"]["list"]}
  click element  ${generics["copy"]}
  click element  ${generics["save"]}
  current frame contains  Copy of QA Auto transactional message

transactional_message_delete
  delete latest transactional message
  current frame should not contain  Copy of QA Auto transactional message