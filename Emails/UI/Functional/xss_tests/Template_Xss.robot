*** Settings ***
Documentation     will check the input of each of the blns values into the Template screen
Suite Setup       Run Keywords    Login
...               AND    Go To ${system_page["email"]}
...               AND    Open Content    ${template}    ${template["button_add"]["add"]}
Suite Teardown    Close All Browsers
Resource          ../../Utils/keywords.robot
Resource          ../../Utils/xss_keywords.robot
Library           String

*** Variables ***
${next_line}      :${\n}--------------------------------${\n}

*** Test Cases ***
Template_Xss
    # Template_Xss
    # import naughty file and convert to list
    ${naughty_file}=    Get File    ${EXECDIR}/Utils/Resources/xss_naughty_data_file.txt    # Read content from the naughty data file
    @{split_test_file}=    Split To Lines    ${naughty_file}    ${EMPTY}    # Split file
    @{my_naughty_List}=    Convert To List    ${split_test_file}    # Convert to list
    Log List    ${my_naughty_List}
    ${my_naughty_List_length}=    Get Length    ${my_naughty_List}
    Set Variable    ${my_naughty_List_length}
    # create a field list
    @{fields_list}=    Create List    name=name    name=description
    ${fields_list_length}=    Get Length    ${fields_list}
    @{collect_all_negative_input_list}=    Create List
    ${move_forward_field}    Set Variable    ${0}
    ${move_backwards_field}=    Get Length    ${fields_list}
    : FOR    ${field_index}    IN RANGE    0    ${fields_list_length}
    \    Loop_Through_Naughty_List    ${my_naughty_List_length}    ${fields_list}    ${move_forward_field}    ${move_backwards_field}    ${collect_all_negative_input_list}
    \    ...    ${my_naughty_List}    ${fields_list[${field_index}]}${next_line}
    \    Set Test Variable    ${move_forward_field}    ${move_forward_field} + 1
    \    Set Test Variable    ${move_backwards_field}    ${move_backwards_field} - 1
    Write_Failed_Input_To_File    ${TEST_NAME}    @{collect_all_negative_input_list}

*** Keywords ***
Loop_Through_Naughty_List
    [Arguments]    ${my_naughty_List_length}    ${fields_list}    ${move_forward_field}    ${move_backwards_field}    ${collect_all_negative_input_list}    ${my_naughty_List}
    ...    ${field_value}
    : FOR    ${i}    IN RANGE    0    ${my_naughty_List_length}
    \    Wait Until Element Is Visible    ${fields_list[0]}    timeout=10
    \    Input Text    ${fields_list[${move_forward_field}]}    ${my_naughty_List[${i}]}
    \    Input Text    ${fields_list[${move_backwards_field} - 1]}    test
    \    Choose File    ${template["button_add"]["upload_file"]}    ${EXECDIR}\\Utils\\Resources\\Easter_Eggs.dwt
    \    Click Element    ${template["button_add"]["import_file"]}
    \    Wait Until Page Contains    Happy Easter    timeout=10
    \    Click Element    ${template["button_add"]["save"]}    # Save
    \    Sleep    2
    \    ${alert_text}=    Get Alert Message
    \    Run Keyword If    "${alert_text}"=="Template was successfully saved"    Run Keywords    Append To List    ${collect_all_negative_input_list}    ${field_value}
    \    ...    AND    Append To List    ${collect_all_negative_input_list}    ${my_naughty_List[${i}]}
    \    Run Keyword If    "${alert_text}"=="Template was successfully saved"    Run Keywords    Click Element    ${template['button_list']['templates']}
    \    ...    AND    Wait Until Element Is Visible    ccmd-templates-cell-name1    timeout=10
    \    ...    AND    Click Element    ${template['button_list']['new']}
    \    Sleep    2
    \    Run Keyword If    "${alert_text}"!="Template was successfully saved"    Click Element    ${template['button_list']['new']}

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Suite_Teardown
    Close All Browsers
