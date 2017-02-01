*** Settings ***
Documentation       will check the input of each of the blns values into the image library screen
Resource            Emails/UI/Utils/keywords.robot
Resource            Emails/UI/Utils/xss_keywords.robot
Default Tags        ui    email    production
Library             Collections
Library             String

*** Variables ***

*** Test Cases ***
login and go to email
    login
    go to ${system_page["email"]}

Image Library Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{test_data}
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
    :FOR    ${line}    In     @{test_data}
    \    go to ${image_library["menu"]}
    \    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
    \    Select Frame    ${iframes["top"]}
    \    Select Frame    ${iframes["ccmd"]}
    \    Wait Until Element Is Visible    ${image_library["button_add"]["create_new_folder"]}    timeout=30
    \    Click Element    ${image_library["button_add"]["create_new_folder"]}
    \    Input Text    xpath=//input[contains(@class, 'create-folder-input')]    ${line}
    \    Click Element    xpath=//div[2]/span[contains(text(),'Create') or ./text() = 'Create']
    \    Check For Bad Request    ${line}    ${failed_inputs}

    Log Failed Inputs    ${TEST_NAME}    @{failed_inputs}

#Image Library Add Image
#    @{failed_inputs}=    Create List
#    :FOR    ${line}    In     @{test_data}
#    \    go to ${image_library["menu"]}
#    \    Wait Until Element Is Visible    ${navigation_bar}    timeout=30
#    \    Select Frame    ${iframes["top"]}
#    \    Select Frame    ${iframes["ccmd"]}
#    \    Wait Until Element Is Visible    ${image_library["button_add"]["add_button"]}    timeout=30
#    \    Click Element    ${image_library["button_add"]["add_button"]}
#    \    Wait Until Element Is Visible    ${image_library["button_add"]["browse_button"]}    timeout=30
#    \    Click Element    ${image_library["button_add"]["browse_button"]}
#
#    \    Check For Bad Request    ${line}    ${failed_inputs}
#
#    Log Failed Inputs    @{failed_inputs}

Close All Browsers
    Close All Browsers
