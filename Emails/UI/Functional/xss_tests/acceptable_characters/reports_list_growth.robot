*** Settings ***
Documentation       will check the input of unicode values into the list growth reports screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    non_xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
list_growth_reports_search
    verify non xss data on search field    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}

list_growth_report_name
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    \    wait until element is visible    ${generics["create_new"]}
    \    click element    ${generics["create_new"]}
    \    input text    ${list_growth_reports["button_add"]["create_new"]["report_name"]}    ${line}
    \    click element    ${list_growth_reports["button_add"]["create_new"]["create_report"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

list_growth_search_segments
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    open content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    \    wait until element is visible    ${generics["create_new"]}
    \    click element    ${generics["create_new"]}
    \    click element    ${list_growth_reports["button_add"]["create_new"]["segments_radio"]}
    \    click element    ${list_growth_reports["button_add"]["create_new"]["segments_list"]}
    \    input text    ${list_growth_reports["button_add"]["create_new"]["segments_search_input"]}    ${line}
    \    sleep    0.5
    \    click element    ${list_growth_reports["button_add"]["create_new"]["segments_search_button"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
