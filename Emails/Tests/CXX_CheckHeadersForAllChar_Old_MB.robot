*** Settings ***
Documentation    Suite description
Library           Selenium2Library     10       2
Resource    Utils/LoginToEmail.robot

*** Variables ***


*** Test Cases ***
InsertXSSInHeaders
    set selenium speed      0.5
    Login
    ClickOnEmail
 #   sleep       3
    Hover over create
#    sleep       10
    Click Old MB

   # Close browser

*** Keywords ***
Hover over create
    [Documentation]     Hover over create menu
    mouse over      css=li#engage-create


Click Old MB
    [Documentation]     Go to the old message builder from create
    click element   css=${old_mb}