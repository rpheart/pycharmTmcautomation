*** Settings ***
Documentation       smoke test that runs to each page in email and checks for the existence of all of the elements
Resource            ../Utils/keywords.robot
Resource            Email_Structure_And_Content.robot
Variables           ../Utils/variables.py
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
Calendar
    #-- Calendar --
    Unselect Frame
    Wait Until Element Is Visible    ${calendar["menu"]}
    Click Element    ${calendar["menu"]}    # Click: Calendar
    Run Keyword And Ignore Error    Dismiss Alert

Send_Standard_Campaign
    #-- Click: \ Send
    Unselect Frame
    Wait Until Element Is Visible    ${standard_campaign["menu"]}
    Click Element    ${standard_campaign["menu"]}    # Click: Send
    #-- Select: Standard Campaign--
    Wait Until Element is Visible    ${standard_campaign["label"]}    # label 'Campaigns'
    Wait Until Element Is Visible    ${standard_campaign["button_add"]["add"]}
    Click Element    ${standard_campaign["button_add"]["add"]}    # Click: Standard add
    Run Keyword And Ignore Error    Dismiss Alert
    Wait Until Element Is Visible    ${standard_campaign["button_list"]["list"]}
    Click Element    ${standard_campaign["button_list"]["list"]}    # Click: Standard List
    Run Keyword And Ignore Error    Dismiss Alert
    Standard_Campaign_List

Send_Multivariate_Campaign
    #-- MultiVariate --
    Unselect Frame
    Wait Until Element Is Visible    ${multivariate_campaign["menu"]}
    Click Element    ${multivariate_campaign["menu"]}
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["add"]}
    Click Element    ${multivariate_campaign["button_add"]["add"]}    # Click: \ MultiVariate
    Run Keyword And Ignore Error    Dismiss Alert
    MultiVariate_Add    # Add a MultiVariate Campaign
    Unselect Frame
    Wait Until Element Is Visible    ${multivariate_campaign["menu"]}
    Click Element    ${multivariate_campaign["menu"]}
    Wait Until Element Is Visible    ${multivariate_campaign["button_list"]["list"]}
    Click Element    ${multivariate_campaign["button_list"]["list"]}    # Click: \ MultiVariate List
    Run Keyword And Ignore Error    Dismiss Alert
    MultiVariate_List    # List a MultiVariate Campaign

Send_Multimessage_Campaign
    #-- MultiMessage Campaign
    Unselect Frame
    Wait Until Element Is Visible    ${multimessage_campaign["menu"]}
    Click Element    ${multimessage_campaign["menu"]}    # Click: Send
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["add"]}
    Click Element    ${multimessage_campaign["button_add"]["add"]}    # Click: \ MultiMessage add
    Run Keyword And Ignore Error    Dismiss Alert
    MultiMessage_Add    # Add a MultiMessage Campaign
    Unselect Frame
    Wait Until Element Is Visible    ${multimessage_campaign["menu"]}
    Click Element    ${multimessage_campaign["menu"]}    # Click: Send
    Wait Until Element Is Visible    ${multimessage_campaign["button_list"]["list"]}
    Click Element    ${multimessage_campaign["button_list"]["list"]}    # Click: \ MultiMessage List
    Run Keyword And Ignore Error    Dismiss Alert
    MultiMessage_List    # List a MultiMessage Campaign

Send_Trigger_Campaign
    #--Trigger Campaign
    Unselect Frame
    Wait Until Element Is Visible    ${trigger_campaign["menu"]}
    Click Element    ${trigger_campaign["menu"]}    # Click: Trigger add
    Wait Until Element Is Visible    ${trigger_campaign["button_add"]["add"]}
    Click Element    ${trigger_campaign["button_add"]["add"]}    # Click: Trigger add
    Run Keyword And Ignore Error    Dismiss Alert
    Wait Until Element Is Visible    ${trigger_campaign["button_list"]["list"]}
    Click Element    ${trigger_campaign["button_list"]["list"]}    # Click: Trigger List
    Run Keyword And Ignore Error    Dismiss Alert
    Trigger_Campaign_List

Create_New_Message_Builder
    #-- Create --
    Unselect Frame
    Wait Until Element Is Visible    ${classic_message_builder["menu"]}
    Click Element    ${classic_message_builder["menu"]}    # Click: Create
    #-- Create New Message Builder--
    Wait until Element Is Visible    ${new_message_builder["standard_content"]}
    Wait Until Element Is Visible    ${new_message_builder["button_add"]["add"]}
    Click Element    ${new_message_builder["button_add"]["add"]}    # Click: add New Message Builder
    Run Keyword And Ignore Error    Dismiss Alert
    New_Message_Add    # Create a new message
    Unselect Frame
    Wait Until Element Is Visible    ${new_message_builder["menu"]}
    Click Element    ${new_message_builder["menu"]}
    Wait Until Element Is Visible    ${new_message_builder["button_list"]["list"]}
    Click Element    ${new_message_builder["button_list"]["list"]}    # Click: list New Message Builder
    Run Keyword And Ignore Error    Dismiss Alert
    New_Message_List    # List the new message

Create_Classic_Message
    #--Create \ Message Builder --
    Unselect Frame
    Wait Until Element Is Visible    ${classic_message_builder["menu"]}
    Click Element    ${classic_message_builder["menu"]}
    Wait until Element Is Visible    ${classic_message_builder["standard_content"]}    # Check 'Standard Content' is visible
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["add"]}
    Click Element    ${classic_message_builder["button_add"]["add"]}    # Click: Add Classic Message Builder
    Run Keyword And Ignore Error    Dismiss Alert
    Classic_Message_Add    # Create a classic message
    Unselect Frame
    Wait Until Element Is Visible    ${classic_message_builder["menu"]}
    Click Element    ${classic_message_builder["menu"]}
    Wait Until Element Is Visible    ${classic_message_builder["button_list"]["list"]}
    Click Element    ${classic_message_builder["button_list"]["list"]}    # Click: List Classic Message Builder
    Run Keyword And Ignore Error    Dismiss Alert
    Classic_Message_List    # List a classic message

Create_SMS_Message
    #-- Create SMS Message --
    Unselect Frame
    Wait Until Element Is Visible    ${sms_message_builder["menu"]}
    Click Element    ${sms_message_builder["menu"]}    # Click: Create
    Wait until Element Is Visible    ${sms_message_builder["button_add"]["add"]}
    Click Element    ${sms_message_builder["button_add"]["add"]}    # Click: add SMS Message
    Run Keyword And Ignore Error    Dismiss Alert
    SMS_Message_Add    # Create a SMS message
    Unselect Frame
    Wait Until Element Is Visible    ${sms_message_builder["menu"]}
    Click Element    ${sms_message_builder["menu"]}    # Click: Create
    Wait Until Element Is Visible    ${sms_message_builder["button_list"]["list"]}
    Click Element    ${sms_message_builder["button_list"]["list"]}    # Click: list SMS Message
    Run Keyword And Ignore Error    Dismiss Alert
    SMS_Message_List    # List a SMS message

Create_Landing_Page
    #--Create Landing Page --
    Unselect Frame
    Wait Until Element Is Visible    ${landing_page["menu"]}
    Click Element    ${landing_page["menu"]}
    Wait Until Element Is Visible    ${landing_page["button_add"]["add"]}
    Click Element    ${landing_page["button_add"]["add"]}    # Click: add Landing Page
    Run Keyword And Ignore Error    Dismiss Alert
    Landing_Page_Add    # Create a landing page
    Unselect Frame
    Wait Until Element Is Visible    ${landing_page["menu"]}
    Click Element    ${landing_page["menu"]}
    Wait Until Element Is Visible    ${landing_page["button_list"]["list"]}
    Click Element    ${landing_page["button_list"]["list"]}    # Click: list Landing Page
    Run Keyword And Ignore Error    Dismiss Alert
    Landing_Page_List    # List a landing page

Create_Content_Block
    #-- Create Content Block --
    Unselect Frame
    Wait Until Element Is Visible    ${content_block["menu"]}
    Click Element    ${content_block["menu"]}
    Wait Until Element Is Visible    ${content_block["button_add"]["add"]}
    Click Element    ${content_block["button_add"]["add"]}    # Click: add Content Block
    Run Keyword And Ignore Error    Dismiss Alert
    Content_Block_Add    # Create a content Block
    Unselect Frame
    Wait Until Element Is Visible    ${content_block["menu"]}
    Click Element    ${content_block["menu"]}
    Wait Until Element Is Visible    ${content_block["button_list"]["list"]}
    Click Element    ${content_block["button_list"]["list"]}    # Click: list Content Block
    Run Keyword And Ignore Error    Dismiss Alert
    Content_Block_List    # List a content block

Create_Webform
    #-- Create Webform --
    Unselect Frame
    Wait Until Element Is Visible    ${webform["menu"]}
    Click Element    ${webform["menu"]}
    Wait Until Element Is Visible    ${webform["button_add"]["add"]}
    Click Element    ${webform["button_add"]["add"]}    # Click: add Webform
    Run Keyword And Ignore Error    Dismiss Alert
    Webform_Add    # Create a webform
    Unselect Frame
    Wait Until Element Is Visible    ${webform["menu"]}
    Click Element    ${webform["menu"]}
    Wait Until Element Is Visible    ${webform["button_list"]["list"]}
    Click Element    ${webform["button_list"]["list"]}    # Click: list Webform
    Run Keyword And Ignore Error    Dismiss Alert
    Webform_List    # List a webform

Create_Template
    #-- Create Template --
    Unselect Frame
    Wait Until Element Is Visible    ${template["menu"]}
    Click Element    ${template["menu"]}
    Wait Until Element Is Visible    ${template["button_add"]["add"]}
    Click Element    ${template["button_add"]["add"]}    # Click: \ Template
    Run Keyword And Ignore Error    Dismiss Alert
    Template_Add    # Create a template
    Unselect Frame
    Wait Until Element Is Visible    ${template["menu"]}
    Click Element    ${template["menu"]}
    Wait Until Element Is Visible    ${template["button_list"]["list"]}
    Click Element    ${template["button_list"]["list"]}    # Click: Template List
    Run Keyword And Ignore Error    Dismiss Alert
    Template_List    # List a template

Create_Transactional_Message
    #-- Transaction Content Message --
    Unselect Frame
    Wait Until Element Is Visible    ${transactional_message["menu"]}
    Click Element    ${transactional_message["menu"]}
    Wait Until Element Is Visible    ${transactional_message["transactional_content"]}    # Transactional Content is visible
    Wait Until Element Is Visible    ${transactional_message["button_add"]["add"]}
    Click Element    ${transactional_message["button_add"]["add"]}    # Click: add Transaction Content Message
    Run Keyword And Ignore Error    Dismiss Alert
    Transactional_Message_Add    # Create a transactional message
    Unselect Frame
    Wait Until Element Is Visible    ${transactional_message["menu"]}
    Click Element    ${transactional_message["menu"]}
    Wait Until Element Is Visible    ${transactional_message["button_list"]["list"]}
    Click Element    ${transactional_message["button_list"]["list"]}    # Click: list Transactional Content
    Run Keyword And Ignore Error    Dismiss Alert
    Transactional_Message_List    # List a transactional message

Create_Transactional_Content_Block
    #-- Create Transactional Content Block --
    Unselect Frame
    Wait Until Element Is Visible    ${transactional_content_block["menu"]}
    Click Element    ${transactional_content_block["menu"]}
    Wait Until Element Is Visible    ${transactional_content_block["button_add"]["add"]}
    Click Element    ${transactional_content_block["button_add"]["add"]}    # Click: add Transaction Content Block
    Run Keyword And Ignore Error    Dismiss Alert
    Transactional_Content_Block_Add    # Create a transactional content block
    Unselect Frame
    Wait Until Element Is Visible    ${transactional_content_block["menu"]}
    Click Element    ${transactional_content_block["menu"]}
    Wait Until Element Is Visible    ${transactional_content_block["button_list"]["list"]}
    Click Element    ${transactional_content_block["button_list"]["list"]}    # Click: list Transaction Content Block
    Run Keyword And Ignore Error    Dismiss Alert
    Transactional_Content_Block_List    # List a transactional content block

List_Management_Segments
    #-- List_Management --
    Unselect Frame
    Wait Until Element Is Visible    ${segments["menu"]}
    Click Element    ${segments["menu"]}
    #-- Segment --
    Wait Until Element Is Visible    ${segments["button_add"]["add"]}
    Click Element    ${segments["button_add"]["add"]}    # Click: \ Segment
    Run Keyword And Ignore Error    Dismiss Alert
    Wait Until Element Is Visible    ${segments["button_list"]["list"]}
    Click Element    ${segments["button_list"]["list"]}    # Click: Segment List
    Run Keyword And Ignore Error    Dismiss Alert

List_Management_Add_Subscriber
    #-- Subscriber Management Lable--
    Unselect Frame
    Wait Until Element Is Visible    ${add_subscriber["menu"]}
    Click Element    ${add_subscriber["menu"]}    # Click: Add Subscriber
    Wait Until Element is Visible    ${add_subscriber["subscriber_management"]}    # Check: Description
    Wait Until Element Is Visible    ${add_subscriber["button_add"]["add"]}
    Click Element    ${add_subscriber["button_add"]["add"]}    # Click: Add Subscriber
    Run Keyword And Ignore Error    Dismiss Alert
    Add_Subscriber_Add    # Add a subscriber

List_Management_Search_Subscriber
    #-- Search Subscriber --
    Unselect Frame
    Wait Until Element Is Visible    ${search_subscriber["menu"]}
    Click Element    ${search_subscriber["menu"]}
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["add"]}
    Click Element    ${search_subscriber["button_add"]["add"]}    # Click: Search Subsriber
    Run Keyword And Ignore Error    Dismiss Alert
    Search_Subscriber_Add    # Search a subscriber

List_Management_Import_Subscriber
    #-- Import Subscriber --
    Unselect Frame
    Wait Until Element Is Visible    ${import_subscriber["menu"]}
    Click Element    ${import_subscriber["menu"]}
    Wait Until Element Is Visible    ${import_subscriber["button_add"]["add"]}
    Click Element    ${import_subscriber["button_add"]["add"]}    # Click: Import Subscriber
    Run Keyword And Ignore Error    Dismiss Alert
    Import_Subscriber_Add    # Add import subscriber
    Unselect Frame
    Wait Until Element Is Visible    ${import_subscriber["menu"]}
    Click Element    ${import_subscriber["menu"]}
    Wait Until Element Is Visible    ${import_subscriber["button_list"]["list"]}
    Click Element    ${import_subscriber["button_list"]["list"]}    # Click: Import Subscriber List
    Run Keyword And Ignore Error    Dismiss Alert
    Import_Subscriber_List    # List import subscriber

List_Management_Export_Subscriber
    #-- Export Subscriber --
    Unselect Frame
    Wait Until Element Is Visible    ${export_subscriber["menu"]}
    Click Element    ${export_subscriber["menu"]}
    Wait Until Element Is Visible    ${export_subscriber["button_add"]["add"]}
    Click Element    ${export_subscriber["button_add"]["add"]}    # Click: Export Subscriber
    Run Keyword And Ignore Error    Dismiss Alert
    Export_Subscriber_Add    # Add export subscriber
    Unselect Frame
    Wait Until Element Is Visible    ${export_subscriber["menu"]}
    Click Element    ${export_subscriber["menu"]}
    Wait Until Element Is Visible    ${export_subscriber["button_list"]["list"]}
    Click Element    ${export_subscriber["button_list"]["list"]}    #Click: Export Subscriber List
    Run Keyword And Ignore Error    Dismiss Alert
    Export_Subscriber_List    # List export subscriber

Image_Library
    #-- Image_Library --
    Unselect Frame
    Wait Until Element Is Visible    ${image_library["menu"]}
    Click Element    ${image_library["menu"]}    # Click: Image Library
    Image_Library_Add    # Add image library

Deliverability
    #-- Deliverability --
    Unselect Frame
    Wait Until Element Is Visible    ${deliverability["menu"]}
    Click Element    ${deliverability["menu"]}    # Click: Deliverability

Reports_Email
    #-- Reports --
    Unselect Frame
    Wait Until Element Is Visible    ${email_reports["menu"]}
    Click Element    ${email_reports["menu"]}
    #--Report Email --
    Wait Until Element Is Visible    ${email_reports["button_add"]["add"]}
    Click Element    ${email_reports["button_add"]["add"]}    # Click: Emails Report

Reports_Multivariate
    #-- Report Multiviriete --
    Unselect Frame
    Wait Until Element Is Visible    ${multivariate_reports["menu"]}
    Click Element    ${multivariate_reports["menu"]}    # Click Multiviriete
    Wait Until Element Is Visible    ${multivariate_reports["button_add"]["add"]}
    Click Element    ${multivariate_reports["button_add"]["add"]}    # Click Multiviriete

Reports_MultiMessage
    #-- Report MultiMessage --
    Unselect Frame
    Wait Until Element Is Visible    ${multimessage_reports["menu"]}
    Click Element    ${multimessage_reports["menu"]}    # Click MultiMessage
    Wait Until Element Is Visible    ${multimessage_reports["button_add"]["add"]}
    Click Element    ${multimessage_reports["button_add"]["add"]}    # Click MultiMessage

Reports_Test
    #-- Report Test --
    Unselect Frame
    Wait Until Element Is Visible    ${test_reports["menu"]}
    Click Element    ${test_reports["menu"]}    # Click: Test
    Wait Until Element Is Visible    ${test_reports["button_add"]["add"]}
    Click Element    ${test_reports["button_add"]["add"]}    # Click: Test

Reports_Transactional
    #-- Report Transactional --
    Unselect Frame
    Wait Until Element Is Visible    ${transactional_reports["menu"]}
    Click Element    ${transactional_reports["menu"]}    # Click Transactional
    Wait Until Element Is Visible    ${transactional_reports["button_add"]["add"]}
    Click Element    ${transactional_reports["button_add"]["add"]}    # Click Transactional

Reports_Trigger
    #-- Report Trigger --
    Unselect Frame
    Wait Until Element Is Visible    ${trigger_reports["menu"]}
    Click Element    ${trigger_reports["menu"]}    # Click Trigger
    Wait Until Element Is Visible    ${trigger_reports["button_add"]["add"]}
    Click Element    ${trigger_reports["button_add"]["add"]}    # Click Trigger

Reports_Landing_Page
    #-- Report Lending Page --
    Unselect Frame
    Wait Until Element Is Visible    ${landing_page_reports["menu"]}
    Click Element    ${landing_page_reports["menu"]}    # Click Lending Page
    Wait Until Element Is Visible    ${landing_page_reports["button_add"]["add"]}
    Click Element    ${landing_page_reports["button_add"]["add"]}    # Click Lending Page

Reports_Mobile
    #--Lable --
    Unselect Frame
    Wait Until Element Is Visible    ${mobile_reports["menu"]}
    Click Element    ${mobile_reports["menu"]}    # Click Mobile
    Wait Until Element Is Visible    ${mobile_reports["mobile"]}    # Check 'Mobile Lable '
    #-- Report Mobile --
    Wait Until Element Is Visible    ${mobile_reports["button_add"]["add"]}
    Click Element    ${mobile_reports["button_add"]["add"]}    # Click Mobile
    Report_Mobile_Add    # Report Mobile Add

Reports_List_Growth
    #-- Growth Lable --
    Unselect Frame
    Wait Until Element Is Visible    ${list_growth_reports["menu"]}
    Click Element    ${list_growth_reports["menu"]}    # Click List Growth
    Wait Until Element Is Visible    ${list_growth_reports["list_growth"]}
    #-- Report List Growth --
    Wait Until Element Is Visible    ${list_growth_reports["button_add"]["add"]}
    Click Element    ${list_growth_reports["button_add"]["add"]}    # Click List Growth
    Report_List_Growth_Add    # Report List Growth Add

Folders
    #-- Folders --
    Unselect Frame
    Wait Until Element Is Visible    ${folders["menu"]}
    Click Element    ${folders["menu"]}    # Click: Folders
    Folders_Add    # Add folders

Workflow
    #-- Workflow --
    Unselect Frame
    Wait Until Element Is Visible    ${workflow["menu"]}
    Click Element    ${workflow["menu"]}
    Element Should Be Visible    ${workflow["workflow_management"]}    # Check: \ 'Workflow management' is visble
    Wait Until Element Is Visible    ${workflow["button_add"]["add"]}
    Click Element    ${workflow["button_add"]["add"]}    # Click: Workflow
    Workflow_Add    # Add workflow

Workflow_Model
    #-- Workflow model--
    Unselect Frame
    Wait Until Element Is Visible    ${workflow_model["menu"]}
    Click Element    ${workflow_model["menu"]}
    Wait Until Element Is Visible    ${workflow_model["button_add"]["add"]}
    Click Element    ${workflow_model["button_add"]["add"]}    # Click: Model
    Workflow_Model_Add    # Add workflow model

Approval
    #-- Approval--
    Unselect Frame
    Wait Until Element Is Visible    ${approval["menu"]}
    Click Element    ${approval["menu"]}
