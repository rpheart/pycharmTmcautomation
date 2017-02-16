*** Settings ***
Documentation    Keywords specific to the creation of landing pages

*** Keywords ***
set page name
    [Arguments]    ${name}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_add"]["page_name"]}
    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_add"]["page_name"]}
    press key    ${landing_page["button_add"]["page_name_input"]}    \u0001    # Select All
    press key    ${landing_page["button_add"]["page_name_input"]}    \\127    # Delete
    input text    ${landing_page["button_add"]["page_name_input"]}    ${name}
    press key    ${landing_page["button_add"]["page_name_input"]}    \\13    # Return

add block
    [Arguments]    ${type}
    :for    ${n}    in range    10
    \    ${block_set}=    run keyword and return status    click element    ${type}
    \    exit for loop if    ${block_set}
    \    click element    ${landing_page["button_add"]["add_a_row"]}
