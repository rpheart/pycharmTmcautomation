*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword    screenshot_root_directory=.

*** Variables ***
${screenshots}    ${EMPTY}

*** Test Cases ***
C71_Send_A_MultiVariate_Test_Campaign
    Hover_Over_Send_sub-tab_Add_Thumbnail
    Enter_Campaign_Details_Select_Message
    Select_Subject_Define_Two_Versions_25_Min_Continue
    #---Verify results
    Verify_Campaign_Status_In_List_Page_Complete_By_members
    Suite Teardown

*** Keywords ***
Suite Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Hover_Over_Send_sub-tab_Add_Thumbnail
    Click Element    xpath=//*[@id="engage-send"]/div[1]    # Click on Send
    Wait until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[1]    timeout=10
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[1]    # Click on MultiVariate
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame

Enter_Campaign_Details_Select_Message
    Wait Until Page Contains    Define campaign and recipients    timeout=30
    Sleep    5
    input text    splitrunUI-builderView-nameInput    MultiVariate Test
    Sleep    5
    input text    splitrunUI-builderView-descriptionInput    MultiVariate Test
    Sleep    2
    Click Element    //div[@class='GDPGA2PBIHB-com-emailvision-ui-gwt-client-component-explorer-bundle-IExplorerCssResource-buttonLabel' and contains(text(), 'Select a message')]    #Click Message
    Sleep    2
    Click Element    //div[@id='splitrunUI-builderView-messagesExplorer-nameColumn' and contains(text(), 'QA auto test Message')]    # Select 'QA auto test Message'
    Sleep    2
    Click Element    //div[@class='GDPGA2PBIHB-com-emailvision-ui-gwt-client-component-explorer-bundle-IExplorerCssResource-buttonLabel' \ and contains(text(), 'Select one or more segments')]    # Click Segment
    Sleep    2
    Click Element    //div[@id='splitrunUI-builderView-segmentsExplorer-nameColumn' \ and contains(text(), 'QA auto test Segment')]    # Select 'QA auto test Segment'
    Sleep    2
    Click Element    id=splitrunUI-builderView-segmentsExplorer-addEntitiesButton    # Click 'Ok'
    Sleep    2
    Click Element    //div[@class="GDPGA2PBNX-com-emailvision-ui-gwt-client-bundle-bluebutton-IBlueButtonCssResource-labelPadding" and contains(text(), 'Continue')]    # Click 'Continue'

Select_Subject_Define_Two_Versions_25_Min_Continue
    Wait until page contains    Define versions and samples    # Wait for page to load
    Sleep    2
    input text    id=splitrunUI-builderView-testSubject-percentInput-version0    25    #input 25%
    Sleep    2
    input text    id=splitrunUI-builderView-testSubject-percentInput-version1    25    #input 25%
    Sleep    2
    Input text    splitrunUI-builderView-testSubject-subjectInput-version1    TestMultiVariate    #input name
    Click Element    //div[@class="GDPGA2PBNX-com-emailvision-ui-gwt-client-bundle-bluebutton-IBlueButtonCssResource-labelPadding" and contains(text(), 'Continue')]    # Click 'Continue'
    #Wait until page contains    1.Schedule the MultiVariate Test
    Sleep    2
    Click Element    id=splitrunUI-builderView-manualRadioButton
    Sleep    2
    Click Element    //div[@class='gwt-Label' \ and contains(text(), 'Schedule')]
    Sleep    2
    Click Button    Yes    # Pop up 'Yes'
    Sleep    2
    Click Button    Ok    # Pop up 'OK'
    Sleep    5
    Element should contain    //div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr/td/div[contains(text(), 'Scheduled')]    Scheduled    # Confirm content
    Sleep    5
    Reload Page
    Sleep    50

Verify_Campaign_Status_In_List_Page_Complete_By_members
    Unselect Frame
    Sleep    5
    Click Element    xpath=//*[@id="engage-send"]/div[1]    # Click on Send
    Sleep    5
    Click Element    css=#engage-send > div.sfui-menu-dropdown > div > ul > li > ul > li:nth-child(2) > ul > li:nth-child(2)    # Click on MultiVariate
    Sleep    100
    Reload Page
    Sleep    15
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Wait Until Element is Visible     //*[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr[@__gwt_row="0"]/td/div/span/u[contains(text(), "MultiVariate Test")]    timeout=30
    Sleep    10
    Element should contain    //*[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr[@__gwt_row="0"]/td/div/span/u[contains(text(), "MultiVariate Test")]    MultiVariate Test    # Verify Message title
    Element should contain    //div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr[@__gwt_row="0"]/td/div[contains(text(), 'Completed')]    Completed    # Verify 'Complete
