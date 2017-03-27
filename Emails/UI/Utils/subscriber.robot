*** Settings ***
Documentation    keywords specific to the list management pages

*** Keywords ***
search for member
    [Arguments]    ${id_type}    ${id_method}    ${string}
    open content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    select from list by label    ${search_subscriber["button_add"]["text_field_combo"]}    ${id_type}
    select from list by label    ${search_subscriber["button_add"]["text_field_operator"]}    ${id_method}
    input text    ${search_subscriber["button_add"]["text_field_value"]}    ${string}
    click element    id=iconAddCriteria
    click element    ${search_subscriber["button_add"]["text_search"]}

delete all members matching id
    [Arguments]    ${id_type}    ${id_method}    ${string}
    search for member    ${id_type}    ${id_method}    ${string}
    wait until keyword succeeds    15x    1 sec    click element    //*[@id='iconSelectAll']
    wait until keyword succeeds    15x    1 sec    click element    //*[@id='iconTrash']
    wait until keyword succeeds    15x    1 sec    click element    //*[@id='iconTrash']
