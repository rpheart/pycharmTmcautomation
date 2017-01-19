*** Settings ***
Library           Selenium2Library
Library           abandon_cart_check.py

*** Variables ***
${URL}            http://console-eu1.advisor.smartfocus.com/console/login.htm
${BROWSER}        chrome
${USERNAME}       u368xb1mBluA
${PASSWORD}       jfJfEZHaHnwtcRWd
${ADVISOR_ID}     665
${ADVISOR_HOST}    api-eu1.advisor.smartfocus.com
${EMAIL}          test@bar.com
${DATA}           009431
${Runs}           1000

*** Test Cases ***
Login
    set selenium speed    .1
    Open Browser    ${URL}    ${BROWSER}    # Open: URL
    Maximize Browser Window
    Wait Until Element Is Visible    id=accountID
    Input Text    id=accountID    ${ADVISOR_ID}    # Input: ID
    Wait Until Element Is Visible    id=userName    timeout=5
    Input Text    id=userName    ${USERNAME}    # Input: username
    Wait Until Element Is Visible    id=userPassword
    Input Password    id=userPassword    ${PASSWORD}    # Input password
    Sleep    5
    Click Element    xpath=//*[@id="authenticationBean"]//a[@class="login"]    # Click: login Button
    Prev_Services_Processes_NTC_Active
    TMC_API_Send
    Aft_Services_Processes_NTC_Active
    # Wait a minute before check
    Nav_Search_Abandon_Cart
    Capture Page Screenshot
    Close All Browsers

*** Keywords ***
Prev_Services_Processes_NTC_Active
    # Services_Processes_NTC_Active
    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[./text()='Services']    timeout=15
    Click Element    xpath=//*[@id="navigation"]//a[./text()='Services']
    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[normalize-space(.//text())='Processes']    timeout=5
    Click Element    xpath=//*[@id="navigation"]//a[normalize-space(.//text())='Processes']
    Wait Until Element Is Visible    xpath=//*[@id="content"]//th[./text()='Active']    timeout=5
    # Click: Process and get Value
    Wait Until Element Is Visible    xpath=//*[@id="processCommand"]//a[@href="javascript:forceRun('Abandon Cart');"]    timeout=5
    Click Element    xpath=//*[@id="processCommand"]//a[@href="javascript:forceRun('Abandon Cart');"]
    Sleep    10
    Reload Page
    Sleep    5
    ${prev_value}=    Get Text    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[7]
    Set Global Variable    ${prev_value}

TMC_API_Send
    #-- TMC_API_get_reques
    : FOR    ${item}    IN RANGE    1    ${Runs}
    \    ${response_status}=    send_email_to_tmc    http://${ADVISOR_HOST}/ips/cred/${USERNAME}/${PASSWORD}/3.0/notify/${ADVISOR_ID}/cart-add?email=${item}${EMAIL}&data=${DATA}
    \    Should be equal    ${response_status}    <Response [200]>    # response should be 200
    \    #run keyword if    '$${item}'=='3'    Exit For Loop If

Aft_Services_Processes_NTC_Active
    # Services_Processes_NTC_Active
    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[./text()='Services']    timeout=10
    Click Element    xpath=//*[@id="navigation"]//a[./text()='Services']
    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[normalize-space(.//text())='Processes']    timeout=5
    Click Element    xpath=//*[@id="navigation"]//a[normalize-space(.//text())='Processes']
    Wait Until Element Is Visible    xpath=//*[@id="content"]//th[./text()='Active']    timeout=5
    # No Click: just Check: prev_value=aft_value
    ${aft_value}=    Get Text    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[7]
    Should Be Equal    ${prev_value}    ${aft_value}
    # Click and Check: prev_value !=not_same_value
    Sleep    720    # Wait Until time is not the same
    Reload Page
    Sleep    5
    ${not_same_value}=    Get Text    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[7]
    Should Not Be Equal    ${prev_value}    ${not_same_value}

Nav_Search_Abandon_Cart
    # Nav_Search_Abandon_Cart
    ${fail}=    Set Variable    ${0}
    : FOR    ${item}    IN RANGE    1    ${Runs}
    \    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[./text()='Visitors']    timeout=10
    \    Click Element    xpath=//*[@id="navigation"]//a[./text()='Visitors']    # Click: Visitors
    \    Wait Until Element Is Visible    xpath=//*[@id="representationType"]/option[./text()='Email']    timeout=10
    \    Click Element    xpath=//*[@id="representationType"]/option[./text()='Email']    # Select: Email
    \    Wait Until Element Is Visible    id=searchCriteria    timeout=10
    \    Input text    id=searchCriteria    ${item}${EMAIL}
    \    Click Element    xpath=//*[@id="content"]//a[@href="javascript:search();"]    # Search:    # Search by email
    \    Wait Until Element Is visible    xpath=//*[@id="visitors1"]    timeout=10
    \    Click Element    xpath=//*[@id="content"]//a[normalize-space(.//text())='${item}${EMAIL}']    # Click: on email
    \    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[./text()='Behaviours']    timeout=25
    \    Click Element    xpath=//*[@id="navigation"]//a[./text()='Behaviours']    # Click: Behaviours
    \    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath=//*[@id="content"]/div[3]/div/table/tbody/tr[1]/td[normalize-space(.//text())='Abandon Cart']    # Count number of Abandon Cards
    \    ${passed}=    Run Keyword And Return Status    Element Should Contain    xpath=//*[@id="content"]/div[3]/div/table/tbody/tr[1]/td[normalize-space(.//text())='Abandon Cart']    Abandon Cart
    \    Continue For Loop If    ${passed}
    \    ${fail}=    Evaluate    ${fail} + 1
    \    Sleep    2
    ${success}=    Set Variable    ${Runs} - ${fail}
    Log Many    Success:    ${success}
    Log Many    fail:    ${fail}
