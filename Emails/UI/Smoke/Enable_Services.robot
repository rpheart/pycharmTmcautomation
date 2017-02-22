*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}            http://console-eu1.advisor.smartfocus.com/console/login.htm
${BROWSER}        chrome
${USERNAME}       u378dpKvlgRT
${PASSWORD}       nfg7kumiNuD747QR
${USER_ID}        675

*** Test Cases ***
Login
    set selenium speed    .1
    Open Browser    ${URL}    ${BROWSER}    # Load Jira page
    Maximize Browser Window
    Input Text    id=accountID    ${USER_ID}
    Sleep    2
    Input Text    id=userName    ${USERNAME}    # Login to JIRA
    Sleep    2
    Input Password    id=userPassword    ${PASSWORD}    # Input password
    Sleep    2
    Click Element    xpath=//*[@id="authenticationBean"]//a[@class="login"]    # Click me
    Set_Enable
    Set_Unactive
    Close All Browsers    # Close everything after the job is complete

*** Keywords ***
Set_Enable
    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[contains(text(),"Services")]    timeout=6
    Click Element    xpath=//*[@id="navigation"]//a[contains(text(),"Services")]
    Sleep    3
    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[contains(text(),"Processes")]    timeout=5
    Click Element    xpath=//*[@id="navigation"]//a[contains(text(),"Processes")]
    Sleep    5
    ${enable_state}=    Run keyword and return status    Wait Until Element Is Visible    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[3]/a/img[@alt="Enabled"]/../../a[@href="javascript:toggleEnabled('Abandon Cart');"]    timeout=20
    Run Keyword If    '${enable_state}'=='False'    Click Link    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[3]/a    # Switch on
    Sleep    1200

Set_Unactive
    Reload Page
    Sleep    10
    capture page screenshot
    ${operation_state}=    Run keyword and return status    Wait Until Element Is Visible    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[3]/a/img[@alt="Enabled"]/../../a[@href="javascript:toggleEnabled('Abandon Cart');"]    timeout=20
    Run Keyword If    '${operation_state}'=='True'    Click Link    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[3]/a    # Switch it off
    Sleep    180
    Reload Page
    Sleep    10
    capture page screenshot
