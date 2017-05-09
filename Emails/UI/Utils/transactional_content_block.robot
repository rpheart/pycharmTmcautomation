*** Settings ***
Documentation    keywords specific to the creation of transactional content blocks

*** Keywords ***
create basic content block
    open content    ${transactional_content_block}    ${transactional_content_block["button_add"]["add"]}
    input text    ${transactional_content_block["button_add"]["content_block_name_input"]}    QA Auto transactional Content Block
    input text    ${transactional_content_block["button_add"]["content_block_description_input"]}    auto generated
    input text    ${transactional_content_block["button_add"]["content_block_body_input"]}    <p>QA Auto Content Block</p>
    click element    ${generics["save"]}
    sleep    1
    alert should be present    text=Your Dynamic Content Block has been saved successfully.

delete latest transactional content block
    open content    ${transactional_content_block}    ${transactional_content_block["button_list"]["list"]}
    click element    ${transactional_content_block["button_list"]["first_delete_button"]}
    click element    ${generics["trash"]}
    click element    ${generics["trash"]}
    current frame contains    Dynamic Content Blocks
    