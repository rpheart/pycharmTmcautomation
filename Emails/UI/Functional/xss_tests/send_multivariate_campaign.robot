*** Settings ***
Documentation     will check the input of each of the blns values into the MultiVariate screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
#Suite Teardown      close all browsers

*** Test Cases ***
multivariate_campaign_name
    loop through test data step 1    ${multivariate_campaign["button_add"]["name_input"]}

multivariate_campaign_description
    loop through test data step 1    ${multivariate_campaign["button_add"]["description_input"]}

multivariate_campaign_version_2_input
    loop through test data step 2    ${multivariate_campaign["button_add"]["version_2_input"]}

multivariate_campaign_trackable_link_hostname
    loop through test data step 3    ${multimessage_campaign["button_add"]["track_link_hostname"]}

multivariate_campaign_end_of_tracking_url
    loop through test data step 3    ${multimessage_campaign["button_add"]["track_url"]}

multivariate_campaign_reporting_email
    loop through test data step 3    ${multimessage_campaign["button_add"]["add_recipient"]}

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
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    30x    1 sec    click element    ${multivariate_campaign['button_add']['click_ok']}
    \    wait until keyword succeeds    30x    1 sec    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 2
    \    wait until page contains    2. Define test versions (up to 20)
    \    run keyword and ignore error    wait until keyword succeeds    30x    1 sec    input text    ${field}    ${line}
    \    wait until keyword succeeds    30x    1 sec    input text    ${multivariate_campaign["button_add"]["version_2_input"]}    test
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
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    30x    1 sec    click element    ${multivariate_campaign['button_add']['click_ok']}
    \    wait until keyword succeeds    30x    1 sec    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 2
    \    wait until page contains    2. Define test versions (up to 20)
    \    run keyword and ignore error    wait until keyword succeeds    30x    1 sec    input text    ${field}    ${line}
    \    wait until keyword succeeds    30x    1 sec    input text    ${field}    test
    \    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multivariate_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data step 3
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${multivariate_campaign}    ${multivariate_campaign["button_add"]["add"]}
    # Step 2
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    click element    ${multivariate_campaign['button_add']['select_a_message']}
    \    click element    splitrunUI-builderView-messagesExplorer-idColumn
    \    click element    ${multivariate_campaign['button_add']['select_one_or_more_segments']}
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    30x    1 sec    click element    ${multivariate_campaign['button_add']['click_ok']}
    \    wait until keyword succeeds    30x    1 sec    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 2
    \    wait until page contains    2. Define test versions (up to 20)
    \    run keyword and ignore error    wait until keyword succeeds    30x    1 sec    input text    ${field}    ${line}
    \    wait until keyword succeeds    30x    1 sec    input text    ${multivariate_campaign["button_add"]["version_2_input"]}    test
    \    click element    ${multivariate_campaign['button_add']['continue_button']}
    # Step 3
    \    click element    ${multimessage_campaign['button_add']['more_options']}
    \    wait until keyword succeeds    30x    1 sec    click element    ${multimessage_campaign['button_add']['add_recipient_button']}
    \    input text    ${multimessage_campaign['button_add']['add_recipient']}    test@test.com
    \    ${is_email}=    run keyword and return status    should contain    ${line}    emailInput
    \    run keyword if    ${is_email}    create email string    ${line}
    \    input text    ${field}    ${line}
    \    click element    ${multivariate_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data