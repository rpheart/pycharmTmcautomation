*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword

*** Variables ***
${screenshots}    ${EMPTY}
${get_date_value}    ${EMPTY}

*** Test Cases ***
C72_Send_A_MultiMessage_Campaign
    Send_Add_Thumbnail
    Enter_Campaign_Details_Select_Message
    Select_Subject_Define_Campaign_Messages
    Select_Message_Schedule_Campaign
    #---Verify results
    Verify_Campaign_Status_In_List_Page_Complete_By_members
    Suite Teardown

*** Keywords ***
Suite Teardown
    Close All Browsers

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Send_Add_Thumbnail
    Click Element    xpath=//*[@id="engage-send"]/div[1]    # Click on Send
    Wait until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[3]/ul/li[1]    timeout=10
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[3]/ul/li[1]    # Click on MultiVariate
    Wait Until element Is Visible    css=iframe.sfIFrame    timeout=50
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Wait Until element Is Visible    id=emv-ccmd-iframe
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Sleep    2

Enter_Campaign_Details_Select_Message
    Wait Until Page Contains    Define campaign and recipients    timeout=40
    Sleep    5
    input text    id=splitrunUI-builderView-nameInput    MultiMessage Campaign
    Sleep    5
    input text    id=splitrunUI-builderView-descriptionInput    MultiMessage Campaign
    Sleep    2
    Click Element    //div[@class='GDPGA2PBIHB-com-emailvision-ui-gwt-client-component-explorer-bundle-IExplorerCssResource-buttonLabel' \ and contains(text(), 'Select one or more segments')]    # Click Segment
    Sleep    2
    Click Element    //div[@id='splitrunUI-builderView-segmentsExplorer-nameColumn' \ and contains(text(), 'QA auto test Segment')]    # Select 'QA auto test Segment'
    Sleep    2
    Click Element    id=splitrunUI-builderView-segmentsExplorer-addEntitiesButton    # Click 'OK' on Segment selection
    Sleep    2
    Click Element    //div[@class="GDPGA2PBNX-com-emailvision-ui-gwt-client-bundle-bluebutton-IBlueButtonCssResource-labelPadding" and contains(text(), 'Continue')]    # Click 'Continue'

Select_Subject_Define_Campaign_Messages
    Wait Until Page Contains    Define messages and partitions
    Sleep    2
    Click Element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton"]/tbody/tr/td[1]/div/div    #Click Message 1
    Sleep    2
    Click Element    xpath=//div[@id='splitrunUI-builderView-testMessage-messagesExplorer-version1-nameColumn' \ and contains(text(), 'QA auto test Message')]    # Select 'QA auto test Message' message
    Sleep    2
    Click Element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton"]/tbody/tr/td[1]/div/div    # Click Message 2
    Sleep    2
    Click Element    xpath=//div[@id='splitrunUI-builderView-testMessage-messagesExplorer-version2-nameColumn' \ and contains(text(), 'QA auto test Message')]    # Select 'QA auto test Message' message
    Sleep    2
    Click Element    //div[@class="GDPGA2PBNX-com-emailvision-ui-gwt-client-bundle-bluebutton-IBlueButtonCssResource-labelPadding" and contains(text(), 'Continue')]    # Click 'Continue'
    #-----

Select_Message_Schedule_Campaign
    Wait Until Page Contains    Schedule campaign    # check page content
    Sleep    2
    Click Element    css=#splitrunUI-builderView-sendLaterRadioButton    # Click Send later
    ${get_date_value}=    Get Value    id=splitrunUI-builderView-dateTimeInput    # Get value 'time' to compare later
    Sleep    2
    Click Element    css=#splitrunUI-builderView-sendCampaignButton > tbody > tr > td > div    # Click Schedule
    Sleep    2
    Click Button    Ok
    Sleep    3

Verify_Campaign_Status_In_List_Page_Complete_By_members
    Element should contain    //div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr/td/div[contains(text(), 'Schedule')]    Schedule    # Check if multimessage is scheduled
    Unselect Frame
    Sleep    5
    Click Element    xpath=//*[@id="engage-send"]/div[1]    # Click on Send
    Sleep    5
    Click Element    css=#engage-send > div.sfui-menu-dropdown > div > ul > li > ul > li:nth-child(3) > ul > li:nth-child(2)    # Click on MultiVariate
    Sleep    10
    Select frame    css=iframe.sfIFrame    #Click on main frame
    Select Frame    id=emv-ccmd-iframe    # Click on inner frame
    Wait until Element Is Visible    id=intro
    Mouse Over    //div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr/td/div/div    # Hover over 'Campaign Name'
    Click Element    xpath=//div[@id="splitrunuidiv"]/div/div/div/div/div/div/div/div/div/div/table/tbody/tr/td/div/div[@class='GDPGA2PBEHB-com-emailvision-ui-gwt-client-component-datagrid-IEmvDataGridStyle-iconViewNotVisible']    # Click on 'View'
    Sleep    1
    Element should contain    id=splitrunUI-readOnlyView-sendDateValue    ${get_date_value}    # Compare time
    Sleep    5
    capture page screenshot    # Take a screenshot of preview page
