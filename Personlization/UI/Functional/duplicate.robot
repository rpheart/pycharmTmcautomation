*** Settings ***
Documentation   tests for creating a personalized content and a variant
Default Tags    ui  personalization content variant
Resource        Personlization/UI/Utils/personlization_keywords.robot
Suite Setup     run keywords  login
...             AND  go to ${System_Page["personalization"]}
#Suite Teardown  close all browsers


*** Test Cases ***
create_personalized_content
  go to ${personalized_content["tab"]}
  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div/div/header/div/div/div/section/div/button
  input text  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/div/div/form/section/div[1]/input  Test Auto
  click element  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/div/footer/div/button
  clear element text  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/div/div/form/section/div/div[1]/div/input
  input text  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/div/div/form/section/div/div[1]/div/input  500
  clear element text  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/div/div/form/section/div/div[2]/div/input
  input text  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/div/div/form/section/div/div[2]/div/input  500
  click element  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/div/footer/div/button[1]
  wait until element is visible  //*[@class="draggable-element canvas-widget"]  timeout=30
   # create a variant
  # wait until keyword succeeds  5x  1 sec
  click element  //*[@id="directory-item-actions-dropdown"]
  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div[1]/div/div/div/div/ul/li/div/div/div/div/div/ul/li[1]/a
  clear element text  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/form/section[1]/div[1]/input
  input text  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/div/form/section[1]/div[1]/input  Auto Variant 1
  click element  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/footer/div/button[1]
#  wait until element is visible  //*[@id="app-wrapper"]/div/div[1]/div/div/div[1]/div/div/div/div
#  drag and drop  //*[@id="app-wrapper"]/div/div[1]/div/div/div[2]/div[2]/div[3]/div[1]/div/div/div/div/div/span[1]/span  //*[@class="draggable-element canvas-widget"]
#  wait until element is visible  //*[@class="draggable-element canvas-widget"]  timeout=30
  wait until element is not visible  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/footer
  #duplicate a variant
  click element  //*[@id="directory-item-actions-dropdown"]
  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div[1]/div/div/div/div/ul/li/div/div/div/div/div/ul/li[2]/a
#  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div[1]/div/div/div/div/ul/li/div/div/div/div/div/ul/li[2]/a/span
  wait until element contains  //*[@id="app-wrapper"]/div/div[1]/div/div/div[1]/div/div/div/div  Auto Variant 1 (1)
  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div[2]/footer/div/button[2]
  element should be visible  //div[@name='global-alerts']//*[contains(text(), 'Variant')]
  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div[1]/div/div/div/header/a
  element should be visible  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div
  click element  //*[@id="app-wrapper"]/div/div[3]/div/div[2]/div/div/div[2]/div/footer/div/button[1]
  element should contain  //*[@id="app-wrapper"]/div/div[1]/div/div/div/div/div  Test Auto
  #duplicate content
  click element  //*[@id=@id="2Yyahz8QTO4IIf56dLsa"]/i
  wait until element is visible  //*[@id="app-wrapper"]/div/div[1]/div/div/div/div/div/div[2]/table/tbody/tr[1]/td[4]/div/div/div/ul/li[2]/a
  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div/div/div/div[2]/table/tbody/tr[1]/td[4]/div/div/div/ul/li[2]/a/span
  wait until element contains  //*[@id="app-wrapper"]/div/div[1]/div/div/div/div/div/div[2]  psummers(3)
  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div/div/div/div[2]/table/tbody/tr[4]/td[2]/a
  wait until element is visible  //*[@class="draggable-element canvas-widget"]  timeout=30
  element should contain  //*[@id="app-wrapper"]/div/div[1]/div/div/div[1]/div/div/div/div  PUFFIN(3)
  click element  //*[@id="app-wrapper"]/div/div[1]/div/div/div[1]/div/div/div/header/a


*** Keywords ***
Provided precondition
    Setup system under test