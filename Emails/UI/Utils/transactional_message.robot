*** Settings ***
Documentation  keywords specific to creation of transactional message

*** Keywords ***
set headers
  [Documentation]  setting up the default headers for creating transactional message
  [Arguments]  ${message_name}
  input text  ${transactional_message["button_add"]["name"]}  ${message_name}
  input text  ${transactional_message["button_add"]["description"]}  Auto created
  input text  ${transactional_message["button_add"]["message_from"]}  QA team
  input text  ${transactional_message["button_add"]["message_to"]}  Test
  input text  ${transactional_message["button_add"]["message_subject"]}  QA Auto transactional message
  input text  ${transactional_message["button_add"]["message_reply_to_emails"]}  qa.auto@smartfocus.com

delete latest transactional message
  [Documentation]  deletes the most recent transactional message
  open content  ${transactional_message}  ${transactional_message["button_list"]["list"]}
  click element  ${transactional_message["button_list"]["first_delete_checkbox"]}
  click element  ${generics["trash"]}
  click element  ${generics["trash"]}

send test emails
  [Documentation]  sends test emails from transactional message builder
  [Arguments]  ${personalisation_field}=${EMPTY}
  select frame  ${iframes["popup_frame"]}
  wait until page contains  Send Test

  # try and fill out personalisation fields
  ${personalisation_length}=  get length  ${personalisation_field}
  run keyword unless  ${personalisation_length}==0  input text  //input[@name='dyn(email)']  ${personalisation_field}

  # send test email to group
  select from list by label  ${generics["test_group_dropdown"]}  QA_auto  # Select Group 'QA_auto'
  click element  //table//img[@id="iconCampaignTest"]
  alert should be present  text=Your message will be saved before the test is sent. Do you want to continue?
  sleep  0.5
  alert should be present  text=Message sent successfully