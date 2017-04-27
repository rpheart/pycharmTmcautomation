*** Settings ***
Documentation       will check the input of each of the blns values into the create classic message builder screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
message_link_management_standard_link_name_only_save
    # Check xss data in link managment name field for standard link
    ${field}=   set variable     ${generics["link_management"]["link_type_name"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion  ${generics["link_management"]["create_standard_link_btn"]}      ${field}      ${line}    ${generics["link_management"]["save_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_link_management_standard_link_name_save&add
    # Check xss data in link managment url field for standard link
    ${field}=   set variable     ${generics["link_management"]["link_type_name"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion   ${generics["link_management"]["create_standard_link_btn"]}      ${field}      ${line}   ${generics["link_management"]["save&add_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_link_management_standard_link_url_only_save
    # Check xss data in link managment name field
    ${field}=   set variable     ${generics["link_management"]["link_type_url"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion  ${generics["link_management"]["create_standard_link_btn"]}      ${field}      ${line}    ${generics["link_management"]["save_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_link_management_standard_link_url_save&add
    # Check xss data in link managment name field
    ${field}=   set variable     ${generics["link_management"]["link_type_url"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion  ${generics["link_management"]["create_standard_link_btn"]}      ${field}      ${line}    ${generics["link_management"]["save&add_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_link_management_unsubscribe_link_name_only_save
    # Check xss data in link managment name field
    ${field}=   set variable     ${generics["link_management"]["link_type_name"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion  ${generics["link_management"]["create_unsubscribe_link_btn"]}      ${field}      ${line}    ${generics["link_management"]["save_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_link_management_unsubscribe_link_name_save&add
    # Check xss data in link managment name field
    ${field}=   set variable     ${generics["link_management"]["link_type_name"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion  ${generics["link_management"]["create_unsubscribe_link_btn"]}      ${field}      ${line}    ${generics["link_management"]["save&add_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_link_management_unsubscribe_link_pageOK_only_save
    # Check xss data in link managment name field
    ${field}=   set variable     ${generics["link_management"]["page_ok"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion  ${generics["link_management"]["create_unsubscribe_link_btn"]}      ${field}      ${line}    ${generics["link_management"]["save_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_link_management_unsubscribe_link_pageOK_save&add
    # Check xss data in link managment name field
    ${field}=   set variable     ${generics["link_management"]["page_ok"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion  ${generics["link_management"]["create_unsubscribe_link_btn"]}      ${field}      ${line}    ${generics["link_management"]["save&add_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file

message_link_management_unsubscribe_link_pageError_only_save
    # Check xss data in link managment name field
    ${field}=   set variable     ${generics["link_management"]["page_error"]}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \   open content    ${classic_message_builder}    ${classic_message_builder["button_add"]["add"]}
    \   link management xss insertion  ${generics["link_management"]["create_unsubscribe_link_btn"]}      ${field}      ${line}    ${generics["link_management"]["save_link"]}
    \   check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}     @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file
