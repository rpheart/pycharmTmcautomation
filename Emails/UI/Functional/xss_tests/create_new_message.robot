*** Settings ***
Documentation       will check the input of each of the blns values into the create new message builder search screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/new_message_builder.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
...                 AND    set selenium speed    0.4
Suite Teardown      close all browsers

*** Test Cases ***
new_message_search
    verify xss data on search field    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}

new_message_search_content_blocks
    search content block

new_message_search_templates
    search templates

new_message_save_as_template_name
    save as a template

#new_message_name_save_as_a_template
#    loop through test data on message name    ${new_message_builder["button_add"]["message_name_input"]}    ${new_message_builder["button_add"]["save_as_a_template"]}

new_message_name_save
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data on message name    ${new_message_builder["button_add"]["message_name_input"]}    ${new_message_builder["button_add"]["save"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

new_message_name_save_and_finalize
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data on message name    ${new_message_builder["button_add"]["message_name_input"]}    ${new_message_builder["button_add"]["save_and_finalize"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

#new_message_company_sender_save_as_template
#    loop through test data    ${new_message_builder["button_add"]["company_sender"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_as_a_template"]}

new_message_company_sender_save
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["company_sender"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

new_message_company_sender_save_and_finalise
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["company_sender"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_and_finalize"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

#new_message_reply_to_email_save_as_template
#    loop through test data    ${new_message_builder["button_add"]["reply_to_email"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_as_a_template"]}

new_message_reply_to_email_save
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["reply_to_email"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

new_message_reply_to_email_save_and_finalise
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["reply_to_email"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_and_finalize"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

#new_message_reply_to_label_save_as_template
#    loop through test data    ${new_message_builder["button_add"]["reply_to_label"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_as_a_template"]}

new_message_reply_to_label_save
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["reply_to_label"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

new_message_reply_to_label_save_and_finalise
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["reply_to_label"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_and_finalize"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

#new_message_subject_save_as_template
#    loop through test data    ${new_message_builder["button_add"]["subject"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_as_a_template"]}

new_message_subject_save
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["subject"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

new_message_subject_save_and_finalise
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["subject"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_and_finalize"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

new_message_send_to_save
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["send_to"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

new_message_send_to_save_and_finalise
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data    ${new_message_builder["button_add"]["send_to"]}    ${new_message_builder["button_add"]["headers"]}    ${new_message_builder["button_add"]["save_and_finalize"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

new_message_send_test_add_recipients
    # count current messages
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${pre_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}

    # create message
    loop through test data and send test email    ${new_message_builder["button_add"]["add_recipients"]}

    # check message count
    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    ${post_test_message_count}=    get text    ${new_message_builder["button_list"]["message_count"]}
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_message_count}    ${pre_test_message_count}
    run keyword unless    ${is_equal}    fail    msg=New Messages were created with XSS data

#new_message_send_test_search_recipients
#    loop through test data and send test email    ${new_message_builder["button_add"]["send_test_search_button"]}

new_message_rename_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${new_message_builder}    ${new_message_builder["button_list"]["list"]}
    \    click element    ${new_message_builder["button_list"]['first_row']}
    \    click element    ${new_message_builder["button_list"]['duplicate']}
    \    input text    ${new_message_builder["button_list"]["rename_input"]}    ${line}
    \    click element    ${new_message_builder["button_list"]["duplicate_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

*** Keywords ***
search content block
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    \    wait until keyword succeeds    15x    1 sec    click element    ${new_message_builder["button_add"]["content_blocks"]}
    \    wait until keyword succeeds    15x    1 sec    input text    ${new_message_builder["button_add"]["content_block_search_input"]}    ${line}
    \    click element    ${new_message_builder["button_add"]["content_block_search_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

search templates
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    \    wait until keyword succeeds    15x    1 sec    click element    ${new_message_builder["button_add"]["content_blocks"]}
    \    wait until keyword succeeds    15x    1 sec    click element    ${new_message_builder["button_add"]["templates"]}
    \    wait until keyword succeeds    15x    1 sec    input text    ${new_message_builder["button_add"]["templates_search_input"]}    ${line}
    \    click element    ${new_message_builder["button_add"]["templates_search_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

save as a template
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    \    add widget to canvas    ${new_message_builder["button_add"]["text_widget"]}
    \    sleep    1
    \    set mandatory headers
    \    click element    ${new_message_builder["button_add"]["save_as_a_template"]}
    \    input text    ${new_message_builder["button_add"]["save_template_input"]}    ${line}
    \    click element    ${new_message_builder["button_add"]["save_template_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data on message name
    [Arguments]    ${field}    ${save_method}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    \    add widget to canvas    ${new_message_builder["button_add"]["text_widget"]}
    \    sleep    1
    \    set mandatory headers
    \    set message name    ${line}
    \    ${is_template}=    run keyword and return status    should contain    ${save_method}    btnsaveastemplate
    \    run keyword if    ${is_template}    run keywords
    \    ...    click element    ${save_method}
    \    ...    AND    input text    ${new_message_builder["button_add"]["save_template_input"]}    Test
    \    ...    AND    click element    ${new_message_builder["button_add"]["save_template_button"]}
    \    click element    ${save_method}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data
    [Arguments]    ${field}    ${tab}    ${save_method}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    \    add widget to canvas    ${new_message_builder["button_add"]["text_widget"]}
    \    sleep    1
    \    set mandatory headers
    \    click element    ${tab}
    \    ${is_email}=     run keyword and return status    should contain    ${field}    replyToEmail
    \    run keyword if    ${is_email}    create email string    ${line}
    \    input text    ${field}    ${line}
    \    ${is_template}=    run keyword and return status    should contain    ${save_method}    btnsaveastemplate
    \    run keyword if    ${is_template}    run keywords
    \    ...    click element    ${save_method}
    \    ...    AND    input text    ${new_message_builder["button_add"]["save_template_input"]}    Test
    \    ...    AND    click element    ${new_message_builder["button_add"]["save_template_button"]}
    \    click element    ${save_method}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

loop through test data and send test email
    [Arguments]    ${button}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    create email string    ${line}
    \    open content    ${new_message_builder}    ${new_message_builder["button_add"]["add"]}
    \    add widget to canvas    ${new_message_builder["button_add"]["text_widget"]}
    \    sleep    1
    \    set mandatory headers
    \    wait until keyword succeeds    15x   1 sec    click element    ${new_message_builder["button_add"]["save"]}
    \    open tests
    \    wait until keyword succeeds    15x   1 sec    input text     ${new_message_builder["button_add"]["send_test_search_input"]}    ${line}
    \    wait until keyword succeeds    15x   1 sec    click element    ${button}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

open tests
    :for    ${n}    in range    10
    \    ${tests_open}=    run keyword and return status    element should be visible    ${new_message_builder["button_add"]["test_panel"]}
    \    exit for loop if    ${tests_open}
    \    wait until keyword succeeds    15x   1 sec    click element    ${new_message_builder["button_add"]["tests"]}
