*** Settings ***
Documentation   runs to each page in email and checks for the presence of all of the elements
Default Tags    ui  email  smoke
Resource        ../Utils/email_keywords.robot
Suite Setup     run keywords
...             login
...             AND  go to ${system_page["email"]}
Suite Teardown  close all browsers

*** Test Cases ***
calendar
  go to ${calendar["menu"]}

send_standard_campaign
  open content  ${standard_campaign}  ${standard_campaign["button_add"]["add"]}
  open content  ${standard_campaign}  ${standard_campaign["button_list"]["list"]}
  standard campaign list

send_multivariate_campaign
  open content  ${multivariate_campaign}  ${multivariate_campaign["button_add"]["add"]}
  multivariate add
  open content  ${multivariate_campaign}  ${multivariate_campaign["button_list"]["list"]}
  multivariate list

send_multimessage_campaign
  open content  ${multimessage_campaign}  ${multimessage_campaign["button_add"]["add"]}
  multimessage add
  open content  ${multimessage_campaign}  ${multimessage_campaign["button_list"]["list"]}
  multimessage list

send_trigger_campaign
  open content  ${trigger_campaign}  ${trigger_campaign["button_add"]["add"]}
  open content  ${trigger_campaign}  ${trigger_campaign["button_list"]["list"]}
  trigger campaign list

create_new_message_builder
  open content  ${new_message_builder}  ${new_message_builder["button_add"]["add"]}
  new message add
  open content  ${new_message_builder}  ${new_message_builder["button_list"]["list"]}
  new message list

create_classic_message
  open content  ${classic_message_builder}  ${classic_message_builder["button_add"]["add"]}
  classic message add
  open content  ${classic_message_builder}  ${classic_message_builder["button_list"]["list"]}
  classic message list

create_sms_message
  open content  ${sms_message_builder}  ${sms_message_builder["button_add"]["add"]}
  sms message add
  open content  ${sms_message_builder}  ${sms_message_builder["button_list"]["list"]}
  sms message list

create_landing_page
  open content  ${landing_page}  ${landing_page["button_add"]["add"]}
  landing page add
  open content  ${landing_page}  ${landing_page["button_list"]["list"]}
  landing page list

create_content_block
  open content  ${content_block}  ${content_block["button_add"]["add"]}
  content block add
  open content  ${content_block}  ${content_block["button_list"]["list"]}
  content block list

create_webform
  open content  ${webform}  ${webform["button_add"]["add"]}
  webform add
  open content  ${webform}  ${webform["button_list"]["list"]}
  webform list

create_template
  open content  ${template}  ${template["button_add"]["add"]}
  template add
  open content  ${template}  ${template["button_list"]["list"]}
  template list

create_transactional_message
  open content  ${transactional_message}  ${transactional_message["button_add"]["add"]}
  transactional message add
  open content  ${transactional_message}  ${transactional_message["button_list"]["list"]}
  transactional message list

create_transactional_content_block
  open content  ${transactional_content_block}  ${transactional_content_block["button_add"]["add"]}
  transactional content block add
  open content  ${transactional_content_block}  ${transactional_content_block["button_list"]["list"]}
  transactional content block list

list_management_segments
  open content  ${segments}  ${segments["button_add"]["add"]}
  open content  ${segments}  ${segments["button_list"]["list"]}

list_management_add_subscriber
  open content  ${add_subscriber}  ${add_subscriber["button_add"]["add"]}
  add subscriber

list_management_search_subscriber
  open content  ${search_subscriber}  ${search_subscriber["button_add"]["add"]}
  search subscriber

list_management_import_subscriber
  open content  ${import_subscriber}  ${import_subscriber["button_add"]["add"]}
  import subscriber add
  open content  ${import_subscriber}  ${import_subscriber["button_list"]["list"]}
  import subscriber list

list_management_export_subscriber
  open content  ${export_subscriber}  ${export_subscriber["button_add"]["add"]}
  export subscriber add
  open content  ${export_subscriber}  ${export_subscriber["button_list"]["list"]}
  export subscriber list

image_library
  go to ${image_library["menu"]}
  image library add

deliverability
  go to ${deliverability["menu"]}

reports_email
  open content  ${email_reports}  ${email_reports["button_add"]["add"]}

reports_multivariate
  open content  ${multivariate_reports}  ${multivariate_reports["button_add"]["add"]}

reports_multiMessage
  open content  ${multimessage_reports}  ${multimessage_reports["button_add"]["add"]}

reports_test
  open content  ${test_reports}  ${test_reports["button_add"]["add"]}

reports_transactional
  open content  ${transactional_reports}  ${transactional_reports["button_add"]["add"]}
  transactional reports add

reports_trigger
  open content  ${trigger_reports}  ${trigger_reports["button_add"]["add"]}

reports_landing_page
  open content  ${landing_page_reports}  ${landing_page_reports["button_add"]["add"]}
  landing page list

reports_mobile
  open content  ${mobile_reports}  ${mobile_reports["button_add"]["add"]}
  mobile reports add

reports_list_growth
  open content  ${list_growth_reports}  ${list_growth_reports["button_add"]["add"]}
  list growth reports list
  click element  ${generics["create_new"]}
  element should be visible  ${list_growth_reports["button_add"]["create_new"]["report_name"]}
  element should be visible  ${list_growth_reports["button_add"]["create_new"]["create_report"]}

folders
  go to ${folders["menu"]}
  folders add

workflow
  open content  ${workflow}  ${workflow["button_add"]["add"]}
  workflow add

workflow_model
  open content  ${workflow_model}  ${workflow_model["button_add"]["add"]}
  workflow model add

approval
  go to ${approval["menu"]}

*** Keywords ***
standard campaign list
  element should be visible  ${standard_campaign["button_list"]["header_status"]}
  element should be visible  ${standard_campaign["button_list"]["header_id"]}
  element should be visible  ${standard_campaign["button_list"]["header_name"]}
  element should be visible  ${standard_campaign["button_list"]["header_message"]}
  element should be visible  ${standard_campaign["button_list"]["header_segment"]}
  element should be visible  ${standard_campaign["button_list"]["header_created_by"]}
  element should be visible  ${standard_campaign["button_list"]["header_date"]}
  element should be visible  ${standard_campaign["button_list"]["header_pct"]}
  element should be visible  ${standard_campaign["button_list"]["header_workflow"]}
  element should be visible  ${standard_campaign["button_list"]["header_edit"]}
  element should be visible  ${standard_campaign["button_list"]["header_favorites"]}
  element should be visible  ${standard_campaign["button_list"]["header_copy"]}
  element should be visible  ${standard_campaign["button_list"]["header_test"]}
  element should be visible  ${standard_campaign["button_list"]["header_deliv_test"]}
  element should be visible  ${standard_campaign["button_list"]["header_post"]}
  element should be visible  ${standard_campaign["button_list"]["header_fast_post"]}
  element should be visible  ${standard_campaign["button_list"]["header_delete"]}

multivariate add
  # define campaign and recipients
  element should be visible  ${multivariate_campaign["button_add"]["define_campaign_and_recipients"]}
  element should be visible  ${multivariate_campaign["button_add"]["1_campaign_name_and_description"]}
  element should be visible  ${multivariate_campaign["button_add"]["campaign_name"]}
  input text  ${multivariate_campaign["button_add"]["name_input"]}  MultiVariate Auto Test
  element should be visible  ${multivariate_campaign["button_add"]["campaign_description"]}
  input text  ${multivariate_campaign["button_add"]["description_input"]}  Auto Generated
  element should be visible  ${multivariate_campaign["button_add"]["2_select_message"]}
  element should be visible  ${multivariate_campaign["button_add"]["message"]}
  click element  ${multivariate_campaign["button_add"]["select_a_message"]}
  click element  ${multivariate_campaign["button_add"]["first_message"]}
  element should be visible  ${multivariate_campaign["button_add"]["3_select_recipients"]}
  element should be visible  ${multivariate_campaign["button_add"]["segment"]}
  click element  ${multivariate_campaign["button_add"]["select_one_or_more_segments"]}
  click element  ${multivariate_campaign["button_add"]["segment_favourites"]}
  click element  ${multivariate_campaign["button_add"]["qa_team_segment"]}
  click element  ${multivariate_campaign["button_add"]["ok_button"]}
  click element  ${multivariate_campaign["button_add"]["continue_button"]}
  # define versions and samples
  element should be visible  ${multivariate_campaign["button_add"]["1_select_the_variable_you_want_to_test"]}
  element should be visible  ${multivariate_campaign["button_add"]["define_versions_and_samples"]}
  element should be visible  ${multivariate_campaign["button_add"]["variable_subject"]}
  element should be visible  ${multivariate_campaign["button_add"]["variable_send_date_and_time"]}
  element should be visible  ${multivariate_campaign["button_add"]["variable_sender"]}
  element should be visible  ${multivariate_campaign["button_add"]["variable_dynamic_content"]}
  element should be visible  ${multivariate_campaign["button_add"]["variable_image"]}
  element should be visible  ${multivariate_campaign["button_add"]["variable_message"]}
  element should be visible  ${multivariate_campaign["button_add"]["2_define_test_versions_up_to_20"]}
  element should be visible  ${multivariate_campaign["button_add"]["sample_selection"]}
  element should be visible  ${multivariate_campaign["button_add"]["percent_segmentation_button"]}
  element should be visible  ${multivariate_campaign["button_add"]["number_segmentation_button"]}
  input text  ${multivariate_campaign["button_add"]["version_2_input"]}  [EMV FIELD]EMAIL[EMV /FIELD]
  element should be visible  ${multivariate_campaign["button_add"]["label_add_version"]}
  click element  ${multivariate_campaign["button_add"]["continue_button"]}
  # send test and schedule winning campaign
  element should be visible  ${multivariate_campaign["button_add"]["1_schedule_the_multivariate_test"]}
  element should contain  ${multivariate_campaign["button_add"]["send_test_and_schedule_winning_campaign"]}  Send test and schedule winning campaign
  element should be visible  ${multivariate_campaign["button_add"]["send_now_redio_button"]}
  element should be visible  ${multivariate_campaign["button_add"]["send_later_redio_button"]}
  element should contain  ${multivariate_campaign["button_add"]["2_select_success_key_indicator_and_schedule_the_winning_campaign"]}  2. Select success key indicator and schedule the winning campaign
  element should be visible  ${multivariate_campaign["button_add"]["key_indicator_dropdown"]}
  element should be visible  ${multivariate_campaign["button_add"]["send_after"]}
  element should be visible  ${multivariate_campaign["button_add"]["24_hours_input"]}
  element should be visible  ${multivariate_campaign["button_add"]["opti_send_redio_button"]}
  element should be visible  ${multivariate_campaign["button_add"]["manual_radio_button"]}
  element should be visible  ${multivariate_campaign["button_add"]["more_options"]}
  element should be visible  ${multivariate_campaign["button_add"]["back_button"]}
  element should be visible  ${multivariate_campaign["button_add"]["schedule_button"]}

multivariate list
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multivariate_campaign["button_list"]["multivariate_tests"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multivariate_campaign["button_list"]["campaign_name"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multivariate_campaign["button_list"]["id"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multivariate_campaign["button_list"]["status"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multivariate_campaign["button_list"]["test_variable"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multivariate_campaign["button_list"]["send_date"]}

multimessage add
  # define Campaign and recipients
  element should be visible  ${multimessage_campaign["button_add"]["define_campaign_and_recipients"]}
  element should be visible  ${multimessage_campaign["button_add"]["campaign_name_and_description"]}
  element should be visible  ${multimessage_campaign["button_add"]["campaign_name"]}
  input text  ${multimessage_campaign["button_add"]["input_name"]}  MultiMessage Auto Campaign
  input text  ${multimessage_campaign["button_add"]["input_description"]}  auto generated
  click element  ${multimessage_campaign["button_add"]["select_one_or_more_segments"]}
  click element  ${multimessage_campaign["button_add"]["segment_favourites"]}
  click element  ${multimessage_campaign["button_add"]["qa_team_segment"]}
  click element  ${multimessage_campaign["button_add"]["ok_button"]}
  click element  ${multimessage_campaign["button_add"]["continue_button"]}
  # define messages and partitions
  element should be visible  ${multimessage_campaign["button_add"]["define_campaign_messages_up_to_20"]}
  element should be visible  ${multimessage_campaign["button_add"]["define_messages_and_partitions"]}
  click element  ${multimessage_campaign["button_add"]["message_one_list"]}
  click element  ${multimessage_campaign["button_add"]["message_one_first_message"]}
  click element  ${multimessage_campaign["button_add"]["message_two_list"]}
  click element  ${multimessage_campaign["button_add"]["message_two_first_message"]}
  element should be visible  ${multimessage_campaign["button_add"]["back_button"]}
  element should be visible  ${multimessage_campaign["button_add"]["preview_button"]}
  click element  ${multimessage_campaign["button_add"]["continue_button"]}
  # schedule campaign
  element should be visible  ${multimessage_campaign["button_add"]["1_schedule_the_campaign"]}
  element should be visible  ${multimessage_campaign["button_add"]["schedule_campaign"]}
  element should be visible  ${multimessage_campaign["button_add"]["send_now_radio_button"]}
  element should be visible  ${multimessage_campaign["button_add"]["send_later_radio_button"]}
  element should be visible  ${multimessage_campaign["button_add"]["back_button"]}
  element should be visible  ${multimessage_campaign["button_add"]["schedule_button"]}

multimessage list
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multimessage_campaign["button_list"]["multi_messages"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multimessage_campaign["button_list"]["campaign_name"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multimessage_campaign["button_list"]["id"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multimessage_campaign["button_list"]["status"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  ${multimessage_campaign["button_list"]["send_date"]}

trigger campaign list
  element should be visible  ${trigger_campaign["button_list"]["header_id"]}
  element should be visible  ${trigger_campaign["button_list"]["header_trigger_campaign_name"]}
  element should be visible  ${trigger_campaign["button_list"]["header_segment"]}
  element should be visible  ${trigger_campaign["button_list"]["header_manager"]}
  element should be visible  ${trigger_campaign["button_list"]["header_start_date"]}
  element should be visible  ${trigger_campaign["button_list"]["header_end_date"]}
  element should be visible  ${trigger_campaign["button_list"]["header_timezone"]}
  element should be visible  ${trigger_campaign["button_list"]["header_status"]}
  element should be visible  ${trigger_campaign["button_list"]["header_assign"]}
  element should be visible  ${trigger_campaign["button_list"]["header_stop_start"]}
  element should be visible  ${trigger_campaign["button_list"]["header_edit"]}
  element should be visible  ${trigger_campaign["button_list"]["header_delete"]}

new message add
  element should be visible  ${new_message_builder["button_add"]["general_settings"]}
  element should be visible  ${new_message_builder["button_add"]["untitled"]}
  click element  ${new_message_builder["button_add"]["untitled"]}
  wait until element is visible  ${new_message_builder["button_add"]["input_name"]}
  element should be visible  ${new_message_builder["button_add"]["add_a_row"]}
  element should be visible  ${new_message_builder["button_add"]["add_content"]}
  element should be visible  ${new_message_builder["button_add"]["change_style"]}
  element should be visible  ${new_message_builder["button_add"]["links"]}
  element should be visible  ${new_message_builder["button_add"]["tests"]}
  element should be visible  ${new_message_builder["button_add"]["import"]}
  element should be visible  ${new_message_builder["button_add"]["export"]}
  element should be visible  ${new_message_builder["button_add"]["headers"]}
  element should be visible  ${new_message_builder["button_add"]["visual"]}
  element should be visible  ${new_message_builder["button_add"]["plain_text"]}
  element should be visible  ${new_message_builder["button_add"]["contents_panel"]}
  element should be visible  ${new_message_builder["button_add"]["layout"]}
  element should be visible  ${new_message_builder["button_add"]["basic"]}
  element should be visible  ${new_message_builder["button_add"]["content_blocks"]}
  element should be visible  ${new_message_builder["button_add"]["text_widget"]}
  element should be visible  ${new_message_builder["button_add"]["image_widget"]}
  element should be visible  ${new_message_builder["button_add"]["text_image_widget"]}
  element should be visible  ${new_message_builder["button_add"]["image_text_widget"]}
  element should be visible  ${new_message_builder["button_add"]["share_widget"]}
  element should be visible  ${new_message_builder["button_add"]["html_widget"]}
  element should be visible  ${new_message_builder["button_add"]["spacer_widget"]}
  element should be visible  ${new_message_builder["button_add"]["video_widget"]}
  element should be visible  ${new_message_builder["button_add"]["smart_personalisation_widget"]}

new message list
  element should be visible  ${new_message_builder["button_list"]["name"]}
  element should be visible  ${new_message_builder["button_list"]["status"]}
  element should be visible  ${new_message_builder["button_list"]["mode"]}
  element should be visible  ${new_message_builder["button_list"]["created"]}
  element should be visible  ${new_message_builder["button_list"]["last_modified"]}
  element should be visible  ${new_message_builder["button_list"]["creator"]}

classic message add
  # Header: Create Your Message Header Below
  click element  ${classic_message_builder["button_add"]["header_accordion"]}
  element should be visible  ${classic_message_builder["button_add"]["message_name_input"]}
  element should be visible  ${classic_message_builder["button_add"]["message_description_input"]}
  element should be visible  ${classic_message_builder["button_add"]["message_from_input"]}
  element should be visible  ${classic_message_builder["button_add"]["message_from_selector"]}
  element should be visible  ${classic_message_builder["button_add"]["message_to_input"]}
  element should be visible  ${classic_message_builder["button_add"]["message_to_selector"]}
  element should be visible  ${classic_message_builder["button_add"]["message_subject_input"]}
  element should be visible  ${classic_message_builder["button_add"]["message_subject_selector"]}
  element should be visible  ${classic_message_builder["button_add"]["message_reply_to_email_input"]}
  element should be visible  ${classic_message_builder["button_add"]["message_reply_to_email_selector"]}
  element should be visible  ${classic_message_builder["button_add"]["message_reply_to_label_input"]}
  element should be visible  ${classic_message_builder["button_add"]["message_reply_to_label_selector"]}
  element should be visible  ${classic_message_builder["button_add"]["message_encoding"]}
  # Body, Links & Personalization: Create and Personalize Your Message Body Below
  click element  ${classic_message_builder["button_add"]["body_accordion"]}
  element should be visible  ${classic_message_builder["button_add"]["expert"]}
  element should be visible  ${classic_message_builder["button_add"]["visual"]}
  element should be visible  ${classic_message_builder["button_add"]["template"]}
  element should be visible  ${classic_message_builder["button_add"]["share_link"]}
  element should be visible  ${classic_message_builder["button_add"]["content_upload_link"]}
  element should be visible  ${classic_message_builder["button_add"]["copy_html_to_text_link"]}
  element should be visible  ${classic_message_builder["button_add"]["insert_imate_link"]}
  element should be visible  ${classic_message_builder["button_add"]["insert_dynamic_content_block_link"]}
  element should be visible  ${classic_message_builder["button_add"]["track_all_link"]}
  element should be visible  ${classic_message_builder["button_add"]["link_management_link"]}
  element should be visible  ${classic_message_builder["button_add"]["external_content_link"]}
  element should be visible  ${classic_message_builder["button_add"]["message_personalization_link"]}
  element should be visible  ${classic_message_builder["button_add"]["insert_emoji_link"]}
  element should be visible  ${classic_message_builder["button_add"]["send_test_message_link"]}
  element should be visible  ${classic_message_builder["button_add"]["deliverability_test_link"]}
  element should be visible  ${classic_message_builder["button_add"]["save_button"]}
  element should be visible  ${classic_message_builder["button_add"]["save_and_view_the_result"]}

classic message list
  element should be visible  ${classic_message_builder["button_list"]["messages"]}
  element should be visible  ${classic_message_builder["button_list"]["header_id"]}
  element should be visible  ${classic_message_builder["button_list"]["header_message_name"]}
  element should be visible  ${classic_message_builder["button_list"]["header_association_id"]}
  element should be visible  ${classic_message_builder["button_list"]["header_workflow"]}
  element should be visible  ${classic_message_builder["button_list"]["header_edit"]}
  element should be visible  ${classic_message_builder["button_list"]["header_favorites"]}
  element should be visible  ${classic_message_builder["button_list"]["header_copy"]}
  element should be visible  ${classic_message_builder["button_list"]["header_preview"]}
  element should be visible  ${classic_message_builder["button_list"]["header_test_message"]}
  element should be visible  ${classic_message_builder["button_list"]["header_audit_deliverability"]}
  element should be visible  ${classic_message_builder["button_list"]["header_delete"]}
  element should be visible  ${generics["trash"]}

sms message add
  element should be visible  ${sms_message_builder["button_add"]["sms_message_name"]}
  element should be visible  ${sms_message_builder["button_add"]["sms_message_description"]}
  element should be visible  ${sms_message_builder["button_add"]["sms_message_from"]}
  element should be visible  ${sms_message_builder["button_add"]["sms_message_body"]}
  element should be visible  ${sms_message_builder["button_add"]["message_personalization_link"]}
  element should be visible  ${sms_message_builder["button_add"]["message_preview_link"]}
  element should be visible  ${sms_message_builder["button_add"]["send_test_message_link"]}
  element should be visible  ${sms_message_builder["button_add"]["back_button"]}
  element should be visible  ${sms_message_builder["button_add"]["save_button"]}
  element should be visible  ${sms_message_builder["button_add"]["save_and_go_to_sms_messages_button"]}

sms message list
  element should be visible  ${sms_message_builder["button_list"]["header_id"]}
  element should be visible  ${sms_message_builder["button_list"]["header_message_name"]}
  element should be visible  ${sms_message_builder["button_list"]["header_created_by"]}
  element should be visible  ${sms_message_builder["button_list"]["header_association_id"]}
  element should be visible  ${sms_message_builder["button_list"]["header_workflow"]}
  element should be visible  ${sms_message_builder["button_list"]["header_edit"]}
  element should be visible  ${sms_message_builder["button_list"]["header_favorites"]}
  element should be visible  ${sms_message_builder["button_list"]["header_copy"]}
  element should be visible  ${sms_message_builder["button_list"]["header_delete"]}
  element should be visible  ${sms_message_builder["button_list"]["delete"]}

landing page add
  wait until keyword succeeds  5x  1 sec  click element  ${landing_page["button_add"]["change_style"]}
  element should be visible  ${landing_page["button_add"]["apply_to_entire_page"]}
  element should be visible  ${landing_page["button_add"]["overwrite_inline_styles"]}
  element should be visible  ${landing_page["button_add"]["page_style"]}
  element should be visible  ${landing_page["button_add"]["text_style"]}
  element should be visible  ${landing_page["button_add"]["form_style"]}
  element should be visible  ${landing_page["button_add"]["page_name"]}
  element should be visible  ${landing_page["button_add"]["undo"]}
  element should be visible  ${landing_page["button_add"]["add_a_row"]}
  element should be visible  ${landing_page["button_add"]["wizard_controls"]}
  element should be visible  ${landing_page["button_add"]["button_text"]}
  element should be visible  ${landing_page["button_add"]["button_image"]}
  element should be visible  ${landing_page["button_add"]["button_smart_personalisation"]}
  element should be visible  ${landing_page["button_add"]["button_html"]}
  element should be visible  ${landing_page["button_add"]["button_form"]}
  element should be visible  ${landing_page["button_add"]["button_subscription_suspension"]}
  element should be visible  ${landing_page["button_add"]["save"]}

landing page list
  element should be visible  ${landing_page["button_list"]["header_id"]}
  element should be visible  ${landing_page["button_list"]["header_name"]}
  element should be visible  ${landing_page["button_list"]["header_last_modified"]}
  element should be visible  ${landing_page["button_list"]["header_status"]}
  element should be visible  ${landing_page["button_list"]["header_start_date"]}
  element should be visible  ${landing_page["button_list"]["header_stop_date"]}

content block add
  element should be visible  ${content_block["button_add"]["name"]}
  element should be visible  ${content_block["button_add"]["description"]}
  element should be visible  ${content_block["button_add"]["text_content"]}
  element should be visible  ${content_block["button_add"]["content_upload"]}
  element should be visible  ${content_block["button_add"]["track_all_links"]}
  element should be visible  ${content_block["button_add"]["link_management"]}
  element should be visible  ${content_block["button_add"]["external_content"]}
  element should be visible  ${content_block["button_add"]["dynamic_content_block_personalization"]}
  element should be visible  ${content_block["button_add"]["dynamic_content_block_preview"]}
  element should be visible  ${content_block["button_add"]["save"]}

content block list
  element should be visible  ${content_block["button_list"]["header_id"]}
  element should be visible  ${content_block["button_list"]["header_name"]}
  element should be visible  ${content_block["button_list"]["header_description"]}
  element should be visible  ${content_block["button_list"]["header_type"]}
  element should be visible  ${content_block["button_list"]["header_creation_date"]}
  element should be visible  ${content_block["button_list"]["header_modification_date"]}
  element should be visible  ${content_block["button_list"]["header_creator"]}

webform add
  # page 1
  element should be visible  ${webform["button_add"]["STEP_1_settings"]}
  input text  ${webform["button_add"]["name"]}  Qa Automation Test Webform
  input text  ${webform["button_add"]["description"]}  auto generated
  select from list by label  ${webform["button_add"]["select_languages"]}  English
  click element  ${webform["button_add"]["select_date"]}
  click element  ${webform["button_add"]["today_date"]}
  input text  ${webform["button_add"]["confirm_url"]}  http://www.smartfocus.com
  input text  ${webform["button_add"]["error_url"]}  https://imgs.xkcd.com/comics/new_bug.png
  click element  ${webform["button_add"]["next_step"]}
  # page 2
  element should be visible  ${webform["button_add"]["STEP_2_Fields"]}
  element should be visible  ${webform["button_add"]["webform_type"]}
  select from list by label  ${webform["button_add"]["webform_type"]}  Update or subscribe webform
  element should be visible  ${webform["button_add"]["field_name"]}
  element should be visible  ${webform["button_add"]["display_name"]}
  select from list by label  //*[@id='entry[0]']/td[1]/select  EMAIL
  input text  //*[@id='entry[0]']/td[3]/input  Email
  select from list by label  //*[@id='entry[0]']/td[4]/select  TEXT
  select from list by label  //*[@id='entry[0]']/td[7]/select  EMAIL
  click element  ${webform["button_add"]["next_step"]}
  # page 3
  element should be visible  ${webform["button_add"]["STEP_3_confirmation_email"]}
  select from list by label  ${webform["button_add"]["bounce_back_type"]}  User
  element should be visible  ${webform["button_add"]["bounce_back_type"]}
  element should be visible  ${webform["button_add"]["service_email_address"]}
  element should be visible  ${webform["button_add"]["reply_to_email"]}
  element should be visible  ${webform["button_add"]["save_webform"]}
  element should be visible  ${webform["button_add"]["previous_step"]}

webform list
  element should be visible  ${webform["button_list"]["header_id"]}
  element should be visible  ${webform["button_list"]["header_webform_name"]}
  element should be visible  ${webform["button_list"]["header_webform_description"]}
  element should be visible  ${webform["button_list"]["header_webform_end_date"]}
  element should be visible  ${webform["button_list"]["header_manager"]}
  element should be visible  ${webform["button_list"]["header_status"]}
  element should be visible  ${webform["button_list"]["header_edit"]}
  element should be visible  ${webform["button_list"]["header_copy"]}
  element should be visible  ${webform["button_list"]["header_preview"]}

template add
  element should be visible  ${template["button_add"]["template_name"]}
  element should be visible  ${template["button_add"]["template_description"]}
  element should be visible  ${template["button_add"]["upload_file"]}
  element should be visible  ${template["button_add"]["import_file"]}

template list
  element should be visible  ${template["button_list"]["templates"]}
  element should be visible  ${template["button_list"]["display_options_link"]}
  element should be visible  ${template["button_list"]["header_template_id"]}
  element should be visible  ${template["button_list"]["header_name"]}
  element should be visible  ${template["button_list"]["header_description"]}
  element should be visible  ${template["button_list"]["header_view"]}
  element should be visible  ${template["button_list"]["header_create_message"]}
  element should be visible  ${template["button_list"]["header_export"]}
  element should be visible  ${template["button_list"]["header_replace"]}
  element should be visible  ${template["button_list"]["header_delete"]}
  element should be visible  ${template["button_list"]["delete"]}

transactional message add
  element should be visible  ${transactional_message["button_add"]["radio_notification_classic"]}
  element should be visible  ${transactional_message["button_add"]["radio_notification_attachment"]}
  element should be visible  ${transactional_message["button_add"]["name"]}
  element should be visible  ${transactional_message["button_add"]["description"]}
  element should be visible  ${transactional_message["button_add"]["message_from"]}
  element should be visible  ${transactional_message["button_add"]["message_to"]}
  element should be visible  ${transactional_message["button_add"]["message_subject"]}
  element should be visible  ${transactional_message["button_add"]["message_reply_to_emails"]}
  element should be visible  ${transactional_message["button_add"]["message_reply_to"]}
  element should be visible  ${transactional_message["button_add"]["message_encoding"]}
  element should be visible  ${transactional_message["button_add"]["text_content"]}
  element should be visible  ${transactional_message["button_add"]["content_upload"]}
  element should be visible  ${transactional_message["button_add"]["copy_HTML_to_text"]}
  element should be visible  ${transactional_message["button_add"]["insert_dynamic_content_block"]}
  element should be visible  ${transactional_message["button_add"]["track_links"]}
  element should be visible  ${transactional_message["button_add"]["manage_links"]}
  element should be visible  ${transactional_message["button_add"]["personalize_content"]}
  element should be visible  ${transactional_message["button_add"]["preview"]}
  element should be visible  ${transactional_message["button_add"]["send_test"]}
  element should be visible  ${transactional_message["button_add"]["save"]}
  element should be visible  ${transactional_message["button_add"]["save_and_back"]}

transactional message list
  element should be visible  ${transactional_message["button_list"]["message"]}
  element should be visible  ${transactional_message["button_list"]["header_id"]}
  element should be visible  ${transactional_message["button_list"]["header_delete"]}
  element should be visible  ${transactional_message["button_list"]["header_integration_status"]}
  element should be visible  ${transactional_message["button_list"]["header_name"]}
  element should be visible  ${transactional_message["button_list"]["header_description"]}
  element should be visible  ${transactional_message["button_list"]["header_created_by"]}
  element should be visible  ${transactional_message["button_list"]["header_preview"]}
  element should be visible  ${transactional_message["button_list"]["header_edit"]}
  element should be visible  ${transactional_message["button_list"]["header_copy"]}
  element should be visible  ${transactional_message["button_list"]["header_delete"]}
  element should be visible  ${transactional_message["button_list"]["delete"]}

transactional content block add
  element should be visible  ${transactional_content_block["button_add"]["content_block_name_input"]}
  element should be visible  ${transactional_content_block["button_add"]["content_block_description_input"]}
  element should be visible  ${transactional_content_block["button_add"]["content_block_body_input"]}
  element should be visible  ${transactional_content_block["button_add"]["content_upload"]}
  element should be visible  ${transactional_content_block["button_add"]["track_all_links"]}
  element should be visible  ${transactional_content_block["button_add"]["link_management"]}
  element should be visible  ${transactional_content_block["button_add"]["message_personalization"]}
  element should be visible  ${transactional_content_block["button_add"]["message_preview"]}
  element should be visible  ${transactional_content_block["button_add"]["save"]}

transactional content block list
  element should be visible  ${transactional_content_block["button_list"]["dynamic_content_blocks"]}
  element should be visible  ${transactional_content_block["button_list"]["header_id"]}
  element should be visible  ${transactional_content_block["button_list"]["header_name"]}
  element should be visible  ${transactional_content_block["button_list"]["header_description"]}
  element should be visible  ${transactional_content_block["button_list"]["header_created_by"]}
  element should be visible  ${transactional_content_block["button_list"]["header_preview"]}
  element should be visible  ${transactional_content_block["button_list"]["header_edit"]}
  element should be visible  ${transactional_content_block["button_list"]["header_copy"]}
  element should be visible  ${transactional_content_block["button_list"]["header_delete"]}
  element should be visible  ${generics["trash"]}

add subscriber
  element should be visible  ${add_subscriber["button_add"]["header_database_field"]}
  element should be visible  ${add_subscriber["button_add"]["header_database_type"]}
  element should be visible  ${add_subscriber["button_add"]["header_database_value"]}
  element should be visible  ${add_subscriber["button_add"]["header_database_stats"]}
  element should be visible  ${add_subscriber["button_add"]["save_member"]}
  element should be visible  ${add_subscriber["button_add"]["reset"]}
  element should be visible  ${add_subscriber["button_add"]["cancel"]}

search subscriber
  element should be visible  ${search_subscriber["button_add"]["header_database_field"]}
  element should be visible  ${search_subscriber["button_add"]["header_select_operator"]}
  element should be visible  ${search_subscriber["button_add"]["header_value"]}
  element should be visible  ${search_subscriber["button_add"]["header_add"]}
  # first search row
  element should be visible  ${search_subscriber["button_add"]["text_field_combo"]}
  element should be visible  ${search_subscriber["button_add"]["text_field_operator"]}
  element should be visible  ${search_subscriber["button_add"]["text_field_value"]}
  element should be visible  ${search_subscriber["button_add"]["add_text"]}
  # second search row
  element should be visible  ${search_subscriber["button_add"]["numeric_field_combo"]}
  element should be visible  ${search_subscriber["button_add"]["numeric_field_operator"]}
  element should be visible  ${search_subscriber["button_add"]["numeric_field_value"]}
  element should be visible  ${search_subscriber["button_add"]["add_numeric"]}
  # third search row
  element should be visible  ${search_subscriber["button_add"]["date_field_combo"]}
  element should be visible  ${search_subscriber["button_add"]["date_field_operator"]}
  element should be visible  ${search_subscriber["button_add"]["date_picker"]}
  element should be visible  ${search_subscriber["button_add"]["add_date"]}
  # fourth search row
  element should be visible  ${search_subscriber["button_add"]["segmentation_field_operator"]}
  element should be visible  ${search_subscriber["button_add"]["segmentation_field_value"]}
  element should be visible  ${search_subscriber["button_add"]["add_segmentation"]}

import subscriber add
  element should be visible  ${import_subscriber["button_add"]["import_button"]}
  current frame contains  STEP 1: Send your file to import server
  current frame contains  Click on 'Import' button to send your new file to import server:
  current frame contains  STEP 2: File is checked by the import server
  current frame contains  STEP 3: Click on a filename to insert data to your member list

import subscriber list
  element should be visible  ${import_subscriber["button_list"]["header_status"]}
  element should be visible  ${import_subscriber["button_list"]["header_id"]}
  element should be visible  ${import_subscriber["button_list"]["header_original_filename"]}
  element should be visible  ${import_subscriber["button_list"]["header_created_by"]}
  element should be visible  ${import_subscriber["button_list"]["header_import_date"]}
  element should be visible  ${import_subscriber["button_list"]["header_size_b"]}
  element should be visible  ${import_subscriber["button_list"]["header_step"]}
  element should be visible  ${import_subscriber["button_list"]["header_lines"]}
  element should be visible  ${import_subscriber["button_list"]["header_val_errors"]}
  element should be visible  ${import_subscriber["button_list"]["header_imp_errors"]}
  element should be visible  ${import_subscriber["button_list"]["header_log"]}
  element should be visible  ${import_subscriber["button_list"]["header_nb_insert"]}
  element should be visible  ${import_subscriber["button_list"]["header_job_begin"]}
  element should be visible  ${import_subscriber["button_list"]["header_job_end"]}

export subscriber add
  element should be visible  ${export_subscriber["button_add"]["email_view"]}
  element should be visible  ${export_subscriber["button_add"]["sms_view"]}
  element should be visible  ${export_subscriber["button_add"]["select_a_campaign_and_action"]}
  element should be visible  ${export_subscriber["button_add"]["selected"]}
  element should be visible  ${export_subscriber["button_add"]["sent"]}
  element should be visible  ${export_subscriber["button_add"]["received_and_not_opened"]}
  element should be visible  ${export_subscriber["button_add"]["opend"]}
  element should be visible  ${export_subscriber["button_add"]["clicked"]}
  element should be visible  ${export_subscriber["button_add"]["clicked_with_url_details"]}
  element should be visible  ${export_subscriber["button_add"]["post_click_tracking"]}
  element should be visible  ${export_subscriber["button_add"]["filtered"]}
  element should be visible  ${export_subscriber["button_add"]["unjoin"]}
  element should be visible  ${export_subscriber["button_add"]["hard_bounced"]}
  element should be visible  ${export_subscriber["button_add"]["soft_bounced"]}
  element should be visible  ${export_subscriber["button_add"]["hard_and_soft_bounced"]}
  element should be visible  ${export_subscriber["button_add"]["conplaints"]}
  element should be visible  ${export_subscriber["button_add"]["submit_campaign_form"]}
  element should be visible  ${export_subscriber["button_add"]["select_a_segment_and_status"]}
  element should be visible  ${export_subscriber["button_add"]["active_members"]}
  element should be visible  ${export_subscriber["button_add"]["quarantined_or_unjoin_members"]}
  element should be visible  ${export_subscriber["button_add"]["quarantined_members"]}
  element should be visible  ${export_subscriber["button_add"]["unjoin_members"]}
  element should be visible  ${export_subscriber["button_add"]["sms_active_members"]}
  element should be visible  ${export_subscriber["button_add"]["sms_quarantined_or_sms_unjoin_members"]}
  element should be visible  ${export_subscriber["button_add"]["sms_quarantined_members"]}
  element should be visible  ${export_subscriber["button_add"]["sms_unjoin_members"]}
  element should be visible  ${export_subscriber["button_add"]["all_members"]}
  element should be visible  ${export_subscriber["button_add"]["submit_segment_form"]}

export subscriber list
  element should be visible  ${export_subscriber["button_list"]["header_status"]}
  element should be visible  ${export_subscriber["button_list"]["header_id"]}
  element should be visible  ${export_subscriber["button_list"]["header_original_exported"]}
  element should be visible  ${export_subscriber["button_list"]["header_created_by"]}
  element should be visible  ${export_subscriber["button_list"]["header_job_type"]}
  element should be visible  ${export_subscriber["button_list"]["header_nb_members"]}
  element should be visible  ${export_subscriber["button_list"]["header_scheduled_time"]}
  element should be visible  ${export_subscriber["button_list"]["header_start_time"]}
  element should be visible  ${export_subscriber["button_list"]["header_process_time"]}

image library add
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  element should be visible  ${image_library["button_add"]["create_new_folder"]}
  element should be visible  ${image_library["button_add"]["select_all"]}
  element should be visible  ${image_library["button_add"]["storage"]}
  click element  ${image_library["button_add"]["add_button"]}
  select frame  ${iframes["image_library_add_iframe"]}
  element should be visible  ${image_library["button_add"]["browse_button"]}
  element should be visible  ${image_library["button_add"]["start_upload_button"]}

transactional reports add
  # Dashboards --
  element should be visible  ${transactional_message["button_list"]["dashbords"]}
  element should be visible  ${transactional_message["button_list"]["export_in_excel"]}
  # Date Range Report --
  click element  ${transactional_message["button_list"]["date_range_report"]}
  element should be visible  ${transactional_message["button_list"]["notification_lable"]}
  element should be visible  ${transactional_message["button_list"]["select_message_id"]}
  element should be visible  ${transactional_message["button_list"]["begin_date_lable"]}
  element should be visible  ${transactional_message["button_list"]["begin_date_picker"]}
  element should be visible  ${transactional_message["button_list"]["end_date_lable"]}
  element should be visible  ${transactional_message["button_list"]["end_date_picker"]}
  element should be visible  ${transactional_message["button_list"]["range_form_ok_button"]}
  # Custom Search --
  click element  ${transactional_message["button_list"]["custom_search"]}
  element should be visible  ${transactional_message["button_list"]["email_lable"]}
  element should be visible  ${transactional_message["button_list"]["email_input"]}
  element should be visible  ${transactional_message["button_list"]["custom_form_ok_button"]}

mobile reports add
  element should be visible  ${mobile_reports["button_add"]["header_id"]}
  element should be visible  ${mobile_reports["button_add"]["header_campaign_name"]}
  element should be visible  ${mobile_reports["button_add"]["header_status"]}
  element should be visible  ${mobile_reports["button_add"]["header_send_date"]}
  element should be visible  ${mobile_reports["button_add"]["header_selected"]}
  element should be visible  ${mobile_reports["button_add"]["header_sent"]}
  element should be visible  ${mobile_reports["button_add"]["header_delivered"]}
  element should be visible  ${mobile_reports["button_add"]["header_undelivered"]}
  element should be visible  ${mobile_reports["button_add"]["header_stops"]}

list growth reports list
  element should be visible  ${list_growth_reports["button_add"]["header_report_name"]}
  element should be visible  ${list_growth_reports["button_add"]["header_id"]}
  element should be visible  ${list_growth_reports["button_add"]["header_status"]}
  element should be visible  ${list_growth_reports["button_add"]["header_creation_date"]}
  element should be visible  ${list_growth_reports["button_add"]["header_created_by"]}

folders add
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}
  element should be visible  ${folders["button_add"]["folders"]}
  element should be visible  ${folders["button_add"]["save"]}
  element should be visible  ${folders["button_add"]["new_directory_name"]}
  element should be visible  ${folders["button_add"]["new_directory_description"]}
  element should be visible  ${folders["button_add"]["header_delete"]}
  element should be visible  ${folders["button_add"]["header_name"]}
  element should be visible  ${folders["button_add"]["header_description"]}
  element should be visible  ${folders["button_add"]["header_content_summary"]}
  element should be visible  ${folders["button_add"]["delete"]}

workflow add
  element should be visible  ${workflow["button_add"]["header_name"]}
  element should be visible  ${workflow["button_add"]["header_description"]}
  element should be visible  ${workflow["button_add"]["header_status"]}
  element should be visible  ${workflow["button_add"]["header_creation"]}
  element should be visible  ${workflow["button_add"]["header_update"]}
  element should be visible  ${workflow["button_add"]["header_edit"]}
  element should be visible  ${workflow["button_add"]["header_delete"]}
  element should be visible  ${workflow["button_add"]["delete"]}

workflow model add
  element should be visible  ${workflow_model["button_add"]["header_model_name"]}
  element should be visible  ${workflow_model["button_add"]["header_model_description"]}
  element should be visible  ${workflow_model["button_add"]["header_created"]}
  element should be visible  ${workflow_model["button_add"]["header_view"]}
  element should be visible  ${workflow_model["button_add"]["header_delete"]}
  element should be visible  ${workflow_model["button_add"]["delete"]}
