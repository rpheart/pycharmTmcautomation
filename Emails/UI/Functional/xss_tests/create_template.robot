*** Settings ***
Documentation       will check the input of each of the blns values into the  template fields
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
template_name
    # Get first item of template table
    open content    ${template}    ${template["button_list"]["list"]}
    wait until element is visible     ${template["button_list"]["table"]}     timeout=30
    ${most_recent_template_id}=    get table cell    ${template["button_list"]["table"]}    3    1

    # Check xss data in tempate builder
    loop through test data      ${template["button_add"]["template_name"]}

    # Check no new templates were created
    open content    ${template}    ${template["button_list"]["list"]}
    ${post_test_template_id}=    get table cell    ${template["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_template_id}    ${most_recent_template_id}
    run keyword unless    ${is_equal}    fail    msg=New templates were created with XSS data

template_description
    # Get first item of template table
    open content    ${template}    ${template["button_list"]["list"]}
    wait until element is visible     ${template["button_list"]["table"]}     timeout=30
    ${most_recent_template_id}=    get table cell    ${template["button_list"]["table"]}    3    1

    # Check xss data in tempate builder
    loop through test data      ${template["button_add"]["template_description"]}

    # Check no new templates were created
    open content    ${template}    ${template["button_list"]["list"]}
    ${post_test_template_id}=    get table cell    ${template["button_list"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as integers    ${post_test_template_id}    ${most_recent_template_id}
    run keyword unless    ${is_equal}    fail    msg=New templates were created with XSS data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    Create List
    :for    ${line}    In     @{xss_test_data}
    \    open content    ${template}    ${template["button_add"]["add"]}
    \    wait until element is visible    ${field}
    \    input text    ${template["button_add"]["template_name"]}    Name        # gets over-written if the field being tested is name itself!!
    \    input text    ${field}    ${line}
    \    ${file_path}=    catenate    SEPARATOR=    ${EXECDIR}    \\Emails\\UI\\Utils\\Resources\\easter_eggs.dwt
    \    choose file      ${template["button_add"]["upload_file"]}   ${file_path}
    \    click element    ${template["button_add"]["import_file"]}
    \    wait until element is visible    ${template["button_add"]["save"]}
    \    click element    ${generics["save"]}
    \    check for bad request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file
