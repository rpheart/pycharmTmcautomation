*** Settings ***
Documentation     will check the input of each of the blns values into the MultiVariate screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
multivariate_campaign_name
    loop through test data    splitrunUI-builderView-nameInput

multivariate_campaign_description
    loop through test data    splitrunUI-builderView-descriptionInput

multivariate_campaign_havent_a_damn_clue
    loop through test data    xpath=//*[@id="splitrunuidiv"]/div/div[2]/div/div[2]/div/div[3]/div/table/tbody/tr[2]/td/table/tbody/tr[5]/td/fieldset/table/tbody/tr[2]/td/table/tbody/tr[2]/td/table/tbody/tr/td[1]/table/tbody/tr[2]/td/table/tbody/tr/td[2]/table/tbody/tr/td[1]/input

multivariate_campaign_search
    verify xss data on search field    ${multivariate_campaign}    ${multivariate_campaign["button_list"]["list"]}

*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${multivariate_campaign}    ${multivariate_campaign["button_add"]["add"]}
    \    wait until element is visible    ${field}    timeout=30
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    run keyword and ignore error    input text    ${field}    ${line}
    \    click element    ${multivariate_campaign['button_add']['select_a_message']}
    \    wait until element is visible    splitrunUI-builderView-messagesExplorer-idColumn
    \    click element    splitrunUI-builderView-messagesExplorer-idColumn
    \    click element    ${multivariate_campaign['button_add']['select_one_or_more_segments']}
    \    wait until element is visible    splitrunUI-builderView-segmentsExplorer-nameColumn    timeout=10
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    30x    1 sec    click element    ${multivariate_campaign['button_add']['click_ok']}
    \    wait until keyword succeeds    30x    1 sec    click element    ${multivariate_campaign['button_add']['continue_button']}
    \    wait until page contains    2. Define test versions (up to 20)    timeout=10
    \    run keyword and ignore error    wait until keyword succeeds    30x    1 sec    input text    ${field}    ${line}
#    \    wait until keyword succeeds    30x    1 sec    input text    xpath=//*[@id="splitrunuidiv"]/div/div[2]/div/div[2]/div/div[3]/div/table/tbody/tr[2]/td/table/tbody/tr[5]/td/fieldset/table/tbody/tr[2]/td/table/tbody/tr[2]/td/table/tbody/tr/td[1]/table/tbody/tr[2]/td/table/tbody/tr/td[2]/table/tbody/tr/td[1]/input    test2
    \    click element    ${multivariate_campaign['button_add']['continue_button']}
    \    wait until page contains    2. Select success key indicator and schedule the winning campaign    timeout=30
    \    click element    ${multivariate_campaign['button_add']['schedule_button']}
    \    click button    Yes    # Pop up 'Yes'
#    \    run keyword and ignore error    wait until element is visible    xpath=//*[@id="intro"]/div[4]//div[contains(text(), 'save split run error :')]    timeout=30
#    \    ${passed}=    Run Keyword And Return Status    Click Element    xpath=//*[@id="intro"]/div[4]//div[contains(text(), 'save split run error :')]
#    \    Run Keyword If    '${passed}'=='False'    Click Button    Ok
#    \    Run Keyword and Ignore error    Wait Until Element Is Visible    xpath=//u[./text()='${my_naughty_List[${i}]}']    timeout=15
#    \    Run Keyword If    '${passed}'=='False'    Run Keywords    Click Element    ${multivariate_campaign['button_add']['button_new']}
#    \    ...    AND    Append To List    ${collect_all_negative_input_list}    ${field_value}
#    \    ...    AND    Append To List    ${collect_all_negative_input_list}    ${my_naughty_List[${i}]}
#    \    Wait Until Element Is Visible    ${multivariate_campaign['button_add']['define_campaign_and_recipients']}    timeout=10
#    \    Click Element    ${multivariate_campaign['button_add']['define_campaign_and_recipients']}
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data