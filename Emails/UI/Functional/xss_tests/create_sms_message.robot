*** Settings ***
Documentation       will check the input of each of the blns values into the create sms message builder fields
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
sms_message_search
    verify xss data on search field    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}

sms_name
    # Get first item of sms message table
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    ${most_recent_sms_message_id}=    get table cell    ${sms_message_builder["button_list"]["table"]}    3    1

    # Check xss data in sms message builder
    loop through test data      ${sms_message_builder["button_add"]["sms_message_name"]}

    # Check no new sms messages were created
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    ${post_test_sms_message_id}=    get table cell    ${sms_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_sms_message_id}    ${most_recent_sms_message_id}
    run keyword unless    ${is_equal}    fail    msg=New sms messages were created with XSS data

sms_description
    # Get first item of sms message table
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    ${most_recent_sms_message_id}=    get table cell    ${sms_message_builder["button_list"]["table"]}    3    1

    # Check xss data in sms message builder
    loop through test data      ${sms_message_builder["button_add"]["sms_message_description"]}

    # Check no new sms messages were created
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    ${post_test_sms_message_id}=    get table cell    ${sms_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_sms_message_id}    ${most_recent_sms_message_id}
    run keyword unless    ${is_equal}    fail    msg=New sms messages were created with XSS data

sms_from
    # Get first item of sms message table
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    ${most_recent_sms_message_id}=    get table cell    ${sms_message_builder["button_list"]["table"]}    3    1

    # Check xss data in sms message builder
    loop through test data      ${sms_message_builder["button_add"]["sms_message_from"]}

    # Check no new sms messages were created
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    ${post_test_sms_message_id}=    get table cell    ${sms_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_sms_message_id}    ${most_recent_sms_message_id}
    run keyword unless    ${is_equal}    fail    msg=New sms messages were created with XSS data

sms_body
    # Get first item of sms message table
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    ${most_recent_sms_message_id}=    get table cell    ${sms_message_builder["button_list"]["table"]}    3    1

    # Check xss data in sms message builder
    loop through test data      ${sms_message_builder["button_add"]["sms_message_body"]}

    # Check no new sms messages were created
    open content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    ${post_test_sms_message_id}=    get table cell    ${sms_message_builder["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_sms_message_id}    ${most_recent_sms_message_id}
    run keyword unless    ${is_equal}    fail    msg=New sms messages were created with XSS data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \    open content    ${sms_message_builder}    ${sms_message_builder["button_add"]["add"]}
    \    wait until element is visible    ${field}
    \    input text    ${sms_message_builder["button_add"]["sms_message_name"]}    Name        # gets over-written if the field being tested is name itself!!
    \    input text    ${sms_message_builder["button_add"]["sms_message_body"]}    Body        # gets over-written if the field being tested is body itself!!
    \    input text    ${field}    ${line}
    \    click element    ${generics["save"]}
    \    check for bad request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file
