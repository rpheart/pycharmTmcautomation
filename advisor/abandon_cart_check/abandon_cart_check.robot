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
${DATA}           009431
${Runs}           1000
${EMAIL}          ${EMPTY}

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
    ${myList}=    Create List    one    two    three    four    five
    ...    six    seven    eight    nine    ten
    Log    ${myList}
    ${count}=    Set Variable    ${0}
    Set Test Variable    ${EMAIL}    ${myList[0]}@bar.com
    : FOR    ${item}    IN RANGE    ${Runs}
    \    ${response_status}=    send_email_to_tmc    http://${ADVISOR_HOST}/ips/cred/${USERNAME}/${PASSWORD}/3.0/notify/${ADVISOR_ID}/cart-add?email=${count}${EMAIL}&data=${DATA}
    \    Should be equal    ${response_status}    <Response [200]>    # response should be 200
    \    ${count}=    Evaluate    ${count} + 1
    \    Run Keyword If    ${count}==100    Set Test Variable    ${count}    ${0}
    \    Run Keyword If    ${item}==100    Set Test Variable    ${EMAIL}    ${myList[1]}@bar.com
    \    Run Keyword If    ${item}==200    Set Test Variable    ${EMAIL}    ${myList[2]}@bar.com
    \    Run Keyword If    ${item}==300    Set Test Variable    ${EMAIL}    ${myList[3]}@bar.com
    \    Run Keyword If    ${item}==400    Set Test Variable    ${EMAIL}    ${myList[4]}@bar.com
    \    Run Keyword If    ${item}==500    Set Test Variable    ${EMAIL}    ${myList[5]}@bar.com
    \    Run Keyword If    ${item}==600    Set Test Variable    ${EMAIL}    ${myList[6]}@bar.com
    \    Run Keyword If    ${item}==700    Set Test Variable    ${EMAIL}    ${myList[7]}@bar.com
    \    Run Keyword If    ${item}==800    Set Test Variable    ${EMAIL}    ${myList[8]}@bar.com
    \    Run Keyword If    ${item}==900    Set Test Variable    ${EMAIL}    ${myList[9]}@bar.com

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
    ${myList}=    Create List    one    two    three    four    five
    ...    six    seven    eight    nine    ten
    Log    ${myList}
    Set Test Variable    ${EMAIL}    ${myList[0]}@bar.com
    ${count}=    Set Variable    ${0}
    ${fail}=    Set Variable    ${0}
    : FOR    ${item}    IN RANGE    ${Runs}
    \    Wait Until Element Is Visible    xpath=//*[@id="navigation"]//a[./text()='Visitors']    timeout=10
    \    Click Element    xpath=//*[@id="navigation"]//a[./text()='Visitors']    # Click: Visitors
    \    Wait Until Element Is Visible    xpath=//*[@id="representationType"]/option[./text()='Email']    timeout=10
    \    Click Element    xpath=//*[@id="representationType"]/option[./text()='Email']    # Select: Email
    \    Wait Until Element Is Visible    id=searchCriteria    timeout=10
    \    Input text    id=searchCriteria    ${count}${EMAIL}    # Search by email
    \    Click Element     xpath=//*[@id="content"]//a[@href="javascript:search();"]
    \    Wait Until Element Is visible    xpath=//*[@id="visitors1"]    timeout=10
    \    Click Element    xpath=//*[@id="content"]//a[normalize-space(.//text())='${count}${EMAIL}']    # Click: on email
    \    ${count}=    Evaluate    ${count} + 1
    \    Run Keyword If    ${count}==100    Set Test Variable    ${count}    ${0}
    \    Run Keyword If    ${item}==100    Set Test Variable    ${EMAIL}    ${myList[1]}@bar.com
    \    Run Keyword If    ${item}==200    Set Test Variable    ${EMAIL}    ${myList[2]}@bar.com
    \    Run Keyword If    ${item}==300    Set Test Variable    ${EMAIL}    ${myList[3]}@bar.com
    \    Run Keyword If    ${item}==400    Set Test Variable    ${EMAIL}    ${myList[4]}@bar.com
    \    Run Keyword If    ${item}==500    Set Test Variable    ${EMAIL}    ${myList[5]}@bar.com
    \    Run Keyword If    ${item}==600    Set Test Variable    ${EMAIL}    ${myList[6]}@bar.com
    \    Run Keyword If    ${item}==700    Set Test Variable    ${EMAIL}    ${myList[7]}@bar.com
    \    Run Keyword If    ${item}==800    Set Test Variable    ${EMAIL}    ${myList[8]}@bar.com
    \    Run Keyword If    ${item}==900    Set Test Variable    ${EMAIL}    ${myList[9]}@bar.com
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
