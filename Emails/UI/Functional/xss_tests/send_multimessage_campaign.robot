*** Settings ***
Documentation     will check the input of each of the blns values into the MultiMessage screen
Resource            ../../Utils/keywords.robot
Resource            ../../Utils/xss_keywords.robot
Default Tags        ui    email    xss
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
multimessage_campaign_name
#    # Grab id of latest multimessage
#    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
#    wait until element is visible    ${multimessage_campaign["button_list"]["first_block_id"]}
#    ${latest_content_block_id}=    get text    ${multimessage_campaign["button_list"]["first_block_id"]}

    # Check xss data on multimessage campaign field name
    loop through test data    ${multimessage_campaign["button_add"]["input_name"]}

#    # Check no new content blocks were created
#    open content    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}
#    wait until element is visible    ${multimessage_campaign["button_list"]["first_block_id"]}
#    ${post_test_content_block_id}=    get text    ${multimessage_campaign["button_list"]["first_block_id"]}
#    run keyword if    ${post_test_content_block_id} != ${latest_content_block_id}    fail    msg=New Content Blocks were created with XSS data

multimessage_campaign_description
    loop through test data    ${multimessage_campaign["button_add"]["input_description"]}

multimessage_campaign_search
    verify xss data on search field    ${multimessage_campaign}    ${multimessage_campaign["button_list"]["list"]}


*** Keywords ***
loop through test data
    [Arguments]    ${field}
    @{failed_inputs}=    create list
    :for    ${line}    in     @{xss_test_data}
    \    open content    ${multimessage_campaign}    ${multimessage_campaign["button_add"]["add"]}
    \    wait until element is visible    ${field}    timeout=30
    \    input text    ${multimessage_campaign["button_add"]["input_name"]}    Name
    \    input text    ${field}    ${line}
    \    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-openButton"]
    \    wait until element is visible    splitrunUI-builderView-segmentsExplorer-nameColumn    timeout=10
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-segmentsExplorer-nameColumn
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-segmentsExplorer-addEntitiesButton"]//div[./text()='Ok']
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-nextButton"]//div[./text()='Continue']
    \    wait until page contains    1. Define campaign messages (up to 20)    timeout=10
    \    sleep    2
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version1-idColumn
    \    sleep    2
    \    wait until keyword succeeds    30x    1 sec    click element    xpath=//*[@id="splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton"]/tbody/tr/td/div
    \    wait until keyword succeeds    30x    1 sec    click element    splitrunUI-builderView-testMessage-messagesExplorer-version2-idColumn
    \    click element    ${multimessage_campaign['button_add']['continue_button']}
    \    wait until page contains    1. Schedule the campaign    timeout=10
    \    click element    ${multimessage_campaign['button_add']['schedule_button']}
    \    Click Button    Yes    # Pop up 'Yes'
    \    check for bad request    ${line}    ${failed_inputs}
    write failed input to file    ${SUITE_NAME}    ${TEST_NAME}    @{failed_inputs}
    run keyword if    ${is_failed}    fail    msg=xss verification failed, check the logs folder for data
