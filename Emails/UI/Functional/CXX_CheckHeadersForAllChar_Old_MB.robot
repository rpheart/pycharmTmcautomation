*** Settings ***
Documentation       Suite description
Library             Selenium2Library     10       2
Resource            Utils/keywords.robot

*** Variables ***


*** Test Cases ***
Login And Go To Classic Message Builder
    Login
    Set Selenium Speed    0.1
    Go To System    ${email_page}
    Open Content    ${classic_message_builder}      ${classic_message_builder["button_add"]}

Create Message with Special Characters and Preview
    :FOR    ${script}    In    @{xss_entries}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_name_input"]}    ${script}              #Message name
    \    Input Text    ${classic_message_builder["create"]["message_description_input"]}    ${script}       #Message description
    \    Input Text    ${classic_message_builder["create"]["message_from_input"]}    ${script}              #Message From
    \    Input Text    ${classic_message_builder["create"]["message_to_input"]}    ${script}                #Message To
    \    Input Text    ${classic_message_builder["create"]["message_subject_input"]}    ${script}           #Message Subject
    \    Input Text    ${classic_message_builder["create"]["message_reply_to_input"]}    ${script}          #Message Reply to
    \    Open Body Header
    \    ${msg_body}=   Catenate        [EMV TEXTPART][EMV HTMLPART]<html><body>         ${script}
    \    ${msg_body}=   Catenate        ${msg_body}       </body></html>
    \    Log    ${msg_body}     console=yes
    \    Input Text    ${classic_message_builder["create"]["message_body_text"]}        ${msg_body}
#   \    Input Text    ${classic_message_builder["create"]["message_custom_header_input"]}    ${script}     #Message custom headers
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_name_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text in Name
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_description_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text in Description
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_from_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text in From field
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_to_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text in To field
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_subject_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text in Subject line
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_reply_to_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text in Reply To field
#   \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_reply_custom_header_input"]}@value
#   \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text in Custom headers field
    \    Open Body Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_body_text"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${msg_body}    message=Header has been stripped of XSS text in Body
    \    Click Button       ${classic_message_builder["create"]["messsage_preview"]}


*** Keywords ***
Open Message Header
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${iframes["top"]}
    Run Keyword If    ${is_visible}
    ...    Run Keywords    Select Frame    ${iframes["top"]}    # Click on main frame
    ...    AND    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    ...    AND    Wait Until element Is Visible    ${classic_message_builder["create"]["header_accordion"]}    timeout=60
    click element    ${classic_message_builder["create"]["header_accordion"]}
    Wait Until element Is Visible    ${classic_message_builder["create"]["message_name_input"]}    timeout=60

Open Body Header
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${iframes["top"]}
    Run Keyword If    ${is_visible}
    ...    Run Keywords    Select Frame    ${iframes["top"]}    # Click on main frame
    ...    AND    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    ...    AND    Wait Until element Is Visible    ${classic_message_builder["create"]["body_accordion"]}    timeout=60
    click element    ${classic_message_builder["create"]["body_accordion"]}
    Wait Until element Is Visible    ${classic_message_builder["create"]["message_body_text"]}    timeout=60