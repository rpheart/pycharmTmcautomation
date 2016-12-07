*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword

*** Variables ***
${screenshots}    ${EMPTY}

*** Test Cases ***
C87_Send_A_MultiVariate_Rollout_Campaign
    Send_Add_Thumbnail
    Setup_Rollout_Campaign
    Verify_Rollout_Campaign
    Suite Teardown

*** Keywords ***
Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Send_Add_Thumbnail
    Click Element    xpath=//*[@id="engage-send"]/div[1]    # Click on Send
    Wait until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[2]    timeout=10
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[2]    # Click on MultiVariate
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    wait until element is visible    //div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr/td/div/span/u[contains(text(), 'MultiVariate Test')]    timeout=20

Setup_Rollout_Campaign
    Sleep    5
    Mouse Down    xpath=//*[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr/td/div[contains(text(),"Completed")]
    Click Element    xpath=//*[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr[@__gwt_row='0']/td/div/span/u[contains(text(), 'MultiVariate Test')]
    #-----------------------------
    Comment    : FOR    ${i}    IN RANGE    8
    Comment    \    Comment    ${val}    Set Variable    ${list[${i}]}
    Comment    \    Comment    ${noRollOut}=    Run Keyword And Ignore Error    Element Should Not Contain    xpath=//div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr[@__gwt_row="${i}"]/td/div
    ...    Rolled out
    Comment    \    ${results}    ${value}=    Run Keyword And Ignore Error    Element Should Contain    xpath=//div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr[@__gwt_row="${i}"]/td/div/span/u[contains(text(), 'MultiVariate Test')]
    ...    MultiVariate Test
    Comment    \    Sleep    5
    Comment    \    Run Keyword If    '${results}' == 'MultiVariate Test'    Click Element    xpath=//*[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr/td/div[contains(text(),"Completed")]
    Comment    \    Exit For Loop If    '${results}' == 'MultiVariate Test'
    #-----------------------------
    ${campaign_name}=    Get Text    //*[@id="splitrunuidiv"]/div/div[2]/table/tbody/tr/td/table/tbody/tr[1]/td/div/table/tbody/tr/td[2]/table/tbody/tr[1]/td/div/span[2]
    Set Global Variable    ${campaign_name}
    ${send_date}=    Get Text    //*[@id="splitrunuidiv"]/div/div[2]/table/tbody/tr/td/table/tbody/tr[1]/td/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/div/span[2]    # Get 'Send date:'
    Set Global Variable    ${send_date}    # Set time as global variable
    Sleep    5
    Mouse Over    xpath=//*[@id="splitrunuidiv"]/div/div[2]/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr/td[1]/div/table/tbody/tr[3]/td/div/table[2]/tbody/tr/td[3]
    Sleep    2
    click Element    css=#splitrunUI-preview-scheduleIcon    # Click Control Version 1
    Sleep    5
    Click Element    id=splitrunUI-resultView-sendLaterRadioButton    #Select checkbox send later
    Sleep    5
    Click Element    css=#splitrunUI-resultView-rolloutPopupLaunchButton > tbody > tr > td > div    # Click on Send later
    Sleep    5
    Click Button    Ok    # Click OK
    Sleep    10

Verify_Rollout_Campaign
    Unselect Frame
    Sleep    5
    Click Element    xpath=//*[@id="engage-send"]/div[1]    # Click on Send
    Sleep    5
    Click Element    css=#engage-send > div.sfui-menu-dropdown > div > ul > li > ul > li:nth-child(2) > ul > li:nth-child(2)    # Click on MultiVariate
    Sleep    10
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Wait until Element Is Visible    id=intro
    Sleep    5
    Element Should Contain    //*[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr[@__gwt_row="0"]/td[1]/div/span/u    ${campaign_name}    # Verify 'Campaign Name'
    Element should contain    //div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr[@__gwt_row="0"]/td/div[contains(text(), 'Rolled out')]    Rolled out    # Verify 'Status'
    Element Should Contain    //*[@id="splitrunuidiv"]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div/table/tbody/tr[@__gwt_row="0"]/td[5]/div    ${send_date}    # Verify 'Send date'

Suite Teardown
    Close All Browsers
