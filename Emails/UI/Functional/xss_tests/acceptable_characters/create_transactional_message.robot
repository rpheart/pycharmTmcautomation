*** Settings ***
Documentation       will check the input of unicode values into the transactional message screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    non_xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
transactional_message_name
    # Get first item of transactional message table
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${most_recent_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1

    # Check xss data in transactional message creator
    loop through test data    ${transactional_message["button_add"]["name"]}

    # Check no new message was created
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${post_test_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_message_id}    ${most_recent_message_id}
    run keyword unless    ${is_equal}    fail    msg=No new messages were created with non-XSS data

transactional_message_description
    # Get first item of transactional message table
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${most_recent_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1

    # Check xss data in transactional message creator
    loop through test data    ${transactional_message["button_add"]["description"]}

    # Check no new message was created
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${post_test_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_message_id}    ${most_recent_message_id}
    run keyword unless    ${is_equal}    fail    msg=No new messages were created with non-XSS data

transactional_message_message_from
    # Get first item of transactional message table
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${most_recent_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1

    # Check xss data in transactional message creator
    loop through test data    ${transactional_message["button_add"]["message_from"]}

    # Check no new message was created
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${post_test_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_message_id}    ${most_recent_message_id}
    run keyword unless    ${is_equal}    fail    msg=No new messages were created with non-XSS data

transactional_message_message_to
    # Get first item of transactional message table
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${most_recent_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1

    # Check xss data in transactional message creator
    loop through test data    ${transactional_message["button_add"]["message_to"]}

    # Check no new message was created
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${post_test_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_message_id}    ${most_recent_message_id}
    run keyword unless    ${is_equal}    fail    msg=No new messages were created with non-XSS data

transactional_message_message_subject
    # Get first item of transactional message table
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${most_recent_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1

    # Check xss data in transactional message creator
    loop through test data    ${transactional_message["button_add"]["message_subject"]}

    # Check no new message was created
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${post_test_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_message_id}    ${most_recent_message_id}
    run keyword unless    ${is_equal}    fail    msg=No new messages were created with non-XSS data

transactional_message_message_reply_to_emails
    # Get first item of transactional message table
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${most_recent_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1

    # Check xss data in transactional message creator
    loop through test data    ${transactional_message["button_add"]["message_reply_to_emails"]}

    # Check no new message was created
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${post_test_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_message_id}    ${most_recent_message_id}
    run keyword unless    ${is_equal}    fail    msg=No new messages were created with non-XSS data

transactional_message_message_reply_to
    # Get first item of transactional message table
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${most_recent_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1

    # Check xss data in transactional message creator
    loop through test data    ${transactional_message["button_add"]["message_reply_to"]}

    # Check no new message was created
    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    ${post_test_message_id}=    get table cell    ${transactional_message["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should not be equal as integers    ${post_test_message_id}    ${most_recent_message_id}
    run keyword unless    ${is_equal}    fail    msg=No new messages were created with non-XSS data

transactional_message_search
    verify non xss data on search field    ${transactional_message}    ${transactional_message["button_list"]["list"]}

transactional_message_rename_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${transactional_message}    ${transactional_message["button_list"]["list"]}
    \    click element    ${generics['copy']}
    \    input text    ${transactional_message["button_add"]["message_rename_input"]}    ${line}
    \    click element    ${generics['save']}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${transactional_message}    ${transactional_message["button_add"]["add"]}
    \    wait until element is visible    ${transactional_message["button_add"]["message_reply_to_emails"]}
    \    input text    ${transactional_message["button_add"]["message_reply_to_emails"]}    test@test.com
    \    ${is_email}=    run keyword and return status    should contain    ${field}    ReplyToEmail
    \    run keyword if    ${is_email}    run keywords    create email string    ${line}
    \    ...    AND    input text    ${field}    ${line}
    \    ...    ELSE    input text    ${field}    ${line}
    \    click element    ${generics["save"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
