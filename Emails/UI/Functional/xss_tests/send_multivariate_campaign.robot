*** Settings ***
Documentation     will check the input of each of the blns values into the MultiVariate screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
multivariate_campaign_name
    # Grab count of multivariate messages
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}

    # Check xss data on multivariate message campaign name field
    loop through test data step 1    ${multivariate_campaign["button_add"]["name_input"]}

    # Check no new multivariate messages were created
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=New MultiVariate Message Campaigns were created with XSS data

multivariate_campaign_description
    # Grab count of multivariate messages
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}

    # Check xss data on multivariate message campaign name field
    loop through test data step 1    ${multivariate_campaign["button_add"]["description_input"]}

    # Check no new multivariate messages were created
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=New MultiVariate Message Campaigns were created with XSS data

multivariate_campaign_version_2_input
    # Grab count of multivariate messages
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}

    # Check xss data on multivariate message campaign name field
    loop through test data step 2    ${multivariate_campaign["button_add"]["version_2_input"]}

    # Check no new multivariate messages were created
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=New MultiVariate Message Campaigns were created with XSS data

multivariate_campaign_trackable_link_hostname
    # Grab count of multivariate messages
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}

    # Check xss data on multivariate message campaign name field
    loop through test data step 3    ${multimessage_campaign["button_add"]["track_link_hostname"]}    False

    # Check no new multivariate messages were created
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=New MultiVariate Message Campaigns were created with XSS data

multivariate_campaign_end_of_tracking_url
    # Grab count of multivariate messages
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}

    # Check xss data on multivariate message campaign name field
    loop through test data step 3    ${multimessage_campaign["button_add"]["track_url"]}    False

    # Check no new multivariate messages were created
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=New MultiVariate Message Campaigns were created with XSS data

multivariate_campaign_reporting_email
    # Grab count of multivariate messages
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}

    # Check xss data on multivariate message campaign name field
    loop through test data step 3    ${multimessage_campaign["button_add"]["add_recipient"]}    True

    # Check no new multivariate messages were created
    open content    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${multivariate_campaign["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_message_count}    ${message_count}
    run keyword unless    ${is_equal}    fail    msg=New MultiVariate Message Campaigns were created with XSS data

multivariate_campaign_search
    verify xss data on search field    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}

*** Keywords ***
loop through test data step 1
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${multivariate_campaign}    ${multivariate_campaign["button_add"]["add"]}
    # Step 2
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    run keyword and ignore error    input text    ${field}    ${line}
    \    click element    ${multivariate_campaign['button_add']['select_a_message']}
    \    click element    splitrunUI-builderView-messagesExplorer-idColumn
    \    click element    ${multivariate_campaign['button_add']['select_one_or_more_segments']}
    \    wait until keyword succeeds    15x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    15x    1 sec    click element    ${multivariate_campaign['button_add']['click_ok']}
    \    wait until keyword succeeds    15x    1 sec    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 2
    \    wait until page contains    2. Define test versions (up to 20)
    \    wait until keyword succeeds    15x    1 sec    input text    ${multivariate_campaign["button_add"]["version_2_input"]}    test
    \    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multivariate_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data step 2
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${multivariate_campaign}    ${multivariate_campaign["button_add"]["add"]}
    # Step 2
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    click element    ${multivariate_campaign['button_add']['select_a_message']}
    \    click element    splitrunUI-builderView-messagesExplorer-idColumn
    \    click element    ${multivariate_campaign['button_add']['select_one_or_more_segments']}
    \    wait until keyword succeeds    15x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    15x    1 sec    click element    ${multivariate_campaign['button_add']['click_ok']}
    \    wait until keyword succeeds    15x    1 sec    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 2
    \    wait until page contains    2. Define test versions (up to 20)
    \    wait until keyword succeeds    15x    1 sec    input text    ${field}    ${line}
    \    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multivariate_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data step 3
    [Arguments]    ${field}    ${is_email}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${multivariate_campaign}    ${multivariate_campaign["button_add"]["add"]}
    # Step 2
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    click element    ${multivariate_campaign['button_add']['select_a_message']}
    \    click element    splitrunUI-builderView-messagesExplorer-idColumn
    \    click element    ${multivariate_campaign['button_add']['select_one_or_more_segments']}
    \    wait until keyword succeeds    15x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    15x    1 sec    click element    ${multivariate_campaign['button_add']['click_ok']}
    \    wait until keyword succeeds    15x    1 sec    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 2
    \    wait until page contains    2. Define test versions (up to 20)
    \    wait until keyword succeeds    15x    1 sec    input text    ${multivariate_campaign["button_add"]["version_2_input"]}    test
    \    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multimessage_campaign['button_add']['more_options']}
    \    wait until keyword succeeds    15x    1 sec    click element    ${multimessage_campaign['button_add']['add_recipient_button']}
    \    input text    ${multimessage_campaign['button_add']['add_recipient']}    test@test.com
    \    run keyword if    ${is_email}    create email string    ${line}
    \    input text    ${field}    ${line}
    \    click element    ${multivariate_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
