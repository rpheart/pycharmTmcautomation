*** Settings ***
Documentation       will check the input of each of the blns values into the workflow workflows screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
workflow_name
    # Get first item of workflow table
    open content    ${workflow}    ${workflow["button_add"]["add"]}
    ${most_recent_workflow_id}=    get table cell    ${workflow["button_add"]["table"]}    3    1

    # Check xss data in workflow creator
    loop through test data    ${workflow["button_add"]["workflow_name"]}

    # Check no new workflows were created
    open content    ${workflow}    ${workflow["button_add"]["add"]}
    ${post_test_workflow_id}=    get table cell    ${workflow["button_add"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_workflow_id}    ${most_recent_workflow_id}
    run keyword unless    ${is_equal}    fail    msg=New workflows were created with XSS data

workflow_description
    # Get first item of workflow table
    open content    ${workflow}    ${workflow["button_add"]["add"]}
    ${most_recent_workflow_id}=    get table cell    ${workflow["button_add"]["table"]}    3    1

    # Check xss data in workflow creator
    loop through test data    ${workflow["button_add"]["workflow_description"]}

    # Check no new workflows were created
    open content    ${workflow}    ${workflow["button_add"]["add"]}
    ${post_test_workflow_id}=    get table cell    ${workflow["button_add"]["table"]}    3    1
    ${is_equal}=    run keyword and return status    should be equal as strings    ${post_test_workflow_id}    ${most_recent_workflow_id}
    run keyword unless    ${is_equal}    fail    msg=New workflows were created with XSS data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${workflow}    ${workflow["button_add"]["add"]}
    \    wait until keyword succeeds    30x    1 sec    click element    ${generics["create_new"]}
    \    wait until keyword succeeds    30x    1 sec    click element    ${workflow["button_add"]["model_radio_button"]}
    \    wait until keyword succeeds    30x    1 sec    click element    ${generics["next"]}
    \    input text    ${workflow["button_add"]["workflow_name"]}    Name
    \    input text    ${field}    ${line}
    \    click element    ${workflow["button_add"]["first_manager_checkbox"]}
    \    click element    ${generics["save"]}
    \    check for bad request    ${line}    @{failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
