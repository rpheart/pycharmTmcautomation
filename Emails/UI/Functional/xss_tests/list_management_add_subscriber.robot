*** Settings ***
Documentation       will check the input of each of the blns values into the add subscriber screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords    login
...                 AND    go to ${system_page["email"]}
...                 AND    delete subscribers
Suite Teardown      run keywords    delete subscribers
...                 AND    close all browsers

*** Test Cases ***
add_subscriber_firstname
    loop through test data    ${add_subscriber["button_add"]["input_fields"]["firstname"]}

add_subscriber_lastname
    loop through test data    ${add_subscriber["button_add"]["input_fields"]["lastname"]}

add_subscriber_email_original
    loop through test data    ${add_subscriber["button_add"]["input_fields"]["email_original"]}

add_subscriber_email
    loop through test data    ${add_subscriber["button_add"]["input_fields"]["email"]}

add_subscriber_title
    loop through test data    ${add_subscriber["button_add"]["input_fields"]["title"]}

add_subscriber_client_urn
    loop through test data    ${add_subscriber["button_add"]["input_fields"]["client_urn"]}

add_subscriber_source
    loop through test data    ${add_subscriber["button_add"]["input_fields"]["source"]}

add_subscriber_segment
    loop through test data    ${add_subscriber["button_add"]["input_fields"]["segment"]}

search_for_added_subscribers
    open content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    wait until element is visible    ${search_subscriber["button_add"]["search_button"]}    timeout=30
    select from list    ${search_subscriber["button_add"]["numeric_field_combo"]}    EMVCELLPHONE
    select from list    ${search_subscriber["button_add"]["numeric_field_operator"]}    equals
    input text    ${search_subscriber["button_add"]["numeric_field_value"]}    777
    click element    ${search_subscriber["button_add"]["numeric_search"]}
    wait until element is visible    ${search_subscriber["button_add"]["text_search"]}    timeout=30
    click element    ${search_subscriber["button_add"]["text_search"]}
    wait until element is visible    ${search_subscriber["button_add"]["member_count"]}    timeout=30
    ${subscribers}=    run keyword and return status    element text should be    ${search_subscriber["button_add"]["member_count"]}    0
    run keyword if    ${subscribers} == False    Fail    msg=Members were created using xss data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${add_subscriber}    ${add_subscriber["button_add"]["add"]}
    \    wait until element is visible    ${field}    timeout=30
    \    input text    ${add_subscriber["button_add"]["input_fields"]["emv_cellphone"]}    777
    \    input text    ${add_subscriber["button_add"]["input_fields"]["email"]}    test@test.com
    \    ${is_email}=    run keyword and return status    should contain    ${field}    (EMAIL)
    \    run keyword if    ${is_email}    run keywords    create email string    ${line}
    \    ...    AND    input text    ${field}    ${line}
    \    ...    ELSE    input text    ${field}    ${line}
    \    click element    ${add_subscriber["button_add"]["save_member"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

delete subscribers
    open content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    wait until element is visible    ${search_subscriber["button_add"]["search_button"]}    timeout=30
    select from list    ${search_subscriber["button_add"]["numeric_field_combo"]}    EMVCELLPHONE
    select from list    ${search_subscriber["button_add"]["numeric_field_operator"]}    equals
    input text    ${search_subscriber["button_add"]["numeric_field_value"]}    777
    click element    ${search_subscriber["button_add"]["numeric_search"]}
    wait until element is visible    ${search_subscriber["button_add"]["text_search"]}    timeout=30
    click element    ${search_subscriber["button_add"]["text_search"]}
    wait until element is visible    ${search_subscriber["button_add"]["member_count"]}    timeout=30
    :for    ${n}    in range    100  # TODO Turn this into a while false loop
    \    wait until element is visible    ${search_subscriber["button_add"]["member_count"]}    timeout=30
    \    ${subscribers}=    run keyword and return status    element text should be    ${search_subscriber["button_add"]["member_count"]}    0
    \    run keyword if    ${subscribers} == False    run keywords    click element    ${generics["select_all"]}
    \    ...    AND    click element    ${generics["trash"]}
    \    ...    AND    click element    ${search_subscriber["button_add"]["delete_members"]}
    \    run keyword if    ${subscribers}    exit for loop
