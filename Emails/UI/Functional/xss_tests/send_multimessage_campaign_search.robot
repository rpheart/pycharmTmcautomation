*** Settings ***
Documentation       will check the input of each of the blns values into the send multimessage campaign search screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    production    xss
Suite Setup         Run Keywords    Login
...                 AND    Go To ${system_page["email"]}
Suite Teardown      Close All Browsers

*** Test Cases ***
Send Multimessage Campaign Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification
