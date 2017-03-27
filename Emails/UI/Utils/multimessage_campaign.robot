*** Settings ***
Documentation    keywords specific to the creation of multimessage campaigns

*** Keywords ***
create basic multimessage campaign
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_add"]["add"]}
    # page 1
    input text    ${multimessage_campaign["button_add"]["input_name"]}    MultiMessage Auto Campaign
    input text    ${multimessage_campaign["button_add"]["input_description"]}    auto generated
    click element    ${multimessage_campaign["button_add"]["select_one_or_more_segments"]}
    click element    ${multimessage_campaign["button_add"]["segment_favourites"]}
    click element    ${multimessage_campaign["button_add"]["qa_team_segment"]}
    click element    ${multimessage_campaign["button_add"]["ok_button"]}
    click element    ${multimessage_campaign["button_add"]["continue_button"]}
    # page 2
    wait until keyword succeeds    5 x    1 sec    click element    ${multimessage_campaign["button_add"]["message_one_list"]}
    click element    ${multimessage_campaign["button_add"]["message_one_first_message"]}
    click element    ${multimessage_campaign["button_add"]["message_two_list"]}
    click element    ${multimessage_campaign["button_add"]["message_two_first_message"]}
    click element    ${multimessage_campaign["button_add"]["continue_button"]}
    # page 3
    wait until keyword succeeds    5 x    1 sec    click element    ${multimessage_campaign["button_add"]["schedule_button"]}
    click element    ${generics["yes_button"]}

verify multimessage campaign completes
    [Arguments]    ${verification_text}
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    :for    ${n}    in range    60
    \    ${is_complete}=    run keyword and return status    element should contain    ${multimessage_campaign["button_list"]["first_row"]}    ${verification_text}
    \    exit for loop if    ${is_complete}
    \    sleep    3
    \    click element    ${multimessage_campaign["button_list"]["refresh_button"]}
    element should contain    ${multimessage_campaign["button_list"]["first_row"]}    ${verification_text}

delete latest multimessage campaign
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    click element    ${multimessage_campaign["button_list"]["first_row"]}
    click element    ${multimessage_campaign["button_list"]["delete_button"]}
    click element    ${generics["yes_button"]}
