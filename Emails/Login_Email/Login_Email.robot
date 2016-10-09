*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword    screenshot_root_directory=.

*** Variables ***
${BROWSER}        chrome
${LOGIN URL}      https://sfui.themessagecloud.com/    # https://qa-sfui.themessagecloud.com/
${screenshots}    ${EMPTY}
${USERNAME}       auto_e8
${PASSWORD}       qa11focus$

*** Test Cases ***
Login_Email
    Login_Email

*** Keywords ***
Login_Email
    set selenium speed    .1
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Global Variable    ${LOGIN URL}
    Maximize Browser Window
    page should contain    Login To Your Account:
    input text    IDToken1    ${USERNAME}
    Set Global Variable    ${USERNAME}
    input password    IDToken2    ${PASSWORD}
    Click Link    name=Login.Submit    # Click on Submit button
    # run View and Email
    ${present}=    Run Keyword And Return Status    Wait Until element Is Visible    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[2]/div    timeout=70
    Run Keyword If    ${present}    Click Element    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[2]/div    # Click on Email button
    Sleep    5
    Run Keyword If    ${present}    Click Element    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[2]/div
    # run if personalization is switched off
    ${present}=    Run Keyword And Return Status    Wait Until element Is Visible    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[3]/div    timeout=70
    Run Keyword If    ${present}    Click Element    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[3]/div     # Click on Email button
    Sleep    5
    Run Keyword If    ${present}    Click Element    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[3]/div
    # run if personalization is switched on
    ${present}=    Run Keyword And Return Status    Wait Until element Is Visible    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[4]/div    timeout=70
    Run Keyword If    ${present}    Click Element    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[4]/div
    Sleep    5
    Run Keyword If    ${present}    Click Element    xpath=//*[@id="SFUI_Nav"]/div/div/ul/li[4]/div
    # Wait for create
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[1]    timeout=40

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot
