*** Settings ***
Documentation       contains keywords specific to xss testing

*** Variables ***
${blns}=    Get File    Emails/UI/Utils/Resources/blns.json
#@{test_data}=    Split To Lines    ${blns}
@{test_data}    nil    ";alert(123);"

*** Keywords ***
Log Failed Inputs
    [Arguments]    ${test_case_name}    @{failed_inputs}
    Run Keyword If    len(@{failed_inputs}) == 0    Log    No Errors    console=yes
    ...    ELSE IF    len(@{failed_inputs}) == 1    Run Keywords    Log    ${test_case_name}    level=warn
    ...    AND    Log    @{failed_inputs}    level=WARN
    ...    ELSE    Run Keywords    Log    ${test_case_name}    level=warn
    ...    AND    Log    ${failed_inputs}    level=WARN

    Run Keyword If    len(@{failed_inputs}) > 0    Fail    msg=List of words that failed xss verification

Check For Bad Request
    [Arguments]    ${input}    ${failed_inputs}
    ${test}=    Run Keyword And Return Status    Current Frame Contains    Bad Request!!!
    Run Keyword If    ${test} == False    Append To List    ${failed_inputs}    ${input}
