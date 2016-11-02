*** Settings ***
Documentation    Suite description
Library           Selenium2Library

*** Variables ***
# login variables
${url}    https://qa-sfui.themessagecloud.com
${username}   mf_e1
${password}    computer4.
${browser}      chrome

# other
${smartfocus_logo}    i.sf_logo


*** Keywords ***
Login
    [Documentation]    Logs in to the message cloud
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page Should Contain    Login To Your Account:
    Input Text    IDToken1    ${username}
    Input Password    IDToken2    ${password}
    Click Link    name=Login.Submit
    Wait Until element Is Visible    css=ul.nav.navbar-nav.si-nav > li.logo_button.engage_button    timeout=60

Go To System
    [Arguments]    ${page}
    click element    css=${page}
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=60

Open Content
    [Documentation]
    [Arguments]    ${content_dictionary}      ${page}
    mouse over      css=${content_dictionary["menu_list"]}
    click element    css=${page}
    mouse over    css=${smartfocus_logo}
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=60
