*** Settings ***
Documentation       Suite description
Resource            Utils/keywords.robot
Default Tags        ui    smoke    email    production

*** Variables ***

*** Test Cases ***
Login And Go To Email
    Login
    Go To ${system_page["email"]}

Calendar
    Go To ${calendar["menu"]}
#    Verify Page Contains Campaigns    # flash

Send
    Open Content    ${standard_campaign}      ${standard_campaign["button_add"]}
#    Verify Page Contains Campaigns    # flash
    Open Content    ${standard_campaign}      ${standard_campaign["button_list"]}
    Verify Page Contains Campaigns
    Open Content    ${multivariate_campaign}      ${multivariate_campaign["button_add"]}
    Verify Page Contains Campaigns
    Open Content    ${multivariate_campaign}      ${multivariate_campaign["button_list"]}
    Verify Page Contains Campaigns
    Open Content    ${multimessage_campaign}      ${multimessage_campaign["button_add"]}
    Verify Page Contains Campaigns
    Open Content    ${multimessage_campaign}      ${multimessage_campaign["button_list"]}
    Verify Page Contains Campaigns
    Open Content    ${trigger_campaign}      ${trigger_campaign["button_add"]}
    Verify Page Contains Campaigns
    Open Content    ${trigger_campaign}      ${trigger_campaign["button_list"]}
    Verify Page Contains Campaigns

Create
    Open Content    ${new_message_builder}      ${new_message_builder["button_add"]}
    Verify Page Contains Message
    Open Content    ${new_message_builder}      ${new_message_builder["button_list"]}
    Verify Page Contains Message
    Open Content    ${classic_message_builder}      ${classic_message_builder["button_add"]}
    Verify Page Contains Assets
    Open Content    ${classic_message_builder}      ${classic_message_builder["button_list"]}
    Verify Page Contains Assets
    Open Content    ${sms_message_builder}      ${sms_message_builder["button_add"]}
    Verify Page Contains Assets
    Open Content    ${sms_message_builder}      ${sms_message_builder["button_list"]}
    Verify Page Contains Assets
    Open Content    ${landing_page}      ${landing_page["button_add"]}
    Verify Page Contains Landing Pages
    Open Content    ${landing_page}      ${landing_page["button_list"]}
    Verify Page Contains Landing Pages
    Open Content    ${content_block}      ${content_block["button_add"]}
    Verify Page Contains Assets
    Open Content    ${content_block}      ${content_block["button_list"]}
    Verify Page Contains Dynamic Content Blocks
    Open Content    ${webform}      ${webform["button_add"]}
    Verify Page Contains Assets
    Open Content    ${webform}      ${webform["button_list"]}
    Verify Page Contains Assets
    Open Content    ${template}      ${template["button_add"]}
    Verify Page Contains Assets
    Open Content    ${template}      ${template["button_list"]}
    Verify Page Contains Assets
    Open Content    ${transactional_message}      ${transactional_message["button_add"]}
    Verify Page Contains Transactional Messaging
    Open Content    ${transactional_message}      ${transactional_message["button_list"]}
    Verify Page Contains Transactional Messaging
    Open Content    ${transactional_content_block}      ${transactional_content_block["button_add"]}
    Verify Page Contains Transactional Messaging
    Open Content    ${transactional_content_block}      ${transactional_content_block["button_list"]}
    Verify Page Contains Transactional Messaging

List_Management
    Open Content    ${segments}      ${segments["button_add"]}
#    Verify Page Contains Segments    # flash
    Open Content    ${segments}      ${segments["button_list"]}
#    Verify Page Contains Segments    # flash
    Open Content    ${add_subscriber}      ${add_subscriber["button_add"]}
    Verify Page Contains Lists
    Open Content    ${search_subscriber}      ${search_subscriber["button_add"]}
    Verify Page Contains Lists
    Open Content    ${import_subscriber}      ${import_subscriber["button_add"]}
    Verify Page Contains Lists
    Open Content    ${import_subscriber}      ${import_subscriber["button_list"]}
    Verify Page Contains Lists
    Open Content    ${export_subscriber}      ${export_subscriber["button_add"]}
    Verify Page Contains Lists
    Open Content    ${export_subscriber}      ${export_subscriber["button_list"]}
    Verify Page Contains Lists

Image_Library
    Go To ${image_library["menu"]}
    Verify Page Contains Image Library

Deliverability
    Go To ${deliverability["menu"]}
#    Verify Page Contains Overview    # might not be enabled per account

Reports
    Open Content    ${email_reports}      ${email_reports["button_add"]}
#    Verify Page Contains Reports    # flash
    Open Content    ${multivariate_reports}      ${multivariate_reports["button_add"]}
#    Verify Page Contains Reports    # flash
    Open Content    ${multimessage_reports}      ${multimessage_reports["button_add"]}
#    Verify Page Contains Reports    # flash
    Open Content    ${test_reports}      ${test_reports["button_add"]}
#    Verify Page Contains Reports    # flash
    Open Content    ${transactional_reports}      ${transactional_reports["button_add"]}
    Verify Page Contains Transactional Messaging
    Open Content    ${trigger_reports}      ${trigger_reports["button_add"]}
#    Verify Page Contains Reports    # flash
    Open Content    ${landing_page_reports}      ${landing_page_reports["button_add"]}
    Verify Page Contains Landing Pages
    Open Content    ${mobile_reports}      ${mobile_reports["button_add"]}
    Verify Page Contains Reports
    Open Content    ${list_growth_reports}      ${list_growth_reports["button_add"]}
    Verify Page Contains Lists

Folders
    Go To ${folders["menu"]}
    Verify Page Contains Folder

Workflow
    Open Content    ${workflow}      ${workflow["button_add"]}
    Verify Page Contains Workflow
    Open Content    ${workflow_model}      ${workflow_model["button_add"]}
    Verify Page Contains Workflow

#Social
#    Click Element    xpath=//*[@id="social"]/div[1]
#    Wait Until Element Is Visible    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/span    timeout=5
#    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[1]/ul/li    # Click Post
#    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[2]/ul/li    # Click Multiwall
#    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[1]    # Click Objectives
#    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
#    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[1]/ul/li[3]/ul/li[2]
#    Click Element    xpath=//*[@id="social"]/div[2]/div/ul/li[2]/ul/li/ul/li    # Click Social Administration

Approval
    Go To ${approval["menu"]}
    Verify Page Contains My Requests

Close Browser
    Close All Browsers

*** Keywords ***
Verify Page Contains ${text}
    Select Frame    ${iframes["top"]}    # Click on main frame
    Select Frame    ${iframes["ccmd"]}
    Wait Until Page Contains    ${text}    timeout=30