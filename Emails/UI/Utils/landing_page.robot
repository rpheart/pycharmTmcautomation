*** Settings ***
Documentation  Keywords specific to the creation of landing pages

*** Keywords ***
set page name
  [Arguments]  ${name}
  wait until keyword succeeds  5x  1 sec  click element  ${landing_page["button_add"]["page_name"]}
  wait until keyword succeeds  5x  1 sec  click element  ${landing_page["button_add"]["page_name"]}
  press key  ${landing_page["button_add"]["page_name_input"]}  \u0001  # Select All
  press key  ${landing_page["button_add"]["page_name_input"]}  \\127  # Delete
  input text  ${landing_page["button_add"]["page_name_input"]}  ${name}
  press key  ${landing_page["button_add"]["page_name_input"]}  \\13  # Return

add block
  [Arguments]  ${type}
  :for  ${n}  in range  10
  \  ${block_set}=  run keyword and return status  click element  ${type}
  \  exit for loop if  ${block_set}
  \  click element  ${landing_page["button_add"]["add_a_row"]}

add form and standard fields
  add block  ${landing_page["button_add"]["button_form"]}
  # add email
  click element  ${landing_page["button_add"]["label_input_field"]}
  wait until keyword succeeds  5x  1 sec  click element  ${landing_page["button_add"]["form_type"]["selector"]}
  click element  ${landing_page["button_add"]["form_type"]["email"]}
  click element  ${landing_page["button_add"]["field_personalisation"]["selector"]}
  click element  ${landing_page["button_add"]["field_personalisation"]["email"]}
  input text  ${landing_page["button_add"]["label_input_field"]}  Email
  # add firstname
  click element  ${landing_page["button_add"]["field_selector"]["add"]}
  click element  ${landing_page["button_add"]["field_selector"]["input_field"]}
  click element  ${landing_page["button_add"]["label_input_field"]}
  sleep  1
  click element  ${landing_page["button_add"]["field_personalisation"]["selector"]}
  click element  ${landing_page["button_add"]["field_personalisation"]["firstname"]}
  input text  ${landing_page["button_add"]["label_input_field"]}  Firstname
  # add lastname
  click element  ${landing_page["button_add"]["field_selector"]["add"]}
  click element  ${landing_page["button_add"]["field_selector"]["input_field"]}
  click element  ${landing_page["button_add"]["label_input_field"]}
  sleep  1
  click element  ${landing_page["button_add"]["field_personalisation"]["selector"]}
  click element  ${landing_page["button_add"]["field_personalisation"]["lastname"]}
  input text  ${landing_page["button_add"]["label_input_field"]}  Lastname

create and schedule landing page
  [Arguments]  ${insertion_type}
  open content  ${landing_page}  ${landing_page["button_add"]["add"]}
  set page name  Qa Auto Landing Page
  add form and standard fields
  click element  ${landing_page["button_add"]["save_and_schedule"]}
  # start landing page
  wait until keyword succeeds  5x  1 sec  click element  ${landing_page["button_add"]["general_properties"]["start_date"]}
  click element  ${landing_page["button_add"]["general_properties"]["end_date"]}
  # save and go to data sync page
  click element  ${landing_page["button_add"]["data_sync"]["tab"]}
  click element  ${landing_page["button_add"]["data_sync"]["activate_switch"]}
  click element  ${landing_page["button_add"]["data_sync"]["activate_confirmation"]}
  click element  ${insertion_type}
  click element  ${landing_page["button_add"]["data_sync"]["source_field_slider"]}
  click element  ${landing_page["button_add"]["save"]}

fill out basic landing page
  [Arguments]  ${email}  ${firstname}  ${lastname}
  open content  ${landing_page}  ${landing_page["button_list"]["list"]}
  wait until keyword succeeds  5x  1 sec  click element  ${landing_page["button_list"]["first_row"]}
  click element  ${landing_page["button_list"]["properties"]}
  ${landing_page_url}=  get text  ${landing_page["button_add"]["general_properties"]["landing_page_url"]}
  click element  ${landing_page["button_add"]["general_properties"]["landing_page_url"]}
  wait until keyword succeeds  5x  1 sec  select window  url=${landing_page_url}
  input text  //input[@name='Email']  ${email}
  input text  //input[@name='Firstname']  ${firstname}
  input text  //input[@name='Lastname']  ${lastname}
  click element  //*[@type="submit"]
  close window
  select window  ${document_title}

delete latest landing page
  open content  ${landing_page}  ${landing_page["button_list"]["list"]}
  wait until keyword succeeds  15x  1 sec  click element  ${landing_page["button_list"]["first_row"]}
  click element  ${landing_page["button_list"]["delete"]}
  click element  ${landing_page["button_list"]["yes"]}
  current frame contains  The page has been deleted.
