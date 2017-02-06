*** Settings ***
Documentation     will check the input of each of the blns values into the MultiVariate screen
Suite Setup       Run Keywords    Login
...               AND    Go To ${system_page["email"]}
...               AND    Open Content    ${multivariate_campaign}    ${multivariate_campaign["button_add"]["add"]}
Suite Teardown    Close All Browsers
Resource          ../../Utils/keywords.robot
Resource          ../../Utils/xss_keywords.robot
Library           String

*** Variables ***
${next_line}      :${\n}--------------------------------${\n}

*** Test Cases ***
MultiVariate_Xss
    # MultiVariate_xss
    # import naughty file and convert to list
    ${naughty_file}=    Get File    ${EXECDIR}/Utils/Resources/xss_naughty_data_file.txt    # Read content from the naughty data file
    @{split_test_file}=    Split To Lines    ${naughty_file}    ${EMPTY}    # Split file
    @{my_naughty_List}=    Convert To List    ${split_test_file}    # Convert to list
    Log List    ${my_naughty_List}
    ${my_naughty_List_length}=    Get Length    ${my_naughty_List}
    Set Variable    ${my_naughty_List_length}
    # create a field list
    @{fields_list}=    Create List    splitrunUI-builderView-nameInput    splitrunUI-builderView-descriptionInput    # All field identifiers
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
    \    Click Element    ${multivariate_campaign['button_add']['select_a_message']}
    \    Wait Until Element Is Visible    splitrunUI-builderView-messagesExplorer-idColumn
    \    Click Element    splitrunUI-builderView-messagesExplorer-idColumn
    \    Click Element    ${multivariate_campaign['button_add']['select_one_or_more_segments']}
    \    Wait Until Element Is Visible    splitrunUI-builderView-segmentsExplorer-nameColumn    timeout=10
    \    Wait Until Keyword succeeds    5    2    Click Element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    Wait Until Keyword succeeds    5    2    Click Element    ${multivariate_campaign['button_add']['click_ok']}
    \    Wait Until Keyword succeeds    5    2    Click Element    ${multivariate_campaign['button_add']['continue_button']}
    \    Wait Until Page Contains    2. Define test versions (up to 20)    timeout=10
    \    Wait Until Keyword succeeds    5    2    Input Text    xpath=//*[@id="splitrunuidiv"]/div/div[2]/div/div[2]/div/div[3]/div/table/tbody/tr[2]/td/table/tbody/tr[5]/td/fieldset/table/tbody/tr[2]/td/table/tbody/tr[2]/td/table/tbody/tr/td[1]/table/tbody/tr[2]/td/table/tbody/tr/td[2]/table/tbody/tr/td[1]/input    test2
    \    Click Element    ${multivariate_campaign['button_add']['continue_button']}
    \    Wait Until Page Contains    2. Select success key indicator and schedule the winning campaign    timeout=10
    \    Click Element    ${multivariate_campaign['button_add']['schedule_button']}
    \    Click Button    Yes    # Pop up 'Yes'
    \    Run Keyword and Ignore error    Wait Until Element Is Visible    xpath=//*[@id="intro"]/div[4]//div[contains(text(), 'save split run error :')]    timeout=10
    \    ${passed}=    Run Keyword And Return Status    Click Element    xpath=//*[@id="intro"]/div[4]//div[contains(text(), 'save split run error :')]
    \    Run Keyword If    '${passed}'=='False'    Click Button    Ok
    \    Run Keyword and Ignore error    Wait Until Element Is Visible    xpath=//u[./text()='${my_naughty_List[${i}]}']    timeout=15
    \    Run Keyword If    '${passed}'=='False'    Run Keywords    Click Element    ${multivariate_campaign['button_add']['button_new']}
    \    ...    AND    Append To List    ${collect_all_negative_input_list}    ${field_value}
    \    ...    AND    Append To List    ${collect_all_negative_input_list}    ${my_naughty_List[${i}]}
    \    Wait Until Element Is Visible    ${multivariate_campaign['button_add']['define_campaign_and_recipients']}    timeout=10
    \    Click Element    ${multivariate_campaign['button_add']['define_campaign_and_recipients']}

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Suite_Teardown
    Close All Browsers
