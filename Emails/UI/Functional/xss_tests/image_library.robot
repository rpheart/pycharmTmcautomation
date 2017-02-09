*** Settings ***
Documentation       will check the input of each of the blns values into the image library screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Library             ImageHorizonLibrary
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      run keywords
...                 delete image test data
...                 AND    close all browsers

*** Test Cases ***
image_library_search
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    go to ${image_library["menu"]}
    \    wait until element is visible    ${navigation_bar}    timeout=30
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    wait until element is visible    ${generics["search_input"]}    timeout=30
    \    input text    ${generics["search_input"]}    ${line}
    \    click element    ${generics["search_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

image_library_create_new_folder
    @{failed_inputs}=    create list
    :FOR    ${line}    In     @{xss_test_data}
    \    go to ${image_library["menu"]}
    \    wait until element is visible    ${navigation_bar}    timeout=30
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    wait until keyword succeeds    30x    1 sec    click element    ${image_library["button_add"]["create_new_folder"]}
    \    input text    xpath=//input[contains(@class, 'create-folder-input')]    ${line}
    \    click element    xpath=//div[2]/span[contains(text(),'Create') or ./text() = 'Create']
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

image_library_add_image_name
    @{failed_inputs}=    create list
    :for    ${line}    in    @{xss_test_data}
    \    go to ${image_library["menu"]}
    \    wait until element is visible    ${navigation_bar}    timeout=30
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    upload file
    \    input text    name=name    ${line}
    \    click element    ${image_library["button_add"]["start_upload_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

image_library_add_image_description
    @{failed_inputs}=    create list
    :for    ${line}    in    @{xss_test_data}
    \    go to ${image_library["menu"]}
    \    wait until element is visible    ${navigation_bar}    timeout=30
    \    select frame    ${iframes["top"]}
    \    select frame    ${iframes["ccmd"]}
    \    upload file
    \    input text    name=name    test
    \    input text    name=description    ${line}
    \    click element    ${image_library["button_add"]["start_upload_button"]}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data

#Image Library Rename Image Name
#    @{failed_inputs}=    Create List
#    Delete Image Test Data
#    Go To ${image_library["menu"]}
#    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
#    Select Frame    ${iframes["top"]}
#    Select Frame    ${iframes["ccmd"]}
#    Wait Until Element Is Visible    ${image_library["button_add"]["add_button"]}    timeout=30
#    Upload File
#    Input Text    name=name    Name
#    Input Text    name=description    Description
#    Click Element    ${image_library["button_add"]["start_upload_button"]}
#
#    :FOR    ${line}    In    @{xss_test_data}
#    \    go to ${image_library["menu"]}
#    \    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
#    \    Select Frame    ${iframes["top"]}
#    \    Select Frame    ${iframes["ccmd"]}
#    \    Wait Until Element Is Visible    ${image_library["button_add"]["add_button"]}    timeout=30
#    \
#    \    Check For Bad Request    ${line}    ${failed_inputs}
#
#    Log Failed Inputs    @{failed_inputs}

*** Keywords ***
upload file
    wait until keyword succeeds    30x    1 sec    click element    ${image_library["button_add"]["add_button"]}
    select frame    ${image_library["button_add"]["image_library_iframe"]}
    wait until keyword succeeds    30x    1 sec    click element    ${image_library["button_add"]["browse_button"]}
    sleep    1
    ${file_path}=    catenate    SEPARATOR=    ${EXECDIR}    \\Emails\\UI\\Utils\\Resources\\puffin.jpg
    type    ${file_path}    Key.ENTER
    sleep    1

delete image test data
    go to ${image_library["menu"]}
    wait until element is visible    ${navigation_bar}    timeout=30
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until keyword succeeds    30x    1 sec    click element    ${image_library["button_add"]["select_all"]}
    wait until keyword succeeds    30x    1 sec    click element    ${image_library["button_add"]["delete"]}
    wait until keyword succeeds    30x    1 sec    click element    ${image_library["button_add"]["confirm_delete"]}
