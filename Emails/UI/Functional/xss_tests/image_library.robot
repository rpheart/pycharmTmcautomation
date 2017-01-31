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
#    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
#    \    Input Text    ${generics["search_input"]}    ${line}
#    \    Click Element    ${generics["search_button"]}
#    \    Check For Bad Request    ${line}    ${failed_inputs}
#
#    Log Failed Inputs    @{failed_inputs}
