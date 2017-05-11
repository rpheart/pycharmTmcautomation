*** Settings ***
Documentation   test for creating a transactional message and testing the list options
Default Tags    ui  email  transactional
Resource        ../../Utils/email_keywords.robot
Resource        ../../Utils/transactional_message.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["email"]}
...             AND  create transactional message
Suite Teardown  run keywords  delete latest transactional message
...             AND  close all browsers

*** Test Cases ***
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
  table row should contain  ${transactional_message["button_list"]["table"]}  1  Copy of QA Auto transactional message

transactional_message_delete
  delete latest transactional message
  ${latest_message_name}=  get table cell  ${transactional_message["button_list"]["table"]}  3  3
  should not be equal as strings  ${latest_message_name}  Copy of QA Auto transactional message

*** Keywords ***
create transactional message
  open content  ${transactional_message}  ${transactional_message["button_add"]["add"]}
  set headers  QA Auto transactional message
  clear element text  ${transactional_message["button_add"]["text_content"]}
  input text  ${transactional_message["button_add"]["text_content"]}  [EMV TEXTPART][EMV HTMLPART]<html><body>My Test</body></html>
  click element  ${transactional_message["button_add"]["save"]}
  alert should be present  text=Your Template has been saved successfully
  open content  ${transactional_message}  ${transactional_message["button_list"]["list"]}
  table row should contain  ${transactional_message["button_list"]["table"]}  1  	QA Auto transactional message
