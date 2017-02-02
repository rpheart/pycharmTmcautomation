*** Settings ***
Suite Teardown    Suite_Teardown
Library           Selenium2Library    10    5    run_on_failure=Fail Keyword
Resource          ../../Utils/keywords.robot
Library           Collections
Library           String
Library           OperatingSystem
Resource          ../../Utils/xss_keywords.robot
Variables         ../../Utils/variables.py

*** Variables ***
${screenshots}    ${EMPTY}
${next_line}      :${\n}--------------------------------${\n}

*** Test Cases ***
Login
    Login
    Go To ${System_Page["email"]}
    Open Content    ${multimessage_campaign}    ${multimessage_campaign["button_add"]["add"]}

MultiMessage_Xss
    # MultiVariate_xss
    Wait until element is visible    ${iframes["top"]}    timeout=40
    Select frame    ${iframes["top"]}
    Wait until element is visible    ${iframes["ccmd"]}    timeout=55
    select frame    ${iframes["ccmd"]}
    # import naughty file and convert to list
    ${naughty_file}=    Get File    ${EXECDIR}/Functional/xss_tests/xss_naughty_data_file.txt    # Read content from the naughty data file
    @{split_test_file}=    Split To Lines    ${naughty_file}    ${EMPTY}    # Split file
    @{my_naughty_List}=    Convert To List    ${split_test_file}    # Convert to list
    Log List    ${my_naughty_List}
    ${my_naughty_List_length}=    Get Length    ${my_naughty_List}
    Set Variable    ${my_naughty_List_length}
    # create a field list
    @{fail}=    Create List
    @{fields_list}=    Create List    splitrunUI-builderView-nameInput    splitrunUI-builderView-descriptionInput    # All field identifiers
    ${fields_list_length}=    Get Length    ${fields_list}
    @{collect_all_negative_input_list}=    Create List
    ${move_forward_field}    Set Variable    ${0}
    ${move_backwards_field}=    Get Length    ${fields_list}
    : FOR    ${field_index}    IN RANGE    0    ${fields_list_length}
    \    Append To List    ${collect_all_negative_input_list}    ${fields_list[${field_index}]}
    \    Write_Bad_Date_To_File    ${fields_list[${field_index}]}${next_line}
    \    Loop_Through_Naughty_List    ${my_naughty_List_length}    ${fields_list}    ${move_forward_field}    ${move_backwards_field}    ${collect_all_negative_input_list}
    \    ...    ${my_naughty_List}    ${fail}
    \    Set Test Variable    ${move_forward_field}    ${move_forward_field} + 1
    \    Set Test Variable    ${move_backwards_field}    ${move_backwards_field} - 1
    Log List    ${collect_all_negative_input_list}
    Log Failed Inputs    ${TEST_NAME}    ${fail}

*** Keywords ***
Loop_Through_Naughty_List
    [Arguments]    ${my_naughty_List_length}    ${fields_list}    ${move_forward_field}    ${move_backwards_field}    ${collect_all_negative_input_list}    ${my_naughty_List}
    ...    ${fail}
    : FOR    ${i}    IN RANGE    0    ${my_naughty_List_length}
    \    Wait Until Element Is Visible    ${fields_list[0]}    timeout=10
    \    Input Text    ${fields_list[${move_forward_field}]}    ${my_naughty_List[${i}]}
    \    Input Text    ${fields_list[${move_backwards_field} - 1]}    test
    \    Click Element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-openButton"]
    \    Wait Until Element Is Visible    splitrunUI-builderView-segmentsExplorer-nameColumn    timeout=10
    \    Wait Until Keyword succeeds    5    2    Click Element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    Wait Until Keyword succeeds    5    2    Click Element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-addEntitiesButton"]//div[./text()='Ok']
    \    Wait Until Keyword succeeds    5    2    Click Element    xpath=//*[@id="splitrunUI-builderView-nextButton"]//div[./text()='Continue']
    \    Wait Until Page Contains    1. Define campaign messages (up to 20)    timeout=10
    \    Sleep    2
    \    Click Element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton"]/tbody/tr/td/div
    \    Wait Until Keyword succeeds    5    2    Click Element    splitrunUI-builderView-testMessage-messagesExplorer-version1-idColumn
    \    Sleep    2
    \    Click Element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton"]/tbody/tr/td/div
    \    Wait Until Keyword succeeds    5    2    Click Element    splitrunUI-builderView-testMessage-messagesExplorer-version2-idColumn
    \    Click Element    ${multimessage_campaign['button_add']['continue_button']}
    \    Wait Until Page Contains    1. Schedule the campaign    timeout=10
    \    Click Element    ${multimessage_campaign['button_add']['schedule_button']}
    \    Click Button    Yes    # Pop up 'Yes'
    \    Run Keyword and Ignore error    Wait Until Element Is Visible    xpath=//*[@id="intro"]/div[4]//div[contains(text(), 'save split run error :')]    timeout=10
    \    ${passed}=    Run Keyword And Return Status    Click Element    xpath=//*[@id="intro"]/div[4]//div[contains(text(), 'save split run error :')]
    \    Run Keyword If    '${passed}'=='False'    Click Button    Ok
    \    Run Keyword and Ignore error    Wait Until Element Is Visible    xpath=//u[./text()='${my_naughty_List[${i}]}']    timeout=15
    \    Run Keyword If    '${passed}'=='False'    Click Element    ${multimessage_campaign['button_add']['button_new']}
    \    Run Keyword If    '${passed}'=='False'    Append To List    ${collect_all_negative_input_list}    ${my_naughty_List[${i}]}
    \    Run Keyword If    '${passed}'=='False'    Write_Bad_Date_To_File    ${my_naughty_List[${i}]}${\n}
    \    Run Keyword If    '${passed}'=='False'    Append To List    ${fail}    ${my_naughty_List[${i}]}
    \    Wait Until Element Is Visible    ${multimessage_campaign['button_add']['define_campaign_and_recipients']}    timeout=10
    \    Click Element    ${multimessage_campaign['button_add']['define_campaign_and_recipients']}

Write_Bad_Date_To_File
    [Arguments]    ${collect_all_negative_input_list}
    #Write all negative inputs to a list
    Append To File    ${EXECDIR}/Functional/xss_tests/all_negative_input_file.txt    ${collect_all_negative_input_list}

Fail keyword
    log source
    run keyword unless    '${screenshots}' == 'FAIL'    capture page screenshot

Suite_Teardown
    Close All Browsers
