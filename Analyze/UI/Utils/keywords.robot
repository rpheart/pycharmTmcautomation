*** Settings ***
Documentation       contains variables and keywords for the email ui test suite
Library             Collections
Library             OperatingSystem
Library             Selenium2Library    15    15    run_on_failure=fail keyword
Library             String
Variables           variables.py
Variables           ../../Utils/credentials.py

*** Variables ***
# login variables
${env}=         qa
${browser}      chrome

*** Keywords ***
fail keyword
    log source
    capture page screenshot

login
    [Documentation]    Logs in to the message cloud
    open browser    ${${env}["ui_server"]}    ${browser}
    maximize browser window
    page should contain    Login To Your Account:
    input text    IDToken1    ${${env}["ui_username"]}
    input password    IDToken2    ${${env}["ui_password"]}
    click link    name=Login.Submit
    set selenium speed    0.2

go to ${page}
    [Documentation]    opens the product under test (i.e. Personalisation or Email)
    select window    ${document_title}
    wait until keyword succeeds    5x    1 sec    click element    ${page}
