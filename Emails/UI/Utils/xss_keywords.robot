*** Settings ***
Documentation       contains keywords specific to xss testing
Variables           Resources/xss_test_data.py
Library             Collections

*** Variables ***

*** Keywords ***
Check_For_Bad_Request
    [Arguments]    ${input}    ${failed_inputs}
    @{error_messages}=    Create List    Bad Request!!!    save split run error :
    :FOR    ${message}    In    @{error_messages}
    \    ${test}=    Run Keyword And Return Status    Current Frame Contains    ${message}
    \    Exit For Loop If    ${test}
    Run Keyword If    ${test} == False    Append To List    ${failed_inputs}    ${input}

Write_Failed_Input_To_File
    [Arguments]    ${test_case_name}    ${field}    @{failed_inputs}
    Run Keyword If    len(@{failed_inputs}) == 0    Log    No Errors    console=yes
    ...    ELSE    Run Keywords    Append To File    ${EXECDIR}/Functional/xss_tests/logs/error_Log_${test_case_name}.txt    ${test_case_name}${\n}${field}${\n}
    ...    AND    Run_For_Loop    ${test_case_name}    @{failed_inputs}
    ...    AND    Set Test Variable    ${is_failed}    True

Run_For_Loop
    [Arguments]    ${test_case_name}    @{failed_inputs}
    :FOR    ${item}    In    @{failed_inputs}
    \    Append To File    ${EXECDIR}/Functional/xss_tests/logs/error_Log_${test_case_name}.txt    ${item}${\n}
    Append To File    ${EXECDIR}/Functional/xss_tests/logs/error_Log_${test_case_name}.txt    ${\n}--------------------------------${\n}
