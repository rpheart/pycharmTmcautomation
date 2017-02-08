*** Settings ***
Documentation     will check the input of each of the blns values into the SMS Message screen
Suite Setup       Run Keywords    Login
...               AND    Go To ${system_page["email"]}
...               AND    Open Content    ${sms_message_builder}    ${sms_message_builder["button_add"]["add"]}
Suite Teardown    Close All Browsers
Resource          ../../Utils/keywords.robot
Resource          ../../Utils/xss_keywords.robot
Library           String

*** Variables ***
${next_line}      :${\n}--------------------------------${\n}

*** Test Cases ***
SMS_Message_Xss
    # SMS_Message
    # import naughty file and convert to list
    ${naughty_file}=    Get File    ${EXECDIR}/Utils/Resources/xss_naughty_data_file.txt    # Read content from the naughty data file
    @{split_test_file}=    Split To Lines    ${naughty_file}    ${EMPTY}    # Split file
    @{my_naughty_List}=    Convert To List    ${split_test_file}    # Convert to list
    Log List    ${my_naughty_List}
    ${my_naughty_List_length}=    Get Length    ${my_naughty_List}
    Set Variable    ${my_naughty_List_length}
    # create a field list
    @{fields_list}=    Create List    name=msgName    name=msgDescription
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

SMS_Message_Search
    @{failed_inputs}=    Create List
    :FOR    ${line}    In     @{xss_test_data}
    \    Open Content    ${sms_message_builder}    ${sms_message_builder["button_list"]["list"]}
    \    Wait Until Element Is Visible    ${generics["search_input"]}    timeout=30
    \    Input Text    ${generics["search_input"]}    ${line}
    \    Click Element    ${generics["search_button"]}
    \    Check For Bad Request    ${line}    ${failed_inputs}
    Write Failed Input To File    ${TEST_NAME}    ${generics["search_input"]}    @{failed_inputs}
    Run Keyword If    ${is_failed}    Fail    msg=List of words that failed xss verification

*** Keywords ***
Loop_Through_Naughty_List
    [Arguments]    ${my_naughty_List_length}    ${fields_list}    ${move_forward_field}    ${move_backwards_field}    ${collect_all_negative_input_list}    ${my_naughty_List}
    ...    ${field_value}
    : FOR    ${i}    IN RANGE    0    ${my_naughty_List_length}
    \    Wait Until Element Is Visible    ${fields_list[0]}    timeout=10
    \    Input Text    ${fields_list[${move_forward_field}]}    ${my_naughty_List[${i}]}
    \    Input Text    ${fields_list[${move_backwards_field} - 1]}    test
    \    Input Text    ${sms_message_builder['button_add']['text_content']}    Test
    \    Click Element    ${sms_message_builder['button_add']['save_button']}
    \    Sleep    2
    \    ${alert_text}=    Get Alert Message
    \    ${Check_error_line}=    Get Regexp Matches    ${alert_text}    Error while saving message:
    \    Run Keyword If    '${alert_text}'=='Message successfully saved.'    Run Keywords    Click Element    ${sms_message_builder['button_list']['sms']}
    \    ...    AND    Wait Until Element Is Visible    ccmd-messages-cell-name1    timeout=10
    \    ...    AND    Click Element    ${sms_message_builder['button_list']['new']}
    \    Run Keyword If    '${alert_text}'=='Message successfully saved.'    Run Keywords    Append To List    ${collect_all_negative_input_list}    ${field_value}
    \    ...    AND    Append To List    ${collect_all_negative_input_list}    ${my_naughty_List[${i}]}
