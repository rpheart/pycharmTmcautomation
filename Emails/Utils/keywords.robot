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
    Page should contain    Login To Your Account:
    input text    IDToken1    ${username}
    input password    IDToken2    ${password}
    Click Link    name=Login.Submit

Go To System
    [Arguments]    ${page}
    click element    css=${page}

Open Content
    [Documentation]
    [Arguments]    ${content_dictionary}      ${page}
    mouse over      css=${content_dictionary["menu_list"]}
    click element    css=${page}
    mouse over    css=${smartfocus_logo}
