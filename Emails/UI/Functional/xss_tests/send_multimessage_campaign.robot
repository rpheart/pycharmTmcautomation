*** Settings ***
Documentation     will check the input of each of the blns values into the MultiMessage screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
#Suite Teardown      close all browsers

*** Test Cases ***
multimessage_campaign_name
#    # Grab id of latest multimessage
#    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
#    ${latest_message_id}=    wait until keyword succeeds    30x    1 sec    get text    ${multimessage_campaign["button_list"]["first_block_id"]}

    # Check xss data on multimessage campaign name field
    loop through test data step 1    ${multimessage_campaign["button_add"]["input_name"]}

    # Check no new content blocks were created
#    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
#    ${post_test_message_id}=    wait until keyword succeeds    30x    1 sec    get text    ${multimessage_campaign["button_list"]["first_block_id"]}
#    ${is_equal}=    run keyword and return status    should not be equal    ${post_test_message_id}    ${latest_message_id}
#    run keyword if    ${is_equal}    fail    msg=New MultiMessage Campaigns were created with XSS data

multimessage_campaign_description
    loop through test data step 1    ${multimessage_campaign["button_add"]["input_description"]}

multimessage_campaign_trackable_link_hostname
    loop through test data step 3    ${multimessage_campaign["button_add"]["track_link_hostname"]}

multimessage_campaign_end_of_tracking_url
    loop through test data step 3    ${multimessage_campaign["button_add"]["track_url"]}

multimessage_campaign_reporting_email
    loop through test data step 3    ${multimessage_campaign["button_add"]["add_recipient"]}

multimessage_campaign_search
    verify xss data on search field    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}

*** Keywords ***
loop through test data step 1
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${multimessage_campaign}    ${multimessage_campaign["button_add"]["add"]}
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    input text    ${field}    ${line}
    \    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-openButton"]
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-addEntitiesButton"]//div[./text()='Ok']
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-nextButton"]//div[./text()='Continue']
    \    sleep    2
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version1-idColumn
    \    sleep    2
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version2-idColumn
    # Step 2
    \    click element    ${multimessage_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multimessage_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data step 3
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${multimessage_campaign}    ${multimessage_campaign["button_add"]["add"]}
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-openButton"]
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-addEntitiesButton"]//div[./text()='Ok']
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-nextButton"]//div[./text()='Continue']
    \    sleep    2
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version1-idColumn
    \    sleep    2
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version2-idColumn
    # Step 2
    \    click element    ${multimessage_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multimessage_campaign['button_add']['more_options']}
    \    wait until keyword succeeds    30x    1 sec    click element    ${multimessage_campaign['button_add']['add_recipient_button']}
    \    input text    ${multimessage_campaign['button_add']['add_recipient']}    test@test.com
    \    ${is_email}=    run keyword and return status    should contain    ${line}    emailInput
    \    run keyword if    ${is_email}    create email string    ${line}
    \    input text    ${field}    ${line}
    \    click element    ${multimessage_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
