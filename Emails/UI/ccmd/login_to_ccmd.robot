*** Settings ***
Documentation   tests for creating different types of messages
Default Tags    ui  email  smoke  ccmd
Resource        ../Utils/email_keywords.robot
Suite Teardown  close all browsers

*** Test Cases ***
login
  [Documentation]  Logs in to ccmd
  open browser  ${${env}["ccmd"]}  ${browser}
  maximize browser window
  page should contain  Login To Your Account:
  input text  ${login["username"]}  ${${env}["ui_username"]}
  input password  ${login["password"]}  ${${env}["ui_password"]}
  click link  ${login["login_button"]}
  wait until element is visible  //div[@class='account-settings displayIcon']