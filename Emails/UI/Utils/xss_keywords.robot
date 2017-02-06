*** Settings ***
Documentation     contains keywords specific to xss testing
Variables         Resources/xss_test_data.py
Library           Collections
Library           OperatingSystem

*** Variables ***

*** Keywords ***
Check For Bad Request
    [Arguments]    ${input}    ${failed_inputs}
    ${test}=    Run Keyword And Return Status    Current Frame Contains    Bad Request!!!
    Run Keyword If    ${test} == False    Append To List    ${failed_inputs}    ${input}

Write_Failed_Input_To_File
    [Arguments]    ${test_case_name}    @{failed_inputs}
    ${get_list_length}=    Get Length    ${failed_inputs}
    Run Keyword If    len(@{failed_inputs}) == 0    Log    No Errors    console=yes
    ...    ELSE    Run Keywords    Append To File    ${EXECDIR}/Functional/xss_tests/logs/error_Log_${test_case_name}.txt    ${test_case_name}${\n}
    ...    AND    Run_For_Loop    ${test_case_name}    ${failed_inputs}    ${get_list_length}
    ...    AND    Fail    msg=List of words that failed xss verification

Run_For_Loop
    [Arguments]    ${test_case_name}    ${failed_inputs}    ${get_list_length}
    :FOR    ${item}    IN RANGE    0    ${get_list_length}
    \    Append To File    ${EXECDIR}/Functional/xss_tests/logs/error_Log_${test_case_name}.txt    ${failed_inputs[${item}]}${\n}
