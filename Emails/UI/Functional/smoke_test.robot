*** Settings ***
Documentation       smoke tests to verify that every page loads
Resource            ../Utils/keywords.robot
Suite Setup         run keywords    login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers
Default Tags        ui    email    smoke

*** Test Cases ***
Calendar
    go to ${calendar["menu"]}
#    page should contain    Campaigns    # flash

Send
    open content    ${standard_campaign}      ${standard_campaign["button_add"]["add"]}
#    page should contain    Campaigns    # flash
    open content    ${standard_campaign}      ${standard_campaign["button_list"]["list"]}
    page should contain    Campaigns
    open content    ${multivariate_campaign}      ${multivariate_campaign["button_add"]["add"]}
    page should contain    Campaigns
    open content    ${multivariate_campaign}      ${multivariate_campaign["button_list"]["list"]}
    page should contain    Campaigns
    open content    ${multimessage_campaign}      ${multimessage_campaign["button_add"]["add"]}
    page should contain    Campaigns
    open content    ${multimessage_campaign}      ${multimessage_campaign["button_list"]["list"]}
    page should contain    Campaigns
    open content    ${trigger_campaign}      ${trigger_campaign["button_add"]["add"]}
    page should contain    Campaigns
    open content    ${trigger_campaign}      ${trigger_campaign["button_list"]["list"]}
    page should contain    Campaigns

Create
    open content    ${new_message_builder}      ${new_message_builder["button_add"]["add"]}
    page should contain    Message
    open content    ${new_message_builder}      ${new_message_builder["button_list"]["list"]}
    page should contain    Message
    open content    ${classic_message_builder}      ${classic_message_builder["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${classic_message_builder}      ${classic_message_builder["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}
    open content    ${sms_message_builder}      ${sms_message_builder["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${sms_message_builder}      ${sms_message_builder["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}
    open content    ${landing_page}      ${landing_page["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${landing_page}      ${landing_page["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}
    open content    ${content_block}      ${content_block["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${content_block}      ${content_block["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}
    open content    ${webform}      ${webform["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${webform}      ${webform["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}
    open content    ${template}      ${template["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${template}      ${template["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}
    open content    ${transactional_message}      ${transactional_message["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${transactional_message}      ${transactional_message["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}
    open content    ${transactional_content_block}      ${transactional_content_block["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${transactional_content_block}      ${transactional_content_block["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}

List_Management
    open content    ${segments}      ${segments["button_add"]["add"]}
#    page should contain    Segments    # flash
    open content    ${segments}      ${segments["button_list"]["list"]}
#    page should contain    Segments    # flash
    open content    ${add_subscriber}      ${add_subscriber["button_add"]["add"]}
    element should be visible    ${generics["add"]}
    open content    ${search_subscriber}      ${search_subscriber["button_add"]["add"]}
    element should be visible    ${generics["add"]}
    open content    ${import_subscriber}      ${import_subscriber["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${import_subscriber}      ${import_subscriber["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}
    open content    ${export_subscriber}      ${export_subscriber["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${export_subscriber}      ${export_subscriber["button_list"]["list"]}
    element should be visible    ${generics["create_new"]}

Image_Library
    go to ${image_library["menu"]}
    page should contain    Image Library

Deliverability
    go to ${deliverability["menu"]}
#    page should contain    Overview    # might not be enabled per account

Reports
    open content    ${email_reports}      ${email_reports["button_add"]["add"]}
#    page should contain    Reports    # flash
    open content    ${multivariate_reports}      ${multivariate_reports["button_add"]["add"]}
#    page should contain    Reports    # flash
    open content    ${multimessage_reports}      ${multimessage_reports["button_add"]["add"]}
#    page should contain    Reports    # flash
    open content    ${test_reports}      ${test_reports["button_add"]["add"]}
#    page should contain    Reports    # flash
    open content    ${transactional_reports}      ${transactional_reports["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${trigger_reports}      ${trigger_reports["button_add"]["add"]}
#    page should contain    Reports    # flash
    open content    ${landing_page_reports}      ${landing_page_reports["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}
    open content    ${mobile_reports}      ${mobile_reports["button_add"]["add"]}
#    element should be visible    ${generics["search_button"]}
    open content    ${list_growth_reports}      ${list_growth_reports["button_add"]["add"]}
    element should be visible    ${generics["create_new"]}

Folders
    go to ${folders["menu"]}
    page should contain    Folder

Workflow
    open content    ${workflow}      ${workflow["button_add"]["add"]}
    page should contain    Workflow
    open content    ${workflow_model}      ${workflow_model["button_add"]["add"]}
    page should contain    Workflow

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
    go to ${approval["menu"]}
    page should contain    My Requests
