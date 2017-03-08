*** Settings ***
Documentation       will check the input of unicode values into the create webform screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
webform_search
    verify non xss data on search field    ${webform}    ${webform["button_list"]["list"]}

webform_step_1_name
    loop through test data step 1    ${webform["button_add"]["name"]}

webform_step_1_description
    loop through test data step 1    ${webform["button_add"]["description"]}

webform_step_1_confirm_url
    loop through test data step 1    ${webform["button_add"]["confirm_url"]}

webform_step_1_error_url
    loop through test data step 1    ${webform["button_add"]["error_url"]}

webform_step_2_duplicate_url
    loop through test data step 2    ${webform["button_add"]["dupe_url"]}

webform_step_2_display_name
    loop through test data step 2    ${webform["button_add"]["display_name"]}

webform_step_2_default_value
    loop through test data step 2    ${webform["button_add"]["default_value"]}

webform_step_3_service_email
    # Grab id of latest webform
    open content    ${webform}    ${webform["button_list"]["list"]}
    wait until element is visible    ${webform["button_list"]["table"]}
    ${latest_webform_id}=    get table cell    ${webform["button_list"]["table"]}    3    1

    # Check xss data on webform field description
    loop through test data step 3    ${webform["button_add"]["service_email_address"]}

    # Check no new webforms were created
    open content    ${webform}    ${webform["button_list"]["list"]}
    ${post_test_webform_id}=    get table cell    ${webform["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_webform_id}    ${latest_webform_id}
    run keyword unless    ${is_equal}    fail    msg=No new Webforms were created with non-XSS data

webform_step_3_reply_to_email
    # Grab id of latest webform
    open content    ${webform}    ${webform["button_list"]["list"]}
    wait until element is visible    ${webform["button_list"]["table"]}
    ${latest_webform_id}=    get table cell    ${webform["button_list"]["table"]}    3    1

    # Check xss data on webform field description
    loop through test data step 3    ${webform["button_add"]["reply_to_email"]}

    # Check no new webforms were created
    open content    ${webform}    ${webform["button_list"]["list"]}
    ${post_test_webform_id}=    get table cell    ${webform["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_webform_id}    ${latest_webform_id}
    run keyword unless    ${is_equal}    fail    msg=No new Webforms were created with non-XSS data

webform_step_3_search
    loop through test data step 3    ${webform["button_list"]["search_input"]}

*** Keywords ***
loop through test data step 1
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    # Step 1 defaults
    \    open content    ${webform}    ${webform["button_add"]["add"]}
    \    wait until element is visible    ${webform["button_add"]["name"]}
    \    input text    ${webform["button_add"]["name"]}    Name
    \    select from list by label    ${webform["button_add"]["select_languages"]}    English
    \    click element    ${webform["button_add"]["select_date"]}
    \    click element    ${webform["button_add"]["today_date"]}
    \    input text    ${webform["button_add"]["confirm_url"]}    http://www.test.com
    \    input text    ${webform["button_add"]["error_url"]}    http://www.test.com
    # Test begins
    \    ${is_url}=    run keyword and return status    should contain    ${field}    Url
    \    run keyword if    ${is_url}    create url string    ${line}
    \    input text    ${field}    ${line}
    \    click element    ${webform["button_add"]["next_step"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data step 2
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    # Step 1 defaults
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${webform}    ${webform["button_add"]["add"]}
    \    wait until element is visible    ${webform["button_add"]["name"]}
    \    input text    ${webform["button_add"]["name"]}    Name
    \    select from list by label    ${webform["button_add"]["select_languages"]}    English
    \    click element    ${webform["button_add"]["select_date"]}
    \    click element    ${webform["button_add"]["today_date"]}
    \    input text    ${webform["button_add"]["confirm_url"]}    http://www.test.com
    \    input text    ${webform["button_add"]["error_url"]}    http://www.test.com
    \    click element    ${webform["button_add"]["next_step"]}
    # Step 2 defaults
    \    select from list by label    ${webform["button_add"]["webform_type"]}    Subscription webform (do not allow duplicate Emails)
    \    select from list by label    ${webform["button_add"]["field_name"]}    EMAIL
    \    select from list by label    ${webform["button_add"]["input_type"]}    TEXT
    \    select from list by label    ${webform["button_add"]["validation_type"]}    NONE
    \    input text    ${webform["button_add"]["dupe_url"]}    http://www.test.com
    \    input text    ${webform["button_add"]["display_name"]}    Name
    # Test begins
    \    ${is_url}    run keyword and return status    should contain    ${field}    Url
    \    run keyword if    ${is_url}    create url string    ${line}
    \    input text    ${field}    ${line}
    \    click element    ${webform["button_add"]["next_step"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data step 3
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    # Step 1 defaults
    \    open content    ${webform}    ${webform["button_add"]["add"]}
    \    wait until element is visible    ${webform["button_add"]["name"]}
    \    input text    ${webform["button_add"]["name"]}    Name
    \    select from list by label    ${webform["button_add"]["select_languages"]}    English
    \    click element    ${webform["button_add"]["select_date"]}
    \    click element    ${webform["button_add"]["today_date"]}
    \    input text    ${webform["button_add"]["confirm_url"]}    http://www.test.com
    \    input text    ${webform["button_add"]["error_url"]}    http://www.test.com
    \    click element    ${webform["button_add"]["next_step"]}
    # Step 2 defaults
    \    select from list by label    ${webform["button_add"]["webform_type"]}    Subscription webform (do not allow duplicate Emails)
    \    select from list by label    ${webform["button_add"]["field_name"]}    EMAIL
    \    select from list by label    ${webform["button_add"]["input_type"]}    TEXT
    \    select from list by label    ${webform["button_add"]["validation_type"]}    NONE
    \    input text    ${webform["button_add"]["dupe_url"]}    http://www.test.com
    \    input text    ${webform["button_add"]["display_name"]}    Name
    \    click element    ${webform["button_add"]["next_step"]}
    # Step 3 defaults
    \    select from list by label    ${webform["button_add"]["bounce_back_type"]}    User AND your company customer service
    \    input text    ${webform["button_add"]["service_email_address"]}    test@test.com
    \    input text    ${webform["button_add"]["reply_to_email"]}    test@test.com
    \    click element    //input[@name='messageId']
    \    click element    //input[@name='messageIdToManager']
    # Test begins
    \    ${is_search}    run keyword and return status    should contain    ${field}    search
    \    run keyword if    ${is_search}    run keywords
    \    ...    input text    ${field}    ${line}
    \    ...    AND    click element    ${generics["search_button"]}
    \    ...    ELSE    run keywords
    \    ...    create email string    ${line}
    \    ...    AND    input text    ${field}    ${line}
    \    ...    AND    click element    ${webform["button_add"]["save_webform"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
