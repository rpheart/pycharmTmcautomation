*** Settings ***
Documentation   logs into the advisor console, enables and force runs abandon cart and then turns it off
Library         Selenium2Library  15  15  run_on_failure=fail keyword
Suite Setup     login
Suite Teardown  close all browsers

*** Variables ***
${URL}      http://console-eu1.advisor.smartfocus.com/console/login.htm
${BROWSER}  chrome
${USERNAME} u378dpKvlgRT
${PASSWORD} nfg7kumiNuD747QR
${USER_ID}  675

*** Test Cases ***
enable_abandon_cart
  wait until element is visible  xpath=//*[@id="navigation"]//a[contains(text(),"Services")]  timeout=6
  click element  xpath=//*[@id="navigation"]//a[contains(text(),"Services")]
  sleep  3
  wait until element is visible  xpath=//*[@id="navigation"]//a[contains(text(),"Processes")]  timeout=5
  click element  xpath=//*[@id="navigation"]//a[contains(text(),"Processes")]
  sleep  5
  ${enable_state}=  run keyword and return status  Wait Until Element Is Visible  xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[3]/a/img[@alt="Enabled"]/../../a[@href="javascript:toggleEnabled('Abandon Cart');"]  timeout=20
  run keyword if  '${enable_state}'=='False'  Click Link  xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[3]/a
  sleep  1200

disable_abandon_cart
  reload page
  sleep  10
  ${operation_state}=  run keyword and return status  Wait Until Element Is Visible  xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[3]/a/img[@alt="Enabled"]/../../a[@href="javascript:toggleEnabled('Abandon Cart');"]  timeout=20
  run keyword if  '${operation_state}'=='True'  Click Link  xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[3]/a
  sleep  180
  reload page
  sleep  10

*** Keywords ***
fail keyword
  [Documentation]  keyword to run on failure will log source and take a screenshot of the page failure
  log source
  capture page screenshot

login
  [Documentation]  logs in to the advisor console
  open browser  ${URL}  ${BROWSER}
  maximize browser window
  input text  id=accountID  ${USER_ID}
  input text  id=userName  ${USERNAME}
  input password  id=userPassword  ${PASSWORD}
  click element  xpath=//*[@id="authenticationBean"]//a[@class="login"]
  set selenium speed  0.2
