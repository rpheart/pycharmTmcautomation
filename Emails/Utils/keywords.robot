*** Settings ***
Documentation       Suite description
Library             Selenium2Library
Variables           variables.py

*** Variables ***
# login variables
${url}          https://qa-sfui.themessagecloud.com
${username}     mf_e1
${password}     computer4.
${browser}      chrome

*** Keywords ***
Login
    [Documentation]    Logs in to the message cloud
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page Should Contain    Login To Your Account:
    Input Text    IDToken1    ${username}
    Input Password    IDToken2    ${password}
    Click Link    name=Login.Submit
    Wait Until Element Is Visible    ${smart_focus_logo}    timeout=60

Go To System
    [Documentation]
    [Arguments]    ${page}
    Click Element    ${page}
    Wait Until Element Is Visible    ${iframes["top"]}    timeout=60

Open Content
    [Documentation]
    [Arguments]    ${content_dictionary}      ${page}
    Mouse Over      ${content_dictionary["menu_list"]}
    Click Element    ${page}
    Mouse Over    ${smartfocus_logo}
    Wait Until Element Is Visible    ${iframes["top"]}    timeout=60
