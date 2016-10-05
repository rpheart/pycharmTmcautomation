*** Settings ***
Library           Selenium2Library    10    2    run_on_failure=Fail Keyword    screenshot_root_directory=.

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
    Click Element    xpath=//*[@id="engage-calendar"]/div
    Sleep    1

Send
    Click Element    xpath=//*[@id="engage-send"]/div[1]
    Wait Until Element Is Visible    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/span    timeout=5
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[1]/ul/li[1]    # Click Standard
    Sleep    1
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[1]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[1]    # Click MultiVariate
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[2]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[3]/ul/li[1]    # Click MultiMessage
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[3]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[4]/ul/li[1]    # Click Trigger
    Click Element    xpath=//*[@id="engage-send"]/div[2]/div/ul/li/ul/li[4]/ul/li[2]
    Sleep    2

Create
    Click Element    xpath=//*[@id="engage-create"]/div[1]
    Wait until Element Is Visible    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/span    timeout=5
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li[1]    # Click on Message Builder
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[1]    # Click Message
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    # Click SMS Message
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[1]    # Click Landing Page
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li[1]    # Click Content Block
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li[1]    # Click Webform
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[1]    # Click Template
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[1]    # Click Transaction Content Message
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[1]
    Click Element    xpath=//*[@id="engage-create"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li[2]
    Sleep    2

List_Management
    Click Element    xpath=//*[@id="engage-list-management"]/div[1]
    Wait Until Element Is Visible    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[1]/span    timeout=5
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[1]/ul/li/ul/li[1]    # Click \ Segment
    Sleep    1
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[1]/ul/li/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[1]/ul/li    # Click Add Subscriber
    Sleep    1
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[2]/ul/li    # Click Search Subsriber
    Sleep    1
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[3]/ul/li[1]    # Click Import Subscriber
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[3]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[4]/ul/li[1]    # Click Export Subsriber
    Click Element    xpath=//*[@id="engage-list-management"]/div[2]/div/ul/li[2]/ul/li[4]/ul/li[2]
    Sleep    2

Image_Library
    Click Element    xpath=//*[@id="image-library"]/div
    Sleep    2

Deliverability
    Click Element    xpath=//*[@id="engage-deliverability"]/div
    Sleep    2

Reports
    Click Element    xpath=//*[@id="engage-reports"]/div[1]
    Wait Until Element Is Visible    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/span    timeout=5
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    # Click Emails
    Sleep    1
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    # Click Multiviriete
    Sleep    1
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li    # Click MultiMessage
    Sleep    1
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[4]/ul/li    # Click Test
    Sleep    1
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[5]/ul/li    # Click Transactional
    Sleep    1
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[6]/ul/li    # Click Trigger
    Sleep    1
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[1]/ul/li[7]/ul/li    # Click Lending Page
    Sleep    1
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[2]/ul/li/ul/li    # Click Mobile
    Sleep    1
    Click Element    xpath=//*[@id="engage-reports"]/div[2]/div/ul/li[3]/ul/li/ul/li    # Click List Growth
    Sleep    2

Folders
    Click Element    xpath=//*[@id="engage-folders"]/div
    Sleep    2

Workflow
    Click Element    xpath=//*[@id="engage-workflow"]/div[1]
    Wait Until Element Is Visible    xpath=//*[@id="engage-workflow"]/div[2]/div/ul/li/span    timeout=5
    Click Element    xpath=//*[@id="engage-workflow"]/div[2]/div/ul/li/ul/li[1]/ul/li    # Click on elements
    Sleep    1
    Click Element    xpath=//*[@id="engage-workflow"]/div[2]/div/ul/li/ul/li[2]/ul/li
    Sleep    2

Social
    Click Element    xpath=//*[@id="social"]/div[1]
    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/span    timeout=5
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    # Click Post
    Sleep    1
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    # Click Multiwall
    Sleep    1
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    # Click Objectives
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
    Sleep    1    # Click Statistics
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
    Sleep    1
    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[2]/ul/li/ul/li    # Click Social Administration
    Sleep    2

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot
