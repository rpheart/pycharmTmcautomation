*** Settings ***
Documentation       will check the input of unicode values into the image library screen
Resource            ../../../Utils/keywords.robot
Resource            ../../../Utils/xss_keywords.robot
Default Tags        ui    email    non_xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
image_library_search
    @{failed_inputs}=    create list
    :for    ${line}    in     @{non_xss_test_data}
    \    go to ${image_library["menu"]}
    \    wait until element is visible    ${navigation_bar}
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    wait until element is visible    ${generics["search_input"]}
    \    input text    ${generics["search_input"]}    ${line}
    \    click element    ${generics["search_button"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

image_library_create_new_folder
    @{failed_inputs}=    create list
    :FOR    ${line}    In     @{non_xss_test_data}
    \    go to ${image_library["menu"]}
    \    wait until element is visible    ${navigation_bar}
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    wait until keyword succeeds    15x    1 sec    click element    ${image_library["button_add"]["create_new_folder"]}
    \    input text    xpath=//input[contains(@class, 'create-folder-input')]    ${line}
    \    click element    xpath=//div[2]/span[contains(text(),'Create') or ./text() = 'Create']
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

image_library_add_image_name
    @{failed_inputs}=    create list
    :for    ${line}    in    @{non_xss_test_data}
    \    go to ${image_library["menu"]}
    \    wait until element is visible    ${navigation_bar}
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    upload file
    \    input text    name=name    ${line}
    \    click element    ${image_library["button_add"]["start_upload_button"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

image_library_add_image_description
    @{failed_inputs}=    create list
    :for    ${line}    in    @{non_xss_test_data}
    \    go to ${image_library["menu"]}
    \    wait until element is visible    ${navigation_bar}
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    upload file
    \    input text    name=name    test
    \    input text    name=description    ${line}
    \    click element    ${image_library["button_add"]["start_upload_button"]}
    \    check for good request    ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

#Image Library Rename Image Name
#    @{failed_inputs}=    Create List
#    Go To ${image_library["menu"]}
#    Wait Until Element Is Visible    ${navigation_bar}
#    Select Frame    ${iframes["top"]}
#    Select Frame    ${iframes["ccmd"]}
#    Wait Until Element Is Visible    ${image_library["button_add"]["add_button"]}
#    Upload File
#    Input Text    name=name    Name
#    Input Text    name=description    Description
#    Click Element    ${image_library["button_add"]["start_upload_button"]}
#
#    :FOR    ${line}    In    @{non_xss_test_data}
#    \    go to ${image_library["menu"]}
#    \    Wait Until Element Is Visible    ${navigation_bar}
#    \    Select Frame    ${iframes["top"]}
#    \    Select Frame    ${iframes["ccmd"]}
#    \    Wait Until Element Is Visible    ${image_library["button_add"]["add_button"]}
#    \
#    \    check for good request    ${line}    ${failed_inputs}
#    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
#    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

*** Keywords ***
upload file
    wait until keyword succeeds    15x    1 sec    click element    ${image_library["button_add"]["add_button"]}
    select frame    ${image_library["button_add"]["image_library_iframe"]}
    ${file_path}=    catenate    SEPARATOR=    ${EXECDIR}    \\Emails\\UI\\Utils\\Resources\\puffin.jpg
    choose file    ${image_library["button_add"]["browse_button"]}    ${file_path}
    sleep    1

delete image test data
    go to ${image_library["menu"]}
    wait until element is visible    ${navigation_bar}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until keyword succeeds    15x    1 sec    click element    ${image_library["button_add"]["select_all"]}
    wait until keyword succeeds    15x    1 sec    click element    ${image_library["button_add"]["delete"]}
    wait until keyword succeeds    15x    1 sec    click element    ${image_library["button_add"]["confirm_delete"]}