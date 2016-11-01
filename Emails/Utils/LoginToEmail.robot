*** Settings ***
Documentation    Suite description
Library           Selenium2Library

*** Variables ***
${url}    https://qa-sfui.themessagecloud.com
${username}   mf_e1
${password}    computer4.
${browser}      ie
${email_tab}    ul.nav.navbar-nav.si-nav > li.logo_button.engage_button
${old_mb}       li.section.column3 > ul > li.section-item

*** Keywords ***
Login
    [Documentation]    Logs in to the message cloud
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page should contain    Login To Your Account:
    input text    IDToken1    ${username}
    input password    IDToken2    ${password}
    Click Link    name=Login.Submit

ClickOnEmail
    [Documentation]    Go to email tab
    click element  css=${email_tab}
