*** Settings ***
Documentation       will check the input of each of the blns values into the workflow workflows screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
Suite Teardown      Close All Browsers

*** Test Cases ***
Workflow_Model
    # Check xss data in workflow creator
    @{input_fields}=    Create List    ${workflow["button_add"]["workflow_name"]}    ${workflow["button_add"]["workflow_description"]}
    :FOR    ${field}    In    @{input_fields}
    \    Loop Through Test Data    ${field}
    \    Write Failed Input To File    ${TEST_NAME}    ${field}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification

*** Keywords ***
Loop_Through_Test_Data
    [Arguments]    ${field}
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${workflow}    ${workflow["button_add"]["add"]}
    \    Wait Until Element Is Visible    ${generics["create_new"]}    timeout=30
    \    Click Element    ${generics["create_new"]}
    \    Click Element    ${workflow["button_add"]["model_radio_button"]}
    \    Click Element    ${generics["next"]}
    \    Input Text    ${workflow["button_add"]["workflow_name"]}    Name
    \    Input Text    ${field}    ${line}
    \    Click Element    ${workflow["button_add"]["first_manager_checkbox"]}
    \    Click Element    ${generics["save"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Set Test Variable    @{failed_inputs}
