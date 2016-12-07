*** Settings ***
Documentation       Suite description
Library             Selenium2Library    10    2    run_on_failure=fail keyword    screenshot_root_directory=.
Variables           variables.py

*** Variables ***
# test variables
${screenshots}

# login variables
${ui_server}        https://preprod.themessagecloud.com
${ui_username}      preprodtmc
${ui_password}      computer5.
${browser}          chrome

*** Keywords ***
fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

login
    [Documentation]    Logs in to the message cloud
    open browser    ${ui_server}    ${browser}
    maximize browser window
    page should contain    Login To Your Account:
    input text    IDToken1    ${ui_username}
    input password    IDToken2    ${ui_password}
    click link    name=Login.Submit
    wait until element is visible    ${smart_focus_logo}    timeout=30

go to ${page}
    [Documentation]
    select window    ${document_title}    # Select main frame
    click element    ${page}
    wait until element is visible    ${navigation_bar}    timeout=30

open content
    [Documentation]
    [Arguments]    ${content_dictionary}      ${page}
    select window    ${document_title}    # Select main frame
    wait until element is visible    ${content_dictionary["menu"]}    timeout=30
    mouse over    ${content_dictionary["menu"]}
    wait until element is visible    ${page}    timeout=30
    click element    ${page}
    mouse over    ${smartfocus_logo}
    wait until element is visible    ${navigation_bar}    timeout=30
