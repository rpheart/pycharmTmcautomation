*** Settings ***
Documentation       Suite description
Library             Selenium2Library     10       2
Resource            Utils/keywords.robot
Variables           Utils/variables.py
Suite Teardown

*** Variables ***


*** Test Cases ***
Login And Go To Classic Message Builder
    Login
    Set Selenium Speed    0.1
    Go To System    ${email_page}
    Open Content    ${classic_message_builder}      ${classic_message_builder["button_add"]}

Message Name
    :FOR    ${script}    In    @{xss_entries}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_name_input"]}    ${script}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_name_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text

Message Description
    :FOR    ${script}    In    @{xss_entries}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_description_input"]}    ${script}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_description_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text

Message From
    :FOR    ${script}    In    @{xss_entries}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_from_input"]}    ${script}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_from_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text

Message To
    :FOR    ${script}    In    @{xss_entries}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_to_input"]}    ${script}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_to_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text

Message Subject
    :FOR    ${script}    In    @{xss_entries}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_subject_input"]}    ${script}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_subject_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text

Message Reply To
    :FOR    ${script}    In    @{xss_entries}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_reply_to_input"]}    ${script}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_reply_to_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text

Message Custom Header
    :FOR    ${script}    In    @{xss_entries}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_custom_header_input"]}    ${script}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_custom_header_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text

*** Keywords ***
Open Message Header
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${iframes["top"]}
    Run Keyword If    ${is_visible}
    ...    Run Keywords    Select Frame    ${iframes["top"]}    # Click on main frame
    ...    AND    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    ...    AND    Wait Until element Is Visible    ${classic_message_builder["create"]["header_accordion"]}    timeout=60
    click element    ${classic_message_builder["create"]["header_accordion"]}
    Wait Until element Is Visible    ${classic_message_builder["create"]["message_name_input"]}    timeout=60