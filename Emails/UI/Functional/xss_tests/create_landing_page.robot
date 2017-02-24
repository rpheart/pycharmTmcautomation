*** Settings ***
Documentation       will check the input of each of the blns values into the create landing page search screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/landing_page.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
landing_page_search
    verify xss data on search field    ${landing_page}    ${landing_page["button_list"]["list"]}

landing_page_name_save
    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${pre_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}

    # create landing page
    loop through test data on page name    ${landing_page["button_add"]["save"]}

    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${post_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_page_count}    ${pre_test_page_count}
    run keyword unless    ${is_equal}    fail    msg=New Pages were created with XSS data

landing_page_name_save_and_finalise
    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${pre_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}

    # create landing page
    loop through test data on page name    ${landing_page["button_add"]["save_and_schedule"]}

    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${post_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_page_count}    ${pre_test_page_count}
    run keyword unless    ${is_equal}    fail    msg=New Pages were created with XSS data

landing_page_schedule_overview
    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${pre_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}

    # create landing page
    loop through test data on general properties    ${landing_page["button_add"]["overview"]}

    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${post_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_page_count}    ${pre_test_page_count}
    run keyword unless    ${is_equal}    fail    msg=New Pages were created with XSS data

landing_page_schedule_confirmation_message
    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${pre_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}

    # create landing page
    loop through test data on general properties    ${landing_page["button_add"]["confirmation_message"]}

    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${post_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_page_count}    ${pre_test_page_count}
    run keyword unless    ${is_equal}    fail    msg=New Pages were created with XSS data

landing_page_schedule_submission_url
    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${pre_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}

    # create landing page
    loop through test data on general properties    ${landing_page["button_add"]["submission_url"]}

    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${post_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_page_count}    ${pre_test_page_count}
    run keyword unless    ${is_equal}    fail    msg=New Pages were created with XSS data

landing_page_data_sync_source_field_input
    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${pre_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}

    # create landing page
    loop through test data on data sync    ${landing_page["button_add"]["source_field_input"]}

    # check page count
    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    ${post_test_page_count}=    get text    ${landing_page["button_list"]["page_count"]}
    ${is_equal}=    run keyword and return status    should be equal    ${post_test_page_count}    ${pre_test_page_count}
    run keyword unless    ${is_equal}    fail    msg=New Pages were created with XSS data

landing_page_rename_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${landing_page}    ${landing_page["button_list"]["list"]}
    \    click element    ${landing_page["button_list"]['first_row']}
    \    click element    ${landing_page["button_list"]['duplicate']}
    \    input text    ${landing_page["button_list"]["rename_input"]}    ${line}
    \    click element    ${landing_page["button_list"]["yes"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

*** Keywords ***
loop through test data on page name
    [Arguments]    ${save_method}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${landing_page}    ${landing_page["button_add"]["add"]}
    \    add block    ${landing_page["button_add"]["button_text"]}
    \    set page name    ${line}
    \    click element    ${save_method}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data.

loop through test data on general properties
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${landing_page}    ${landing_page["button_add"]["add"]}
    \    add block    ${landing_page["button_add"]["button_form"]}
    \    click element    ${landing_page["button_add"]["label_input_field"]}
    \    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_add"]["input_selector"]}
    \    sleep    1
    \    click element at coordinates    ${landing_page["button_add"]["input_selector"]}    0    75
    \    click element    ${landing_page["button_add"]["save_and_schedule"]}
    \    select from list    ${landing_page["button_add"]["redirect_selector"]}    Custom URL
    \    ${is_submit_url}=    run keyword and return status    should contain    ${field}    submitRedirection
    \    run keyword if    ${is_submit_url}    run keywords
    \    ...    create url string    ${line}
    \    ...    AND    click element    ${landing_page["button_add"]["submission_slider"]}
    \    input text    ${field}    ${line}
    \    click element    ${landing_page["button_add"]["save"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data.

loop through test data on data sync
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${landing_page}    ${landing_page["button_add"]["add"]}
    \    add block    ${landing_page["button_add"]["button_form"]}
    \    click element    ${landing_page["button_add"]["label_input_field"]}
    \    wait until keyword succeeds    15x    1 sec    click element    ${landing_page["button_add"]["input_selector"]}
    \    sleep    1
    \    click element at coordinates    ${landing_page["button_add"]["input_selector"]}    0    75
    \    click element    ${landing_page["button_add"]["save_and_schedule"]}
    \    click element    ${landing_page["button_add"]["data_sync_page"]}
    \    click element    ${landing_page["button_add"]["data_sync_button"]}
    \    click element    ${landing_page["button_add"]["activate"]}
    \    click element    ${landing_page["button_add"]["source_field_slider"]}
    \    press key    ${field}    \u0001    # Select All
    \    press key    ${field}    \\127    # Delete
    \    input text    ${field}    ${line}
    \    click element    ${landing_page["button_add"]["save"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data.
