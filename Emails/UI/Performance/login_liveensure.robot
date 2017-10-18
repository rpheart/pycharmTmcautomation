*** Settings ***
Documentation   open multiple browsers and point them to the liveensure login app, then attempt a regular login
Default Tags    performance
Resource        ../Utils/email_keywords.robot
Suite Teardown  close all browsers

*** Variables ***
${open_instances}  80
${open_connection_duration}  60

*** Test Cases ***
login_tmc
  :FOR  ${n}  in range  ${open_instances}
  \  open browser  ${${env}["ui_server"]}  ${browser}
  \  maximize browser window
  \  page should contain  Login To Your Account:
  \  input text  ${login["username"]}  ${${env}["ui_liveensure_username"]}
  \  input password  ${login["password"]}  ${${env}["ui_liveensure_password"]}
  \  click link  ${login["login_button"]}
  # leave all connections open for ${open_connection_duration}
  sleep  ${open_connection_duration}
  # attempt to login to a user without liveensure after leaving ${open_instances} open for ${open_connection_duration}
  login
  set selenium speed  0

login_ccmd
  :FOR  ${n}  in range  ${open_instances}
  \  open browser  ${${env}["ccmd"]}  ${browser}
  \  maximize browser window
  \  page should contain  Login To Your Account:
  \  input text  ${login["username"]}  ${${env}["ui_liveensure_username"]}
  \  input password  ${login["password"]}  ${${env}["ui_liveensure_password"]}
  \  click link  ${login["login_button"]}
  # leave all connections open for ${open_connection_duration}
  sleep  ${open_connection_duration}
  # attempt to login to a user without liveensure after leaving ${open_instances} open for ${open_connection_duration}
  open browser  ${${env}["ccmd"]}  ${browser}
  maximize browser window
  page should contain  Login To Your Account:
  input text  ${login["username"]}  ${${env}["ui_username"]}
  input password  ${login["password"]}  ${${env}["ui_password"]}
  click link  ${login["login_button"]}
  wait until element is visible  //div[@class='account-settings displayIcon']