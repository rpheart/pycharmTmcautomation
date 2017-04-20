*** Settings ***
Documentation    keywords specific to the creation of multivariate campaigns

*** Keywords ***
create basic multivariate campaign
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_add"]["add"]}
    # page 1
    input text    ${multivariate_campaign["button_add"]["name_input"]}    MultiVariate Auto Test
    input text    ${multivariate_campaign["button_add"]["description_input"]}    Auto Generated
    click element    ${multivariate_campaign["button_add"]["select_a_message"]}
    click element    ${multivariate_campaign["button_add"]["first_message"]}
    click element    ${multivariate_campaign["button_add"]["select_one_or_more_segments"]}
    click element    ${multivariate_campaign["button_add"]["segment_favourites"]}
    click element    ${multivariate_campaign["button_add"]["qa_team_segment"]}
    click element    ${multivariate_campaign["button_add"]["ok_button"]}
    click element    ${multivariate_campaign["button_add"]["continue_button"]}
    # page 2
    wait until keyword succeeds    5x    1 sec    input text    ${multivariate_campaign["button_add"]["version_2_input"]}    [EMV FIELD]EMAIL[EMV /FIELD]
    click element    ${multivariate_campaign["button_add"]["continue_button"]}
    # page 3
    wait until keyword succeeds    5x    1 sec    click element    ${multivariate_campaign["button_add"]["manual_radio_button"]}
    click element    ${multivariate_campaign["button_add"]["schedule_button"]}
    click element    ${generics["yes_button"]}

verify multivariate campaign completes
    [Arguments]    ${verification_text}
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    :for    ${n}    in range    60
    \    ${is_complete}=    run keyword and return status    element should contain    ${multivariate_campaign["button_list"]["first_row"]}    ${verification_text}
    \    exit for loop if    ${is_complete}
    \    sleep    3
    \    click element    ${multivariate_campaign["button_list"]["refresh_button"]}
    element should contain    ${multivariate_campaign["button_list"]["first_row"]}    ${verification_text}

delete latest multivariate campaign
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    click element    ${multivariate_campaign["button_list"]["first_row"]}
    click element    ${multivariate_campaign["button_list"]["delete_button"]}
    click element    ${generics["yes_button"]}
