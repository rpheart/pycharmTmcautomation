*** Settings ***
Documentation    contains smoke test keywords and oddly isn't in the utils dir

*** Keywords ***
Standard_Campaign_List
    #-- Standard Campaign List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${standard_campaign["button_list"]["standard_campaigns"]}    timeout=15
    Element Should Be Visible    ${standard_campaign["button_list"]["header_status"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_id"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_name"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_message"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_segment"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_created_by"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_date"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_pct"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_workflow"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_edit"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_favorites"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_copy"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_test"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_deliv_test"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_post"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_fast_post"]}
    Element Should Be Visible    ${standard_campaign["button_list"]["header_delete"]}
    Unselect Frame

MultiVariate_Add
    #-- MultiVariate Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    #-- Define Campaign and recipients
    Sleep    5
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["multivariate_tests"]}    timeout=25
    Click Element    ${multivariate_campaign["button_add"]["define_versions_and_samples"]}    # Remove navigation tags
    Element Should Be Visible    ${multivariate_campaign["button_add"]["define_campaign_and_recipients"]}
    Element Should Be Visible    ${multivariate_campaign["button_add"]["1_campaign_name_and_description"]}
    Element Should Be Visible    ${multivariate_campaign["button_add"]["campaign_name"]}
    Input Text    ${multivariate_campaign["button_add"]["name_input"]}    Test MultiVariate Name
    Element Should Be Visible    ${multivariate_campaign["button_add"]["campaign_description"]}
    Input Text    ${multivariate_campaign["button_add"]["description_input"]}    Test MultiVariate Description
    Element Should Be Visible    ${multivariate_campaign["button_add"]["2_select_message"]}
    Element Should Be Visible    ${multivariate_campaign["button_add"]["message"]}
    Click Element    ${multivariate_campaign["button_add"]["select_a_message"]}
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["qa_auto_test_message"]}    timeout=10
    Click Element    ${multivariate_campaign["button_add"]["qa_auto_test_message"]}
    Element Should Be Visible    ${multivariate_campaign["button_add"]["3_select_recipients"]}
    Element Should Be Visible    ${multivariate_campaign["button_add"]["segment"]}
    Click Element    ${multivariate_campaign["button_add"]["select_one_or_more_segments"]}
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["qa_auto_test_segment"]}    timeout=10
    Click Element    ${multivariate_campaign["button_add"]["qa_auto_test_segment"]}
    Click Element    ${multivariate_campaign["button_add"]["click_ok"]}
    Click Element    ${multivariate_campaign["button_add"]["continue_button"]}
    #-- Define versions and samples
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["1_select_the_variable_you_want_to_test"]}    timeout=20
    Element Should Be Visible    ${multivariate_campaign["button_add"]["define_versions_and_samples"]}
    Element Should Be Visible    ${multivariate_campaign["button_add"]["variable_subject"]}    # Variable Subject
    Element Should Be Visible    ${multivariate_campaign["button_add"]["variable_send_date_and_time"]}    # Variable Send Date & Time
    Element Should Be Visible    ${multivariate_campaign["button_add"]["variable_sender"]}    # Variable Sender
    Element Should Be Visible    ${multivariate_campaign["button_add"]["variable_dynamic_content"]}    #Variable \ Dynamic Content
    Element Should Be Visible    ${multivariate_campaign["button_add"]["variable_image"]}    # Variable Image
    Element Should Be Visible    ${multivariate_campaign["button_add"]["variable_message"]}    # Variable Message
    Element Should Be Visible    ${multivariate_campaign["button_add"]["2_define_test_versions_up_to_20"]}
    Element Should Be Visible    ${multivariate_campaign["button_add"]["sample_selection"]}
    Element Should Be Visible    ${multivariate_campaign["button_add"]["percent_segmentation_button"]}    # %
    Element Should Be Visible    ${multivariate_campaign["button_add"]["number_segmentation_button"]}    # Image
    Clear Element Text    ${multivariate_campaign["button_add"]["percent_input_verion_0"]}    # Input percent number version 0
    Input Text    ${multivariate_campaign["button_add"]["percent_input_verion_0"]}    10
    Clear Element Text    ${multivariate_campaign["button_add"]["percent_input_version_1"]}    # Input percent number version 1
    Input Text    ${multivariate_campaign["button_add"]["percent_input_version_1"]}    10
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["select_a_field"]}    timeout=5
    Click Element    ${multivariate_campaign["button_add"]["select_a_field"]}    # Select a field
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["select_email_select_a_field"]}    timeout=5
    Click Element    ${multivariate_campaign["button_add"]["select_email_select_a_field"]}    # Select 'EMAIL' from dropdown list in the 'Insert a field'
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["subject_input_version_1"]}    timeout=5
    Input Text    ${multivariate_campaign["button_add"]["subject_input_version_1"]}    Test Subject    # input text
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["label_add_version"]}    timeout=5    # Add version
    Click Element    ${multivariate_campaign["button_add"]["continue_button"]}    # Select: Continure: button
    #-- Send test and schedule winning campaign
    Wait Until Element Is Visible    ${multivariate_campaign["button_add"]["1_schedule_the_multivariate_test"]}    timeout=20
    Element Should Contain    ${multivariate_campaign["button_add"]["send_test_and_schedule_winning_campaign"]}    Send test and schedule winning campaign
    Element Should Be Visible    ${multivariate_campaign["button_add"]["send_now_redio_button"]}    # Send now: \ RedioButton
    Element Should Be Visible    ${multivariate_campaign["button_add"]["send_later_redio_button"]}    # Send later: \ \ RedioButton
    Element Should Contain    ${multivariate_campaign["button_add"]["2_select_success_key_indicator_and_schedule_the_winning_campaign"]}    2. Select success key indicator and schedule the winning campaign
    Element Should Be Visible    ${multivariate_campaign["button_add"]["key_indicator_dropdown"]}    # Key indicator: \ DropDown List
    Element Should Be Visible    ${multivariate_campaign["button_add"]["send_after"]}    # Send after: \ RedioButton
    Element Should Be Visible    ${multivariate_campaign["button_add"]["24_hours_input"]}    # 24 hour(s): \ DropDown List
    Element Should Be Visible    ${multivariate_campaign["button_add"]["opti_send_redio_button"]}    # OptiSEND: \ RedioButton
    Element Should Be Visible    ${multivariate_campaign["button_add"]["manual_redio_button"]}    # Manual: \ RedioButton
    Element Should Be Visible    ${multivariate_campaign["button_add"]["more_options"]}    # More options
    Element Should Be Visible    ${multivariate_campaign["button_add"]["back_button"]}    # Back: \ Button
    Element Should Be Visible    ${multivariate_campaign["button_add"]["schedule_button"]}    # Schedule: \ Button
    Unselect Frame

MultiVariate_List
    #-- MultiVariate List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${multivariate_campaign["button_list"]["multivariate_tests"]}    timeout=15
    Wait Until Element Is Visible    ${multivariate_campaign["button_list"]["campaign_name"]}    timeout=15
    Element Should Be Visible    ${multivariate_campaign["button_list"]["id"]}
    Element Should Be Visible    ${multivariate_campaign["button_list"]["status"]}
    Element Should Be Visible    ${multivariate_campaign["button_list"]["test_variable"]}
    Element Should Be Visible    ${multivariate_campaign["button_list"]["send_date"]}
    Unselect Frame

MultiMessage_Add
    #-- MultiMessage Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    #-- Define Campaign and recipients --
    Sleep    5
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["multi_messages"]}    timeout=35
    Click Element    ${multimessage_campaign["button_add"]["define_messages_and_partitions"]}    # Remove navigation tags
    Element Should Be Visible    ${multimessage_campaign["button_add"]["define_campaign_and_recipients"]}
    Element Should Be Visible    ${multimessage_campaign["button_add"]["campaign_name_and_description"]}
    Element Should Be Visible    ${multimessage_campaign["button_add"]["campaign_name"]}
    Input Text    ${multimessage_campaign["button_add"]["input_name"]}    Test MultiMessage name    # Input: name
    Input Text    ${multimessage_campaign["button_add"]["input_description"]}    Test MultiMessage description    # Input description
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["select_recipients"]}    timeout=5
    Element Should Be Visible    ${multimessage_campaign["button_add"]["segment"]}
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["select_one_or_more_segments"]}    timeout=5
    Click Element    ${multimessage_campaign["button_add"]["select_one_or_more_segments"]}    # Click: Select one or more segments
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["qa_auto_test_segment"]}    timeout=5
    Click Element    ${multimessage_campaign["button_add"]["qa_auto_test_segment"]}    # Select: first record from segment
    Click Element    ${multimessage_campaign["button_add"]["click_ok"]}    # Click: OK
    Click Element    ${multimessage_campaign["button_add"]["click_continue"]}    # Click: Continure
    #-- Define messages and partitions --
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["define_campaign_messages_up_to_20"]}    timeout=10    # Verify: Message display
    Element Should Be Visible    ${multimessage_campaign["button_add"]["define_messages_and_partitions"]}
    Click Element    ${multimessage_campaign["button_add"]["message_one"]}    # Click: Dublicate Content Block Test: Message 1
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["select_one_record_message_one"]}    timeout=5
    Click Element    ${multimessage_campaign["button_add"]["select_one_record_message_one"]}    # Select: one record: Message 1
    Click Element    ${multimessage_campaign["button_add"]["message_two"]}    # Click: Dublicate Content Block Test: Message 2
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["select_one_record_message_two"]}    timeout=5
    Click Element    ${multimessage_campaign["button_add"]["select_one_record_message_two"]}    # Select: one record: Message 2
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["add_message"]}    timeout=5    # Check: Add message
    Element Should Be Visible    ${multimessage_campaign["button_add"]["back_button"]}    # Check: Back button
    Element Should Be Visible    ${multimessage_campaign["button_add"]["preview_button"]}    # Check: Preview button
    Click Element    ${multimessage_campaign["button_add"]["continue_button"]}    # Click: Continue button
    #-- Schedule campaign --
    Wait Until Element Is Visible    ${multimessage_campaign["button_add"]["1_schedule_the_campaign"]}    timeout=5
    Element Should Be Visible    ${multimessage_campaign["button_add"]["schedule_campaign"]}
    Element Should Be Visible    ${multimessage_campaign["button_add"]["send_now_redio_button"]}    # Verify: Check Box: Send now
    Element Should Be Visible    ${multimessage_campaign["button_add"]["send_later_redio_button"]}    # Verify: Check Box: Send later
    Element Should Be Visible    ${multimessage_campaign["button_add"]["back_button"]}    # Verify: Back: Button
    Element Should Be Visible    ${multimessage_campaign["button_add"]["schedule_button"]}    # Verify: Schedule: Button
    Unselect Frame

MultiMessage_List
    #-- MultiMessage List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${multimessage_campaign["button_list"]["multi_messages"]}    timeout=15
    Wait Until Element Is Visible     ${multimessage_campaign["button_list"]["campaign_name"]}    timeout=15
    Element Should Be Visible    ${multimessage_campaign["button_list"]["id"]}
    Element Should Be Visible    ${multimessage_campaign["button_list"]["status"]}
    Element Should Be Visible    ${multimessage_campaign["button_list"]["send_date"]}
    Unselect Frame

Trigger_Campaign_List
    #-- Trigger Campaign List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${trigger_campaign["button_list"]["trigger_campaigns"]}    timeout=15
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_id"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_trigger_campaign_name"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_segment"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_manager"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_start_date"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_end_date"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_timezone"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_status"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_assign"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_stop_start"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_edit"]}
    Element Should Be Visible    ${trigger_campaign["button_list"]["header_delete"]}
    Unselect Frame

New_Message_Add
    #-- New Message Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    # Header \ buttons --
    Sleep    5
    Wait Until Element Is Visible    ${new_message_builder["button_add"]["drop_content_here"]}    timeout=35
    Click Element    ${new_message_builder["button_add"]["drop_content_here"]}    # Click: middle of page to close the drop down menue
    Element Should Be Visible    ${new_message_builder["button_add"]["general_settings"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["untitled"]}
    Click Element    ${new_message_builder["button_add"]["untitled"]}
    Wait Until Element Is Visible    ${new_message_builder["button_add"]["input_name"]}    timeout=15
    Element Should Be Visible    ${new_message_builder["button_add"]["add_a_row"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["add_content"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["change_style"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["links"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["tests"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["import"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["export"]}
    # Main page content --
    Wait Until Element Is Visible    ${new_message_builder["button_add"]["headers"]}    timeout=5
    Element Should Be Visible    ${new_message_builder["button_add"]["visual"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["plain_text"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["contents"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["layout"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["basic"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["content_blocks"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["text_icon"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["image_icon"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["text_image_icon"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["image_text_icon"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["share_icon"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["html_icon"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["spacer_icon"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["video_icon"]}
    Element Should Be Visible    ${new_message_builder["button_add"]["reco_icon"]}
    Unselect Frame

New_Message_List
    #-- New Message List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${new_message_builder["button_list"]["name"]}    timeout=25
    Wait Until Element Is Visible    ${new_message_builder["button_list"]["status"]}    timeout=25
    Element Should Be Visible    ${new_message_builder["button_list"]["mode"]}
    Element Should Be Visible    ${new_message_builder["button_list"]["created"]}
    Element Should Be Visible    ${new_message_builder["button_list"]["last_modified"]}
    Element Should Be Visible    ${new_message_builder["button_list"]["creator"]}
    Unselect Frame

Classic_Message_Add
    #-- Classic Message Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    #--Create Your Message Header Below --
    Sleep    5
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["expert_content"]}    timeout=15
    Click Element    ${classic_message_builder["button_add"]["expert_content"]}
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["accordion_icon"]}    timeout=5
    Click Element    ${classic_message_builder["button_add"]["accordion_icon"]}    # Header: Creeate Your Message Header Below
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["message_name_input"]}    timeout=5    # Click: Message Name
    Input Text    ${classic_message_builder["button_add"]["message_name_input"]}    Message Name
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["message_description_input"]}    timeout=5    # Click: \ Description
    Input Text    ${classic_message_builder["button_add"]["message_description_input"]}    Description
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["message_from_input"]}    timeout=5    # Click: From:
    Input Text    ${classic_message_builder["button_add"]["message_from_input"]}    qa.auto@smartfocus.com
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["from_member_columns"]}
    Click Element    ${classic_message_builder["button_add"]["from_member_columns"]}
    Click Element    ${classic_message_builder["button_add"]["from_member_columns_select_firstname"]}
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["message_to_input"]}    timeout=5    # Click: To:
    Input Text    ${classic_message_builder["button_add"]["message_to_input"]}    qa.test@smartfocus.com
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["to_member_columns"]}    timeout=5
    Click Element    ${classic_message_builder["button_add"]["to_member_columns"]}
    Click Element    ${classic_message_builder["button_add"]["to_member_columns_select_member_id"]}
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["message_subject_input"]}    timeout=5    # Click: Subject:
    Input Text    ${classic_message_builder["button_add"]["message_subject_input"]}    Subject
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["subject_member_columns"]}    timeout=5
    Click Element    ${classic_message_builder["button_add"]["subject_member_columns"]}
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["message_reply_to_email"]}    timeout=5    # Click: Reply To Email address:
    Input Text    ${classic_message_builder["button_add"]["message_reply_to_email"]}    qa.test@smartfocus.com
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["to_reply_to_email"]}    timeout=5
    Click Element    ${classic_message_builder["button_add"]["to_reply_to_email"]}
    Click Element    ${classic_message_builder["button_add"]["to_reply_to_email_select_email"]}
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["message_reply_to_input"]}    timeout=5    # Click: Reply To Lable
    Input Text    ${classic_message_builder["button_add"]["message_reply_to_input"]}    Reply To Label
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["to_reply_to_input"]}    timeout=5
    Click Element    ${classic_message_builder["button_add"]["to_reply_to_input"]}
    Click Element    ${classic_message_builder["button_add"]["to_reply_to_select_source"]}
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["message_encoding"]}    timeout=5
    Click Element    ${classic_message_builder["button_add"]["message_encoding"]}    #Click: \ Encoding
    Click Element    ${classic_message_builder["button_add"]["general_us_and_west_european"]}    # Select: General US
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["create_and_personalize"]}    timeout=5
    Click Element    ${classic_message_builder["button_add"]["create_and_personalize"]}    # Close Form
    Wait Until Element Is Visible    ${classic_message_builder["button_add"]["text_editor"]}    timeout=5    # Text Area
    Sleep    5
    #-- Verify / Body, Links & Personalization: Create and Personalize Your Message Body Below
    Element Should Be Visible    ${classic_message_builder["button_add"]["expert"]}    # Expert
    Element Should Be Visible    ${classic_message_builder["button_add"]["visual"]}    # Visual
    Element Should Be Visible    ${classic_message_builder["button_add"]["template"]}    # Template
    Element Should Be Visible    ${classic_message_builder["button_add"]["share_link"]}    # Share
    Element Should Be Visible    ${classic_message_builder["button_add"]["content_upload_link"]}    # Content Upload Link
    Element Should Be Visible    ${classic_message_builder["button_add"]["copy_html_to_text_link"]}    # Copy Html to Text
    Element Should Be Visible    ${classic_message_builder["button_add"]["insert_imate_link"]}    # Insert Image
    Element Should Be Visible    ${classic_message_builder["button_add"]["insert_dynamic_content_block_link"]}    # Insert Dynamic Content Block
    Element Should Be Visible    ${classic_message_builder["button_add"]["track_all_link"]}    # Track All Links
    Element Should Be Visible    ${classic_message_builder["button_add"]["link_management_link"]}    # Links Management
    Element Should Be Visible    ${classic_message_builder["button_add"]["external_content_link"]}    # External Content
    Element Should Be Visible    ${classic_message_builder["button_add"]["message_personalization_link"]}    # Message Personalization
    Element Should Be Visible    ${classic_message_builder["button_add"]["insert_emoji_link"]}    # Insert Emoji
    Element Should Be Visible    ${classic_message_builder["button_add"]["send_test_message_link"]}    # Send Test Message
    Element Should Be Visible    ${classic_message_builder["button_add"]["deliverability_test_link"]}    # Deliverability Test
    Element Should Be Visible    ${classic_message_builder["button_add"]["save_button"]}    # Save button
    Element Should Be Visible    ${classic_message_builder["button_add"]["save_and_view_the_result"]}    # Save and view the result
    Unselect Frame

Classic_Message_List
    #--Classic \ Message List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${classic_message_builder["button_list"]["messages"]}    timeout=15
    Wait Until Element Is Visible    ${classic_message_builder["button_list"]["header_id"]}    timeout=15
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_message_name"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_association_id"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_workflow"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_edit"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_favorites"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_copy"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_preview"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_test_message"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_audit_deliverability"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["header_delete"]}
    Element Should Be Visible    ${classic_message_builder["button_list"]["delete"]}
    Unselect Frame

SMS_Message_Add
    #-- \ SMS Message Add--
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    #-- Define Campaign and recipients --
    Sleep    5
    Wait Until Element Is Visible    ${sms_message_builder["button_add"]["qa_sms_message_name"]}    timeout=15
    Input Text    ${sms_message_builder["button_add"]["qa_sms_message_name"]}    Test SMS Message    # Check: Message Name
    Wait Until Element Is Visible    ${sms_message_builder["button_add"]["qa_sms_message_description"]}    timeout=5
    Input Text    ${sms_message_builder["button_add"]["qa_sms_message_description"]}    Test SMS Description    # Check: Description
    Wait Until Element Is Visible    ${sms_message_builder["button_add"]["qa_sms_message_form"]}    timeout=5
    Input Text    ${sms_message_builder["button_add"]["qa_sms_message_form"]}    qa.test    # Check: From:
    Wait Until Element Is Visible    ${sms_message_builder["button_add"]["text_content"]}    timeout=5
    Input Text    ${sms_message_builder["button_add"]["text_content"]}    Test Content area    # Check: SMS Body area
    Wait Until Element Is Visible    ${sms_message_builder["button_add"]["message_personalization_link"]}    timeout=5    # Check: Message Personalization
    Element Should Be Visible    ${sms_message_builder["button_add"]["message_preview_link"]}    # Check: Message Preview
    Element Should Be Visible    ${sms_message_builder["button_add"]["send_test_message_link"]}    # Check: Send Test Message
    Element Should Be Visible    ${sms_message_builder["button_add"]["back_button"]}    # Check: Back
    Element Should Be Visible    ${sms_message_builder["button_add"]["save_button"]}    # Check: Save
    Element Should Be Visible    ${sms_message_builder["button_add"]["save_and_go_to_sms_messages_button"]}    # Check: Save and go to SMS Messages
    Unselect Frame

SMS_Message_List
    #--SMS \ Message List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${sms_message_builder["button_list"]["sms"]}    timeout=15
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_id"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_message_name"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_created_by"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_association_id"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_workflow"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_edit"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_favorites"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_copy"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["header_delete"]}
    Element Should Be Visible    ${sms_message_builder["button_list"]["delete"]}
    Unselect Frame

Landing_Page_Add
    # Landing Page Add
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${landing_page["button_add"]["change_style"]}    timeout=15
    Click Element    ${landing_page["button_add"]["change_style"]}
    Wait Until Element Is Visible    ${landing_page["button_add"]["apply_to_entire_page"]}    timeout=25
    Element Should Be Visible    ${landing_page["button_add"]["overwrite_inline_styles"]}
    Element Should Be Visible    ${landing_page["button_add"]["page_style"]}
    Element Should Be Visible    ${landing_page["button_add"]["text_style"]}
    Element Should Be Visible    ${landing_page["button_add"]["form_style"]}
    Element Should Be Visible    ${landing_page["button_add"]["untitled"]}
    Element Should Be Visible    ${landing_page["button_add"]["undo"]}
    Element Should Be Visible    ${landing_page["button_add"]["add_a_row"]}
    Element Should Be Visible    ${landing_page["button_add"]["wisard_controls"]}
    Element Should Be Visible    ${landing_page["button_add"]["editor_wizard_text"]}
    Element Should Be Visible    ${landing_page["button_add"]["editor_wizard_image"]}
    Element Should Be Visible    ${landing_page["button_add"]["editor_qizard_smartengage"]}
    Element Should Be Visible    ${landing_page["button_add"]["editor_ wizard_shtml"]}
    Element Should Be Visible    ${landing_page["button_add"]["editor_qizard_form"]}
    Element Should Be Visible    ${landing_page["button_add"]["editor_subscriptionsuspension"]}
    Element Should Be Visible    ${landing_page["button_add"]["save"]}
    Unselect Frame

Landing_Page_List
    #--Landing Page List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${landing_page["button_list"]["my_pages"]}    timeout=15
    Element Should Be Visible    ${landing_page["button_list"]["header_id"]}
    Element Should Be Visible    ${landing_page["button_list"]["header_name"]}
    Element Should Be Visible    ${landing_page["button_list"]["header_last_modified"]}
    Element Should Be Visible    ${landing_page["button_list"]["header_status"]}
    Element Should Be Visible    ${landing_page["button_list"]["header_start_date"]}
    Element Should Be Visible    ${landing_page["button_list"]["header_stop_date"]}
    Unselect Frame

Content_Block_Add
    #-- Content Block Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until element Is Visible    ${content_block["button_add"]["name"]}    timeout=15
    Click Element    ${content_block["button_add"]["name"]}
    Input Text    ${content_block["button_add"]["name"]}    Content Block customer name
    Click Element    ${content_block["button_add"]["description"]}
    Input Text    ${content_block["button_add"]["description"]}    Content Block customer description
    Click Element    ${content_block["button_add"]["text_content"]}
    Input Text    ${content_block["button_add"]["text_content"]}    Content Block Text Area
    Wait Until Element Is Visible    ${content_block["button_add"]["content_upload"]}    timeout=5
    Element Should Be Visible    ${content_block["button_add"]["track_all_links"]}
    Element Should Be Visible    ${content_block["button_add"]["link_management"]}
    Element Should Be Visible    ${content_block["button_add"]["external_content"]}
    Element Should Be Visible    ${content_block["button_add"]["dynamic_content_block_personalization"]}
    Element Should Be Visible    ${content_block["button_add"]["dynamic_content_block_preview"]}
    Element Should Be Visible    ${content_block["button_add"]["save"]}
    Unselect Frame

Content_Block_List
    #--Content Block List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${content_block["button_list"]["dynamic_content_blocks"]}    timeout=25
    Element Should Be Visible    ${content_block["button_list"]["header_id"]}
    Element Should Be Visible    ${content_block["button_list"]["header_name"]}
    Element Should Be Visible    ${content_block["button_list"]["header_description"]}
    Element Should Be Visible    ${content_block["button_list"]["header_type"]}
    Element Should Be Visible    ${content_block["button_list"]["header_creation_date"]}
    Element Should Be Visible    ${content_block["button_list"]["header_modification_date"]}
    Element Should Be Visible    ${content_block["button_list"]["header_creator"]}
    Unselect Frame

Webform_Add
    #-- Webform Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    #--STEP 1: Settings --
    Sleep    5
    Wait Until Element Is Visible    ${webform["button_add"]["STEP_1_settings"]}    timeout=25
    Click Element    ${webform["button_add"]["customer_name"]}
    Input Text    ${webform["button_add"]["customer_name"]}    Test Webform    # Input: Customer Name
    Click Element    ${webform["button_add"]["customer_description"]}
    Input Text    ${webform["button_add"]["customer_description"]}    Test Description    # Input: Customer Description
    Click Element    ${webform["button_add"]["select_languages"]}
    Wait Until Element Is Visible    ${webform["button_add"]["language_option"]}    timeout=5
    Click Element    ${webform["button_add"]["language_option"]}    # Select: English
    Click Element    ${webform["button_add"]["select_date"]}
    Wait Until Element Is Visible    ${webform["button_add"]["today_date"]}    timeout=10
    Click Element    ${webform["button_add"]["today_date"]}
    Click Element    ${webform["button_add"]["confirm_url"]}
    Input Text    ${webform["button_add"]["confirm_url"]}    http://www.smartfocus.com
    Click Element    ${webform["button_add"]["error_url"]}
    Input Text    ${webform["button_add"]["error_url"]}    http://www.google.com
    Wait Until Element Is Visible    ${webform["button_add"]["next_step"]}    timeout=5
    Click Element    ${webform["button_add"]["next_step"]}    # Move to next step
    #--STEP 2: Fields --
    Wait Until Element Is Visible    ${webform["button_add"]["STEP_2_Fields"]}    timeout=10
    Wait Until Element Is Visible    ${webform["button_add"]["webform_type"]}    timeout=5
    Click Element    ${webform["button_add"]["webform_type"]}
    Click Element    ${webform["button_add"]["update_webform_option"]}
    Click Element    ${webform["button_add"]["field_name"]}
    Click Element    ${webform["button_add"]["display_name"]}
    Input Text    ${webform["button_add"]["display_name"]}    EMAIL
    Click Element    ${webform["button_add"]["input_type"]}
    Input Text    ${webform["button_add"]["default_value"]}    email@
    Click Element    ${webform["button_add"]["validation_type"]}
    Input Text    ${webform["button_add"]["text_length"]}    75
    Click Element    ${webform["button_add"]["next_step"]}
    #--STEP 3: Confirmation Email --
    Wait Until Element Is Visible    ${webform["button_add"]["STEP_3_confirmation_email"]}    timeout=10
    Wait Until Element Is Visible    ${webform["button_add"]["bounce_back_type"]}    timeout=10
    Click Element    ${webform["button_add"]["bounce_back_type"]}
    Element Should Be Visible    ${webform["button_add"]["service_email_address"]}
    Element Should Be Visible    ${webform["button_add"]["reply_to_email"]}
    Wait Until Element Is Visible    ${webform["button_add"]["save_webform"]}    timeout=10
    Element Should Be Visible    ${webform["button_add"]["previous_step"]}
    Unselect frame

Webform_List
    #--Webform List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${webform["button_list"]["webforms"]}    timeout=15
    Element Should Be Visible    ${webform["button_list"]["header_id"]}
    Element Should Be Visible    ${webform["button_list"]["header_webform_name"]}
    Element Should Be Visible    ${webform["button_list"]["header_webform_description"]}
    Element Should Be Visible    ${webform["button_list"]["header_webform_end_date"]}
    Element Should Be Visible    ${webform["button_list"]["header_manager"]}
    Element Should Be Visible    ${webform["button_list"]["header_status"]}
    Element Should Be Visible    ${webform["button_list"]["header_edit"]}
    Element Should Be Visible    ${webform["button_list"]["header_copy"]}
    Element Should Be Visible    ${webform["button_list"]["header_preview"]}
    Unselect Frame

Template_Add
    #-- Template Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until element Is Visible    ${template["button_add"]["customer_name"]}    timeout=15
    Click Element    ${template["button_add"]["customer_name"]}
    Input Text    ${template["button_add"]["customer_name"]}    Template Test
    Click Element    ${template["button_add"]["customer_description"]}
    Input Text    ${template["button_add"]["customer_description"]}    Template Description
    Choose File    ${template["button_add"]["upload_file"]}    C:\\CONTINUOUSTESTING\\templates\\Easter_Eggs.dwt
    Element Should Be Visible    ${template["button_add"]["import_file"]}
    Unselect Frame

Template_List
    #--Template List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${template["button_list"]["templates"]}    timeout=15
    Element Should Be Visible    ${template["button_list"]["display_options_link"]}
    Element Should Be Visible    ${template["button_list"]["header_template_id"]}
    Element Should Be Visible    ${template["button_list"]["header_name"]}
    Element Should Be Visible    ${template["button_list"]["header_description"]}
    Element Should Be Visible    ${template["button_list"]["header_view"]}
    Element Should Be Visible    ${template["button_list"]["header_create_message"]}
    Element Should Be Visible    ${template["button_list"]["header_export"]}
    Element Should Be Visible    ${template["button_list"]["header_replace"]}
    Element Should Be Visible    ${template["button_list"]["header_delete"]}
    Element Should Be Visible    ${template["button_list"]["delete"]}
    Unselect Frame

Transactional_Message_Add
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${transactional_message["button_add"]["radio_notification_classic"]}    timeout=15
    Element Should Be Visible    ${transactional_message["button_add"]["radio_notification_attachment"]}
    Click Element    ${transactional_message["button_add"]["name"]}
    Input Text    ${transactional_message["button_add"]["name"]}    Transactional Message Name
    Click Element    ${transactional_message["button_add"]["description"]}
    Input Text    ${transactional_message["button_add"]["description"]}    Transactional Message Description
    Click Element    ${transactional_message["button_add"]["message_from"]}
    Input Text    ${transactional_message["button_add"]["message_from"]}    QA Tester
    Click Element    ${transactional_message["button_add"]["message_to"]}
    Input Text    ${transactional_message["button_add"]["message_to"]}    Qa Auto
    Click Element    ${transactional_message["button_add"]["message_subject"]}
    Input Text    ${transactional_message["button_add"]["message_subject"]}    QA Testing only
    Click Element    ${transactional_message["button_add"]["message_reply_to_emails"]}
    Input Text    ${transactional_message["button_add"]["message_reply_to_emails"]}    qa.auto@smartfocus.com
    Click Element    ${transactional_message["button_add"]["message_reply_to"]}
    Input Text    ${transactional_message["button_add"]["message_reply_to"]}    qa.test@smartfocus.com
    Wait Until Element Is Visible    ${transactional_message["button_add"]["message_encoding"]}    timeout=5
    Element Should Be Visible    ${transactional_message["button_add"]["content_upload"]}
    Element Should Be Visible    ${transactional_message["button_add"]["copy_HTML_to_text"]}
    Element Should Be Visible    ${transactional_message["button_add"]["insert_dynamic_content_block"]}
    Element Should Be Visible    ${transactional_message["button_add"]["track_links"]}
    Element Should Be Visible    ${transactional_message["button_add"]["manage_links"]}
    Element Should Be Visible    ${transactional_message["button_add"]["personalize_content"]}
    Element Should Be Visible    ${transactional_message["button_add"]["preview"]}
    Element Should Be Visible    ${transactional_message["button_add"]["send_test"]}
    Element Should Be Visible    ${transactional_message["button_add"]["save"]}
    Element Should Be Visible    ${transactional_message["button_add"]["save_and_back"]}
    Click Element    ${transactional_message["button_add"]["text_content"]}
    Unselect Frame

Transactional_Message_List
    #--Transactional Message List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    # Check: Template Integration & Testing --
    Sleep    5
    Wait Until Element Is Visible    ${transactional_message["button_list"]["message"]}    timeout=15
    Element Should Be Visible    ${transactional_message["button_list"]["header_id"]}
    Click Element    ${transactional_message["button_list"]["header_delete"]}    # Click: Delete header to close the drop down menue
    Element Should Be Visible    ${transactional_message["button_list"]["header_integration_status"]}
    Element Should Be Visible    ${transactional_message["button_list"]["header_name"]}
    Element Should Be Visible    ${transactional_message["button_list"]["header_description"]}
    Element Should Be Visible    ${transactional_message["button_list"]["header_created_by"]}
    Element Should Be Visible    ${transactional_message["button_list"]["header_preview"]}
    Element Should Be Visible    ${transactional_message["button_list"]["header_edit"]}
    Element Should Be Visible    ${transactional_message["button_list"]["header_copy"]}
    Element Should Be Visible    ${transactional_message["button_list"]["header_delete"]}
    Element Should Be Visible    ${transactional_message["button_list"]["delete"]}
    # Check: Reports --
    Click Element    ${transactional_message["button_list"]["reports"]}
    # Dashboards --
    Wait Until Element Is Visible    ${transactional_message["button_list"]["dashbords"]}    timeout=10
    Element Should Be Visible    ${transactional_message["button_list"]["export_in_excel"]}
    # Date Range Report --
    Click Element    ${transactional_message["button_list"]["date_range_report"]}
    Wait Until Element Is Visible    ${transactional_message["button_list"]["notification_lable"]}    timeout=10
    Element Should Be Visible    ${transactional_message["button_list"]["select_message_id"]}
    Element Should Be Visible    ${transactional_message["button_list"]["begin_date_lable"]}
    Element Should Be Visible    ${transactional_message["button_list"]["begin_date_picker"]}
    Element Should Be Visible    ${transactional_message["button_list"]["end_date_lable"]}
    Element Should Be Visible    ${transactional_message["button_list"]["end_date_picker"]}
    Element Should Be Visible    ${transactional_message["button_list"]["range_form_ok_button"]}
    # Custom Search --
    Click Element    ${transactional_message["button_list"]["custom_search"]}
    Wait Until Element Is Visible    ${transactional_message["button_list"]["email_lable"]}    timeout=10
    Element Should Be Visible    ${transactional_message["button_list"]["email_input"]}
    Element Should Be Visible    ${transactional_message["button_list"]["custom_form_ok_button"]}
    Unselect Frame

Transactional_Content_Block_Add
    #-- Transactional Content Block Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${transactional_content_block["button_add"]["customer_name"]}    timeout=15
    Click Element    ${transactional_content_block["button_add"]["customer_name"]}
    Input Text    ${transactional_content_block["button_add"]["customer_name"]}    Content Block customer name
    Click Element    ${transactional_content_block["button_add"]["customer_description"]}
    Input Text    ${transactional_content_block["button_add"]["customer_description"]}    Content Block customer description
    Click Element    ${content_block["button_add"]["text_content"]}
    Input Text    ${transactional_content_block["button_add"]["text_content"]}    Content Block Text Area
    Wait Until Element Is Visible    ${transactional_content_block["button_add"]["content_upload"]}    timeout=5
    Element Should Be Visible    ${transactional_content_block["button_add"]["track_all_links"]}
    Element Should Be Visible    ${transactional_content_block["button_add"]["link_management"]}
    Element Should Be Visible    ${transactional_content_block["button_add"]["message_personalization"]}
    Element Should Be Visible    ${transactional_content_block["button_add"]["message_preview"]}
    Element Should Be Visible    ${transactional_content_block["button_add"]["save"]}
    Unselect Frame

Transactional_Content_Block_List
    #--Transactional Content Block List --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${transactional_content_block["button_list"]["dynamic_content_blocks"]}    timeout=15
    Element Should Be Visible    ${transactional_content_block["button_list"]["header_id"]}
    Element Should Be Visible    ${transactional_content_block["button_list"]["header_name"]}
    Element Should Be Visible    ${transactional_content_block["button_list"]["header_description"]}
    Element Should Be Visible    ${transactional_content_block["button_list"]["header_created_by"]}
    Element Should Be Visible    ${transactional_content_block["button_list"]["header_preview"]}
    Element Should Be Visible    ${transactional_content_block["button_list"]["header_edit"]}
    Element Should Be Visible    ${transactional_content_block["button_list"]["header_copy"]}
    Element Should Be Visible    ${transactional_content_block["button_list"]["header_delete"]}
    Element Should Be Visible    ${transactional_content_block["button_list"]["delete"]}
    Unselect Frame

Add_Subscriber_Add
    #--Add Subscriber Add--
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${add_subscriber["button_add"]["search_button"]}    timeout=15
    Wait Until Page Contains    Edit Member Details    timeout=5
    Element Should Be Visible    ${add_subscriber["button_add"]["header_database_field"]}
    Element Should Be Visible    ${add_subscriber["button_add"]["header_database_type"]}
    Element Should Be Visible    ${add_subscriber["button_add"]["header_database_value"]}
    Element Should Be Visible    ${add_subscriber["button_add"]["header_database_stats"]}
    Wait Until Element Is Visible    ${add_subscriber["button_add"]["save_member"]}    timeout=10
    Element Should Be Visible    ${add_subscriber["button_add"]["reset"]}
    Element Should Be Visible    ${add_subscriber["button_add"]["cancel"]}
    Unselect Frame

Search_Subscriber_Add
    #--Search Subscriber Add--
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    # hearders
    Sleep    5
    Wait Until Element Is Visible    ${search_subscriber["button_add"]["search_button"]}    timeout=20
    Element Should Be Visible    ${search_subscriber["button_add"]["header_database_field"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["header_select_operator"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["header_value"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["header_add"]}
    # first search row
    Element Should Be Visible    ${search_subscriber["button_add"]["select_text_field"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["text_field_operator"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["text_field_value"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["add_text"]}
    # second search row
    Element Should Be Visible    ${search_subscriber["button_add"]["select_number_field"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["number_field_operator"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["number_field_value"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["add_numeric"]}
    # third search row
    Element Should Be Visible    ${search_subscriber["button_add"]["date_field_operator"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["date_picker"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["add_date"]}
    # fourth search row
    Element Should Be Visible    ${search_subscriber["button_add"]["segmentation_operator"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["segmentation_index"]}
    Element Should Be Visible    ${search_subscriber["button_add"]["add_segmentation"]}
    Unselect Frame

Import_Subscriber_Add
    #--Import Subscriber Add--
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${import_subscriber["button_add"]["imports_button"]}    timeout=15
    Element Should Be Visible    ${import_subscriber["button_add"]["import_button"]}
    Element Should Be Visible    ${import_subscriber["button_add"]["header_id"]}
    Element Should Be Visible    ${import_subscriber["button_add"]["header_filename"]}
    Element Should Be Visible    ${import_subscriber["button_add"]["header_import_date"]}
    Element Should Be Visible    ${import_subscriber["button_add"]["header_create_date"]}
    Element Should Be Visible    ${import_subscriber["button_add"]["header_original_filename"]}
    Element Should Be Visible    ${import_subscriber["button_add"]["header_size_b"]}
    Element Should Be Visible    ${import_subscriber["button_add"]["header_status"]}
    Element Should Be Visible    ${import_subscriber["button_add"]["header_del"]}
    Unselect Frame

Import_Subscriber_List
    #--Import Subscriber List--
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${import_subscriber["button_list"]["imports_button"]}    timeout=15
    Element Should Be Visible    ${import_subscriber["button_list"]["header_status"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_id"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_original_filename"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_created_by"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_import_date"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_size_b"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_step"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_lines"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_val_errors"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_imp_errors"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_log"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_nb_insert"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_job_begin"]}
    Element Should Be Visible    ${import_subscriber["button_list"]["header_job_end"]}
    Unselect Frame

Export_Subscriber_Add
    #--Export Subscriber Add--
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${export_subscriber["button_add"]["exports"]}    timeout=15
    Element Should BE Visible    ${export_subscriber["button_add"]["email_view"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["sms_view"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["select_a_campaign_and_action"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["selected"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["sent"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["received_and_not_opened"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["opend"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["clicked"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["clicked_with_url_details"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["post_click_tracking"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["filtered"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["unjoin"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["hard_bounced"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["soft_bounced"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["hard_and_soft_bounced"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["conplaints"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["submit_campaign_form"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["select_a_segment_and_status"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["active_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["quarantined_or_unjoin_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["quarantined_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["unjoin_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["sms_active_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["sms_quarantined_or_sms_unjoin_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["sms_quarantined_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["sms_unjoin_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["all_members"]}
    Element Should BE Visible    ${export_subscriber["button_add"]["submit_segment_form"]}
    Unselect Frame

Export_Subscriber_List
    #--Export Subscriber List--
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${export_subscriber["button_list"]["exports"]}    timeout=15
    Element Should Be Visible    ${export_subscriber["button_list"]["header_status"]}
    Element Should Be Visible    ${export_subscriber["button_list"]["header_id"]}
    Element Should Be Visible    ${export_subscriber["button_list"]["header_original_exported"]}
    Element Should Be Visible    ${export_subscriber["button_list"]["header_created_by"]}
    Element Should Be Visible    ${export_subscriber["button_list"]["header_job_type"]}
    Element Should Be Visible    ${export_subscriber["button_list"]["header_nb_members"]}
    Element Should Be Visible    ${export_subscriber["button_list"]["header_scheduled_time"]}
    Element Should Be Visible    ${export_subscriber["button_list"]["header_start_time"]}
    Element Should Be Visible    ${export_subscriber["button_list"]["header_process_time"]}
    Unselect Frame

Image_Library_Add
    # Image Library Add
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${image_library["button_add"]["image_library"]}    timeout=15
    Wait Until Element Is Visible    ${image_library["button_add"]["create_new_folder"]}    timeout=15
    Element Should Be Visible    ${image_library["button_add"]["select_all"]}
    Element Should Be Visible    ${image_library["button_add"]["storage"]}
    # -- Check Add page--
    Click Element    ${image_library["button_add"]["add_button"]}
    Wait Until Element Is Visible    ${image_library["button_add"]["image_library_iframe"]}    timeout=10
    Select Frame    ${image_library["button_add"]["image_library_iframe"]}
    Element Should Be Visible    ${image_library["button_add"]["browse_button"]}
    Element Should Be Visible    ${image_library["button_add"]["start_upload_button"]}
    Unselect Frame

Report_Mobile_Add
    # Report Mobile Add
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${mobile_reports["button_add"]["sms_reports"]}    timeout=25
    Element Should Be Visible    ${mobile_reports["button_add"]["header_id"]}
    Element Should Be Visible    ${mobile_reports["button_add"]["header_campaign_name"]}
    Element Should Be Visible    ${mobile_reports["button_add"]["header_status"]}
    Element Should Be Visible    ${mobile_reports["button_add"]["header_send_date"]}
    Element Should Be Visible    ${mobile_reports["button_add"]["header_selected"]}
    Element Should Be Visible    ${mobile_reports["button_add"]["header_sent"]}
    Element Should Be Visible    ${mobile_reports["button_add"]["header_delivered"]}
    Element Should Be Visible    ${mobile_reports["button_add"]["header_undelivered"]}
    Element Should Be Visible    ${mobile_reports["button_add"]["header_stops"]}
    Unselect Frame

Report_List_Growth_Add
    # Report Mobile Add
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${list_growth_reports["button_add"]["reports"]}    timeout=25
    Element Should Be Visible    ${list_growth_reports["button_add"]["header_report_name"]}
    Element Should Be Visible    ${list_growth_reports["button_add"]["header_id"]}
    Element Should Be Visible    ${list_growth_reports["button_add"]["header_status"]}
    Element Should Be Visible    ${list_growth_reports["button_add"]["header_creation_date"]}
    Element Should Be Visible    ${list_growth_reports["button_add"]["header_created_by"]}
    Unselect Frame

Folders_Add
    # Folders \ Add
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${folders["button_add"]["folders"]}    timeout=30
    Wait Until Element Is Visible    ${folders["button_add"]["save"]}    timeout=15
    Click Element    ${folders["button_add"]["new_directory_name"]}
    Input Text    ${folders["button_add"]["new_directory_name"]}    Folder new directory
    Click Element    ${folders["button_add"]["new_derectory_description"]}
    Input Text    ${folders["button_add"]["new_derectory_description"]}    Folder directory description
    Wait Until Element Is Visible    ${folders["button_add"]["header_delete"]}    timeout=5
    Element Should Be Visible    ${folders["button_add"]["header_name"]}
    Element Should Be Visible    ${folders["button_add"]["header_description"]}
    Element Should Be Visible    ${folders["button_add"]["header_content_summary"]}
    Element Should Be Visible    ${folders["button_add"]["delete"]}
    Unselect Frame

Workflow_Add
    #--Workflow Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${workflow["button_add"]["workflows"]}    timeout=15
    Element Should Be Visible    ${workflow["button_add"]["header_name"]}
    Element Should Be Visible    ${workflow["button_add"]["header_description"]}
    Element Should Be Visible    ${workflow["button_add"]["header_status"]}
    Element Should Be Visible    ${workflow["button_add"]["header_creation"]}
    Element Should Be Visible    ${workflow["button_add"]["header_update"]}
    Element Should Be Visible    ${workflow["button_add"]["header_edit"]}
    Element Should Be Visible    ${workflow["button_add"]["header_delete"]}
    Element Should Be Visible    ${workflow["button_add"]["delete"]}
    Unselect Frame

Workflow_Model_Add
    #--Workflow Model Add --
    Wait Until element Is Visible    ${iframes["top"]}    timeout=50
    Select frame    ${iframes["top"]}    #Click on main frame
    Wait Until element Is Visible    ${iframes["ccmd"]}    timeout=15
    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    Sleep    5
    Wait Until Element Is Visible    ${workflow_model["button_add"]["models"]}    timeout=15
    Element Should Be Visible    ${workflow_model["button_add"]["header_model_name"]}
    Element Should Be Visible    ${workflow_model["button_add"]["header_model_description"]}
    Element Should Be Visible    ${workflow_model["button_add"]["header_created"]}
    Element Should Be Visible    ${workflow_model["button_add"]["header_view"]}
    Element Should Be Visible    ${workflow_model["button_add"]["header_delete"]}
    Element Should Be Visible    ${workflow_model["button_add"]["delete"]}
    Unselect Frame
