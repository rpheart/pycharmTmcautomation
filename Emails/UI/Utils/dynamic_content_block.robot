*** Settings ***
Documentation    keywords specific to the creation of content blocks

*** Keywords ***
create basic content block
    open content    ${content_block}    ${content_block["button_add"]["add"]}
    input text    ${content_block["button_add"]["name"]}    QA Auto Content Block
    input text    ${content_block["button_add"]["description"]}    auto created
    input text    ${content_block["button_add"]["text_content"]}    <p>QA Auto Content Block</p>
    click element    ${content_block["button_add"]["save"]}
    sleep    0.5
    ${alert_message}=    get alert message
    should be equal as strings    ${alert_message}    your dynamic content block has been saved successfully.    ignore_case=True
    sleep    0.5

delete latest content block
    open content    ${content_block}    ${content_block["button_list"]["list"]}
    wait until keyword succeeds    15x    1 sec    click element    ${content_block["button_list"]["first_row"]}
    click element    ${content_block["button_list"]["delete_button"]}
    click element    ${content_block["button_list"]["delete_confirm"]}
    current frame contains    Your message has been successfully deleted.
