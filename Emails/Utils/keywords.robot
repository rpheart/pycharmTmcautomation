*** Settings ***
Documentation       Suite description
Library             Selenium2Library
Variables           variables.py

*** Variables ***
${screenshots}
# login variables
${url}          https://qa-sfui.themessagecloud.com
${username}     mf_e1
${password}     computer4.
${browser}      chrome

*** Keywords ***
Fail Keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    Capture Page Screenshot

Login
    [Documentation]    Logs in to the message cloud
    open browser    ${url}    ${browser}
    maximize browser window
    page should contain    Login To Your Account:
    input text    Input Text    IDToken1    ${username}
    input password    IDToken2    ${password}
    click link    name=Login.Submit
    wait until element is visible    ${smart_focus_logo}    timeout=30

Go To ${page}
    [Documentation]
    ${is_visible}=    run keyword and return status    element should not be visible     ${iframes["top"]}
    run keyword if    ${is_visible}
    ...    select window    title=${document_title}    # Click on main frame
    click element    ${page}
    wait until element is visible    ${iframes["top"]}    timeout=30

open content
    [Documentation]
    [Arguments]    ${content_dictionary}      ${page}
    ${is_visible}=    run keyword and return status    element should not be visible    ${iframes["top"]}
    run keyword if    ${is_visible}
    ...    select window    title=${document_title}    # Click on main frame
    wait until element is visible    ${content_dictionary["menu"]}    timeout=30
    mouse over    ${content_dictionary["menu"]}
    click element    ${page}
    mouse over    ${smartfocus_logo}
    wait until element is visible    ${iframes["top"]}    timeout=30
