*** Settings ***
Documentation       Suite description
Library             Selenium2Library     10       2
Resource            Utils/keywords.robot
Variables           Utils/variables.py
Suite Teardown

*** Variables ***


*** Test Cases ***
InsertXSSInHeaders
    set selenium speed      0.1
    Login
    Go To System    ${email_page}
    Sleep    3
    Open Content    ${classic_message_builder}      ${classic_message_builder["button_add"]}
    Sleep    3
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    3
    click element    css=img#accordionIcon.accordionIcon.sprite
    Sleep    3
    input text    name=messageName    stuff

*** Keywords ***