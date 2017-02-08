*** Settings ***
Documentation       contains keywords specific to xss testing
Variables           Resources/xss_test_data.py
Library             Collections

*** Variables ***

*** Keywords ***
Store Alert Message
    ${alert_message}=    Get Alert Message
    Set Test Variable    ${alert_message}

Check For Bad Request
    [Arguments]    ${input}    @{failed_inputs}
    ${test}=    Set Variable    False
    Run Keyword And Ignore Error    Store Alert Message

    # Check for error as popup
    @{alert_messages}=    Create List    -    Error 200 requesting page
    :FOR    ${message}    In    @{alert_messages}
    \    Exit For Loop If    ${test}
    \    ${test}=    Run Keyword And Return Status    Should Contain    ${alert_message}    ${message}

    # Check for error as page
    @{error_messages}=    Create List    Bad Request!!!    save split run error :
    :FOR    ${message}    In    @{error_messages}
    \    Exit For Loop If    ${test}
    \    ${test}=    Run Keyword And Return Status    Current Frame Contains    ${message}

    Run Keyword If    ${test} == False    Append To List    @{failed_inputs}    ${input}

Write Failed Input To File
    [Arguments]    ${test_suite_name}    ${test_case_name}    @{failed_inputs}
    ${is_failed}=    set variable    False
    Run Keyword If    len(@{failed_inputs}) == 0
    ...    Log    No Errors
    ...    ELSE
    ...    Run Keywords
    ...    Append To File    ${EXECDIR}Emails/logs/error_Log_${test_suite_name}.txt    ${test_case_name}${\n}--------------------------------${\n}
    ...    AND    Write Data    ${test_suite_name}    @{failed_inputs}
    ...    AND    ${is_failed}=    set variable    True
    Set Test Variable    ${is_failed}

Write Data
    [Arguments]    ${test_suite_name}    @{failed_inputs}
    :FOR    ${item}    In    @{failed_inputs}
    \    Append To File    ${EXECDIR}Emails/logs/error_Log_${test_suite_name}.txt    ${item}${\n}
    Append To File    ${EXECDIR}Emails/logs/error_Log_${test_suite_name}.txt    ${\n}--------------------------------${\n}

Create Email String
    [Arguments]    ${line}
    ${line}=    Catenate    SEPARATOR=    ${line}    @test.com
    Set Test Variable    ${line}
