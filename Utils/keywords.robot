*** Settings ***
Documentation   contains variables and keywords for the tmc ui test suite
Library         Collections
Library         OperatingSystem
Library         Selenium2Library  15  15  run_on_failure=fail keyword
Library         String
Variables       variables.py
Variables       credentials.py

*** Variables ***
${env}      pod_e1
${browser}  chrome

*** Keywords ***
fail keyword
  [Documentation]  keyword to run on failure will log source and take a screenshot of the page failure
  log source
  capture page screenshot

login
  [Documentation]  Logs in to the message cloud
  open browser  ${${env}["ui_server"]}  ${browser}
  maximize browser window
  page should contain  Login To Your Account:
  input text  ${login["username"]}  ${${env}["ui_username"]}
  input password  ${login["password"]}  ${${env}["ui_password"]}
  click link  ${login["login_button"]}
  set selenium speed  0.2

go to ${page}
  [Documentation]  opens the product under test (i.e. Personalisation or Email)
  select window  ${document_title}
  wait until keyword succeeds  5x  1 sec  click element  ${page}
