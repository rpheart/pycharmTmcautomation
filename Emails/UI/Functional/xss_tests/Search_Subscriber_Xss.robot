*** Settings ***
Documentation       will check the input of each of the blns values into the search subscriber screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
Suite Teardown      Close All Browsers

*** Test Cases ***
Search_Subscriber
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${search_subscriber}    ${search_subscriber["button_add"]["add"]}
    \    Wait Until Element Is Visible    name=textFieldCombo    timeout=30
    \    Select From List    name=textFieldCombo    EMAIL
    \    Select From List    name=textFieldOperator    equals
    \    Input Text    name=textFieldValue    ${line}
    \    Click Element    xpath=//img[@id="iconAddCriteria"]
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification
