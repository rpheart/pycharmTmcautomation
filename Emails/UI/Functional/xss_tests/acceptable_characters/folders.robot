*** Settings ***
Documentation       will check the input of unicode values into the folders screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    non_xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
folders_name
    # Get name of first folder
    go to ${folders["menu"]}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible    ${folders["button_add"]["first_folder"]}    timeout=60
    ${latest_folder_name}=    get text    ${folders["button_add"]["first_folder"]}

    # Check xss data in name field
    loop through test data      ${folders["button_add"]["new_directory_name"]}

    # Check no new folders were created
    go to ${folders["menu"]}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible    ${folders["button_add"]["first_folder"]}    timeout=60
    ${post_test_folder_name}=    get text    ${folders["button_add"]["first_folder"]}
    ${is_equal}=    run keyword and return status    should not be equal as strings    ${post_test_folder_name}    ${latest_folder_name}
    run keyword unless    ${is_equal}    fail    msg=No new folders were created with non-XSS data

folders_description
    # Get name of first folder
    go to ${folders["menu"]}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible    ${folders["button_add"]["first_folder"]}    timeout=60
    ${latest_folder_name}=    get text    ${folders["button_add"]["first_folder"]}

    # Check xss data in name field
    loop through test data      ${folders["button_add"]["new_directory_description"]}

    # Check no new folders were created
    go to ${folders["menu"]}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible    ${folders["button_add"]["first_folder"]}    timeout=60
    ${post_test_folder_name}=    get text    ${folders["button_add"]["first_folder"]}
    ${is_equal}=    run keyword and return status    should not be equal as strings    ${post_test_folder_name}    ${latest_folder_name}
    run keyword unless    ${is_equal}    fail    msg=No new folders were created with non-XSS data

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    go to ${folders["menu"]}
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    wait until element is visible    ${field}    timeout=60
    \    input text    ${folders["button_add"]["new_directory_name"]}    Name
    \    input text    ${field}    ${line}
    \    click element    ${generics["save"]}
    \    check for good request     ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${field}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failure, check the file
