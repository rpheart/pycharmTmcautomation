*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword

*** Variables ***
${screenshots}    ${EMPTY}

*** Test Cases ***
Email_Smoke_Test
    #Login
    Calendar    # Check tabs
    Send    # Check tabs
    Create    # Check tabs
    List_Management    # Check tabs
    Image_Library    # Check tabs
    Deliverability    # Check tabs
    Reports    # Check tabs
    Folders    # Check tabs
    Workflow    # Check tabs
    Comment    Social    # Check tabs
    Close All Browsers

*** Keywords ***
Calendar
    #-- Calendar --
    Sleep    7
    Wait Until Element Is Visible    xpath=//*[@id="engage-calendar"]/div[contains(text(),"Calendar")]    timeout=15
    Click Element    xpath=//*[@id="engage-calendar"]/div[contains(text(),"Calendar")]
    Sleep    2

Send
    #-- Send --
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]    timeout=15    # Check 'Send' exists
    Click Element    xpath=//*[@id="engage-send"]/div[contains(text(),"Send")]    # Click \ 'Send'
    Sleep    2
    #-- Standard --
    Wait Until Element is Visible    xpath=//*[@id="engage-send"]/div/div/ul/li/span[contains(text(),"Campaigns")]    timeout=10    # Check 'Campaigns' exists
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"Standard")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"Standard")]/../ul/li    # Click: Standard
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"Standard")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"Standard")]/../ul/li[2]    # Click: Standard List
    Sleep    5
    #-- MultiVariate --
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiVariate")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiVariate")]/../ul/li    # Click: \ MultiVariate
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiVariate")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiVariate")]/../ul/li[2]    # Click: \ MultiVariate List
    Sleep    8
    #-- MultiMessage --
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiMessage")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiMessage")]/../ul/li    # Click: \ MultiMessage
    Sleep    3
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiMessage")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"MultiMessage")]/../ul/li[2]    # Click: \ MultiMessage List
    Sleep    8
    #--Trigger --
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"Trigger")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"Trigger")]/../ul/li    # Click Trigger
    Sleep    3
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]//span[contains(text(),"Trigger")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-send"]//span[contains(text(),"Trigger")]/../ul/li[2]    # Click Trigger List
    Sleep    3

Create
    #-- Create --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]    timeout=15
    Click Element    xpath=//*[@id="engage-create"]/div[contains(text(),"Create")]
    Sleep    2
    #-- Message Builder --
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div/div/ul/li/span[contains(text(),"Standard Content")]    timeout=5    # Check 'Standard Content' is visible
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Message Builder")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Message Builder")]/../ul/li    # Click: on Message Builder
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Message Builder")]/../ul/li[2]
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Message Builder")]/../ul/li[2]    # Click: Standard list
    Sleep    2
    #-- Message --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Standard Content")]/../ul/li[2]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Standard Content")]/../ul/li[2]/ul/li    # Click: \ Message
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Standard Content")]/../ul/li[2]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Standard Content")]/../ul/li[2]/ul/li[2]    # Click: Message List
    Sleep    2
    #-- SMS Message --
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"SMS Message")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"SMS Message")]/../ul/li    # Click: SMS Message
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"SMS Message")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"SMS Message")]/../ul/li[2]    # Click: SMS Message List
    Sleep    2
    #-- Landing Page --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Landing page")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Landing page")]/../ul/li    # Click Landing Page
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Landing page")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Landing page")]/../ul/li[2]
    Sleep    2
    #-- Content Block --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Content Block")]/../ul/li
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Content Block")]/../ul/li    # Click: \ Content Block
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Content Block")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Content Block")]/../ul/li[2]    # Click: Content Block List
    Sleep    2
    #-- Webform --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Webform")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Webform")]/../ul/li    # Click: \ Webform
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Webform")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Webform")]/../ul/li[2]    # Click: Webform List
    Sleep    2
    #-- Template --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Template")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Template")]/../ul/li    # Click: \ Template
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]//span[contains(text(),"Template")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]//span[contains(text(),"Template")]/../ul/li[2]    # Click: Template List
    Sleep    2
    #-- Transaction Content Message --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/span[contains(text(),"Transactional Content")]    timeout=5    # Transactional Content is visible
    #-- Message --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[1]    # Click Transaction Content Message
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[2]
    Sleep    2
    #-- Content Block --
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[1]    # Click Content Block
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[2]
    Sleep    3

List_Management
    #-- List_Management --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[contains(text(),"List Management")]    timeout=15
    Click Element    xpath=//*[@id="engage-list-management"]/div[contains(text(),"List Management")]
    Sleep    2
    #-- Segment --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]//span[@class="dropdown-module-title no-title" and contains(text(),"Segment")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]//span[@class="dropdown-module-title no-title" and contains(text(),"Segment")]/../ul/li    # Click: \ Segment
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Segment")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Segment")]/../ul/li[2]    # Click: Segment List
    Sleep    2
    #-- Subscriber Management Lable--
    Wait Until Element is Visible    //*[@id="engage-list-management"]//span[contains(text(),"Subscriber Management")]    timeout=5    # Check Description
    #-- Add Subscriber --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Add subscriber")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Add subscriber")]/../ul/li    # Click: Add Subscriber
    Sleep    2
    #-- Search Subscriber --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Search subscriber")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Search subscriber")]/../ul/li    # Click: Search Subsriber
    Sleep    2
    #-- Import Subscriber --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Import subscriber")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Import subscriber")]/../ul/li    # Click: Import Subscriber
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Import subscriber")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Import subscriber")]/../ul/li[2]    # Click: Import Subscriber List
    Sleep    2
    #-- Export Subscriber --
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Export subscriber")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Export subscriber")]/../ul/li    # Click: Export Subscriber
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Export subscriber")]/../ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]//span[contains(text(),"Export subscriber")]/../ul/li[2]    #Click: Export Subscriber List
    Sleep    3

Image_Library
    #-- Image_Library --
    Wait Until Element Is Visible    xpath=//*[@id="image-library"]/div[contains(text(),"Image Library")]    timeout=15
    Click Element    xpath=//*[@id="image-library"]/div[contains(text(),"Image Library")]
    Sleep    3

Deliverability
    #-- Deliverability --
    Wait Until Element Is Visible    xpath=//*[@id="engage-deliverability"]/div[contains(text(),"Deliverability")]    timeout=15
    Click Element    xpath=//*[@id="engage-deliverability"]/div[contains(text(),"Deliverability")]
    Sleep    2

Reports
    #-- Reports --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[contains(text(),"Reports")]    timeout=15
    Click Element    xpath=//*[@id="engage-reports"]/div[contains(text(),"Reports")]
    Sleep    2
    #--Email --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/span    timeout=5
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    # Click Emails
    Sleep    2
    #-- Multivviriete --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    # Click Multiviriete
    Sleep    2
    #-- MultiMessage --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li    # Click MultiMessage
    Sleep    2
    #-- Test --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li    # Click Test
    Sleep    2
    #-- Transactional --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li    # Click Transactional
    Sleep    2
    #-- Trigger --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li    # Click Trigger
    Sleep    2
    #-- Lending Page --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li    # Click Lending Page
    Sleep    2
    #-- Mobile Lable --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div/div/ul/li/span[contains(text(),"Mobile")]    timeout=5    # Check 'Mobile Lable '
    #-- Mobile --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[2]/ul/li/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[2]/ul/li/ul/li    # Click Mobile
    Sleep    2
    #-- Growth Lable --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div/div/ul/li/span[contains(text(),"List Growth")]    timeout=5
    #-- Growth --
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[3]/ul/li/ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[3]/ul/li/ul/li    # Click List Growth
    Sleep    2

Folders
    #-- Folders --
    Wait Until Element Is Visible    xpath=//*[@id="engage-folders"]/div[contains(text(),"Folders")]    timeout=15
    Click Element    xpath=//*[@id="engage-folders"]/div[contains(text(),"Folders")]    # Click: Folders
    Sleep    2

Workflow
    #-- Workflow --
    Wait Until Element Is Visible    xpath=//*[@id="engage-workflow"]/div[contains(text(),"Workflow")]    timeout=15
    Click Element    xpath=//*[@id="engage-workflow"]/div[contains(text(),"Workflow")]
    #-- Workflow Lable --
    Element Should Be Visible    xpath=//*[@id="engage-workflow"]//span[contains(text(),"Workflow management")]    timeout=5    # Check: \ 'Workflow management' is visble
    #-- Workflow Management --
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-workflow"]//span[contains(text(),"Workflow")]/../ul/li
    Click Element    xpath=//*[@id="engage-workflow"]//span[contains(text(),"Workflow")]/../ul/li    # Click: Workflow
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="engage-workflow"]//span[contains(text(),"Model")]/../ul/li    timeout=5
    Click Element    xpath=//*[@id="engage-workflow"]//span[contains(text(),"Model")]/../ul/li    # Click: Model
    Sleep    2

Social
    #-- Social --
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[1]    timeout=15
    Click Element    xpath=//*[@id="social"]/div[1]
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/span    timeout=15
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    # Click Post
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    # Click Multiwall
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    # Click Objectives
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
    Sleep    2    # Click Statistics
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[2]/ul/li/ul/li    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[2]/ul/li/ul/li    # Click Social Administration
    Sleep    2

Fail keyword
    capture page screenshot
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot
