*** Settings ***
Documentation  keywords specific to the list management pages

*** Keywords ***
search for member
  [Arguments]  ${id_type}  ${id_method}  ${string}
  open content  ${search_subscriber}  ${search_subscriber["button_add"]["add"]}
  wait until keyword succeeds  5x  1 sec  select from list by label  ${search_subscriber["button_add"]["text_field_combo"]}  ${id_type}
  wait until keyword succeeds  5x  1 sec  select from list by label  ${search_subscriber["button_add"]["text_field_operator"]}  ${id_method}
  input text  ${search_subscriber["button_add"]["text_field_value"]}  ${string}
  click element  id=iconAddCriteria
  click element  ${search_subscriber["button_add"]["text_search"]}
  wait until keyword succeeds  5x  1 sec  element should be visible  //*[@id='iconTrash']

delete all members matching id
  [Arguments]  ${id_type}  ${id_method}  ${string}
  search for member  ${id_type}  ${id_method}  ${string}
  wait until keyword succeeds  5x  1 sec  click element  //*[@id='iconSelectAll']
  wait until keyword succeeds  5x  1 sec  click element  //*[@id='iconTrash']
  run keyword and ignore error  dismiss alert  # handle the javascrit dialog for no members found
  run keyword and ignore error  wait until keyword succeeds  5x  1 sec  click element  //*[@id='iconTrash']
  run keyword and ignore error  dismiss alert  # handle the javascrit dialog for no members found

add member
  [Arguments]  ${email_address}  ${firstname}  ${lastname}
  open content  ${add_subscriber}  ${add_subscriber["button_add"]["add"]}
  wait until element is visible  ${add_subscriber["button_add"]["input_fields"]["email"]}
  input text  ${add_subscriber["button_add"]["input_fields"]["email"]}  ${email_address}
  input text  ${add_subscriber["button_add"]["input_fields"]["firstname"]}  ${firstname}
  input text  ${add_subscriber["button_add"]["input_fields"]["lastname"]}  ${lastname}
  click element  ${add_subscriber["button_add"]["save_member"]}
  current frame contains  Your member has been successfully saved.
