*** Settings ***
Documentation       will check the input of unicode values into the MultiMessage screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    non_xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
multimessage_campaign_name
    # Grab count of multimessages
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}

    # Check xss data on multimessage campaign name field
    loop through test data step 1    ${multimessage_campaign["button_add"]["input_name"]}

    # Check no new multimessagesa were created
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should not be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=No new MultiMessage Campaigns were created with non-XSS data

multimessage_campaign_description
    # Grab count of multimessages
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}

    # Check xss data on multimessage campaign name field
    loop through test data step 1    ${multimessage_campaign["button_add"]["input_description"]}

    # Check no new multimessagesa were created
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should not be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=No new MultiMessage Campaigns were created with non-XSS data

multimessage_campaign_trackable_link_hostname
    # Grab count of multimessages
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}

    # Check xss data on multimessage campaign name field
    loop through test data step 3    ${multimessage_campaign["button_add"]["track_link_hostname"]}    False

    # Check no new multimessagesa were created
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should not be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=No new MultiMessage Campaigns were created with non-XSS data

multimessage_campaign_end_of_tracking_url
    # Grab count of multimessages
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}

    # Check xss data on multimessage campaign name field
    loop through test data step 3    ${multimessage_campaign["button_add"]["track_url"]}    False

    # Check no new multimessagesa were created
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should not be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=No new MultiMessage Campaigns were created with non-XSS data

multimessage_campaign_reporting_email
    # Grab count of multimessages
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}

    # Check xss data on multimessage campaign name field
    loop through test data step 3    ${multimessage_campaign["button_add"]["add_recipient"]}    True

    # Check no new multimessagesa were created
    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multimessage_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should not be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=No new MultiMessage Campaigns were created with non-XSS data

multimessage_campaign_search
    verify non xss data on search field    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}

*** Keywords ***
loop through test data step 1
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${multimessage_campaign}    ${multimessage_campaign["button_add"]["add"]}
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    input text    ${field}    ${line}
    \    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-openButton"]
    \    wait until keyword succeeds    15x    1 sec    click element    //*[contains(text(), 'Favourites')]
    \    wait until keyword succeeds    15x    1 sec    click element    //*[contains(text(), 'QA TEAM')]
    \    wait until keyword succeeds    15x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-addEntitiesButton"]//div[./text()='Ok']
    \    wait until keyword succeeds    15x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-nextButton"]//div[./text()='Continue']
    \    sleep    2
    \    wait until keyword succeeds    15x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    15x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version1-idColumn
    \    sleep    2
    \    wait until keyword succeeds    15x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    15x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version2-idColumn
    # Step 2
    \    click element    ${multimessage_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multimessage_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data step 3
    [Arguments]    ${field}    ${is_email}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${multimessage_campaign}    ${multimessage_campaign["button_add"]["add"]}
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-openButton"]
    \    wait until keyword succeeds    15x    1 sec    click element    //*[contains(text(), 'Favourites')]
    \    wait until keyword succeeds    15x    1 sec    click element    //*[contains(text(), 'QA TEAM')]
    \    wait until keyword succeeds    15x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-addEntitiesButton"]//div[./text()='Ok']
    \    wait until keyword succeeds    15x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-nextButton"]//div[./text()='Continue']
    \    sleep    2
    \    wait until keyword succeeds    15x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    15x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version1-idColumn
    \    sleep    2
    \    wait until keyword succeeds    15x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    15x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version2-idColumn
    # Step 2
    \    click element    ${multimessage_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multimessage_campaign['button_add']['more_options']}
    \    wait until keyword succeeds    15x    1 sec    click element    ${multimessage_campaign['button_add']['add_recipient_button']}
    \    input text    ${multimessage_campaign['button_add']['add_recipient']}    test@test.com
    \    run keyword if    ${is_email}    create email string    ${line}
    \    input text    ${field}    ${line}
    \    click element    ${multimessage_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
