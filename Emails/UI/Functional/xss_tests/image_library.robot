*** Settings ***
Documentation       will check the input of each of the blns values into the image library screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Library             ImageHorizonLibrary
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
Suite Teardown      Run Keywords    Delete Image Test Data
...                 AND    Close All Browsers

*** Test Cases ***
Image Library Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    go to ${image_library["menu"]}
    \    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
    \    Select Frame    ${iframes["top"]}
    \    Select Frame    ${iframes["ccmd"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Image Library Create New Folder
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    go to ${image_library["menu"]}
    \    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
    \    Select Frame    ${iframes["top"]}
    \    Select Frame    ${iframes["ccmd"]}
    \    Wait Until Element Is Visible    ${image_library["button_add"]["create_new_folder"]}    timeout=30
    \    Wait Until Keyword Succeeds    5x    10 sec    Click Element    ${image_library["button_add"]["create_new_folder"]}
    \    Input Text    xpath=//input[contains(@class, 'create-folder-input')]    ${line}
    \    Click Element    xpath=//div[2]/span[contains(text(),'Create') or ./text() = 'Create']
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

Image Library Add Image Name
    @{failed_inputs}=    Create List
    :FOR    ${line}    In    @{xss_test_data}
    \    go to ${image_library["menu"]}
    \    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
    \    Select Frame    ${iframes["top"]}
    \    Select Frame    ${iframes["ccmd"]}
    \    Wait Until Element Is Visible    ${image_library["button_add"]["add_button"]}    timeout=30
    \    Upload File
    \    Input Text    name=name    ${line}
    \    Input Text    name=description    test
    \    Click Element    ${image_library["button_add"]["start_upload_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    @{failed_inputs}

Image Library Add Image Description
    @{failed_inputs}=    Create List
    :FOR    ${line}    In    @{xss_test_data}
    \    go to ${image_library["menu"]}
    \    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
    \    Select Frame    ${iframes["top"]}
    \    Select Frame    ${iframes["ccmd"]}
    \    Wait Until Element Is Visible    ${image_library["button_add"]["add_button"]}    timeout=30
    \    Upload File
    \    Input Text    name=name    test
    \    Input Text    name=description    ${line}
    \    Click Element    ${image_library["button_add"]["start_upload_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    @{failed_inputs}

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
Upload File
    Wait Until Keyword Succeeds    5x    10 sec    Click Element    ${image_library["button_add"]["add_button"]}
    Select Frame    ${image_library["button_add"]["image_library_iframe"]}
    Wait Until Keyword Succeeds    5x    10 sec    Click Element    ${image_library["button_add"]["browse_button"]}
    Sleep    1
    ${file_path}=    Catenate    SEPARATOR=    ${EXECDIR}    \\Emails\\UI\\Utils\\Resources\\puffin.jpg
    Type    ${file_path}    Key.ENTER
    Sleep    1

Delete Image Test Data
    go to ${image_library["menu"]}
    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
    Select Frame    ${iframes["top"]}
    Select Frame    ${iframes["ccmd"]}
    Wait Until Keyword Succeeds    5x    10 sec    Click Element    ${image_library["button_add"]["select_all"]}
    Wait Until Keyword Succeeds    5x    10 sec    Click Element    ${image_library["button_add"]["delete"]}
    Wait Until Keyword Succeeds    5x    10 sec    Click Element    ${image_library["button_add"]["confirm_delete"]}