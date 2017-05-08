*** Settings ***
Documentation       will check the input of each of the blns values into the create classic message builder screen
Resource            ../../../Utils/email_keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
classic_message_search
    verify xss data on search field    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}

message_name
    # Get first item of  classic message table
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    wait until element is visible     ${classic_message_builder["button_list"]["table"]}
    ${most_recent_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1

    # Check xss data in name field
    loop through test data      ${classic_message_builder["button_add"]["message_name_input"]}

    # Check no new messages were created
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    ${post_test_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_classic_message_id}    ${most_recent_classic_message_id}
    run keyword unless    ${is_equal}    fail    msg=New classic messages were created with XSS data

message_description
    # Get first item of  classic message table
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    wait until element is visible     ${classic_message_builder["button_list"]["table"]}
    ${most_recent_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1

    # Check xss data in description field
    loop through test data      ${classic_message_builder["button_add"]["message_description_input"]}

    # Check no new messages were created
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    ${post_test_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_classic_message_id}    ${most_recent_classic_message_id}
    run keyword unless    ${is_equal}    fail    msg=New classic messages were created with XSS data

message_from
    # Get first item of  classic message table
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    wait until element is visible     ${classic_message_builder["button_list"]["table"]}
    ${most_recent_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1

    # Check xss data in from field
    loop through test data      ${classic_message_builder["button_add"]["message_from_input"]}

    # Check no new messages were created
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    ${post_test_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_classic_message_id}    ${most_recent_classic_message_id}
    run keyword unless    ${is_equal}    fail    msg=New classic messages were created with XSS data

message_to
    # Get first item of  classic message table
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    wait until element is visible     ${classic_message_builder["button_list"]["table"]}
    ${most_recent_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1

    # Check xss data in to field
    loop through test data      ${classic_message_builder["button_add"]["message_to_input"]}

    # Check no new messages were created
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    ${post_test_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_classic_message_id}    ${most_recent_classic_message_id}
    run keyword unless    ${is_equal}    fail    msg=New classic messages were created with XSS data

message_subject
    # Get first item of  classic message table
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    wait until element is visible     ${classic_message_builder["button_list"]["table"]}
    ${most_recent_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1

    # Check xss data in message subject field
    loop through test data      ${classic_message_builder["button_add"]["message_subject_input"]}

    # Check no new messages were created
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    ${post_test_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_classic_message_id}    ${most_recent_classic_message_id}
    run keyword unless    ${is_equal}    fail    msg=New classic messages were created with XSS data

message_reply_to_email_address
    # Get first item of  classic message table
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    wait until element is visible     ${classic_message_builder["button_list"]["table"]}
    ${most_recent_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1

    # Check xss data in reply to email address field
    loop through test data      ${classic_message_builder["button_add"]["message_reply_to_email_input"]}

    # Check no new messages were created
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    ${post_test_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_classic_message_id}    ${most_recent_classic_message_id}
    run keyword unless    ${is_equal}    fail    msg=New classic messages were created with XSS data

message_reply_to_label
    # Get first item of  classic message table
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    wait until element is visible     ${classic_message_builder["button_list"]["table"]}
    ${most_recent_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1

    # Check xss data in reply to label field
    loop through test data      ${classic_message_builder["button_add"]["message_reply_to_label_input"]}

    # Check no new messages were created
    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    ${post_test_classic_message_id}=    get table cell    ${classic_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_classic_message_id}    ${most_recent_classic_message_id}
    run keyword unless    ${is_equal}    fail    msg=New classic messages were created with XSS data

message_content_upload_url
    # Check xss data in content upload url field
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   content upload xss insertion     ${line}
    \   check for bad request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["content_upload"]["link"]}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_rename_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${classic_message_builder}    ${classic_message_builder["button_list"]["list"]}
    \    click element    ${classic_message_builder["button_list"]["copy"]}
    \    input text    ${classic_message_builder["button_list"]["rename_input"]}    ${line}
    \    click element    ${generics["save"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \    open message header
    \    input text    ${classic_message_builder["button_add"]["message_name_input"]}    Name
    \    input text    ${classic_message_builder["button_add"]["message_reply_to_email_input"]}    test@robot.com
    \    input text    ${classic_message_builder["button_add"]["message_subject_input"]}    xss test
    \    ${is_email}=    run keyword and return status    should contain     ${field}    messageReplyToEmail
    \    run keyword if     ${is_email}    create email string     ${line}
    \    input text    ${field}    ${line}
    \    click element    ${classic_message_builder["button_add"]["save_button"]}
    \    check for bad request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

open message header
    click element    ${classic_message_builder["button_add"]["header_accordion"]}
    wait until element is visible    ${classic_message_builder["button_add"]["message_name_input"]}
