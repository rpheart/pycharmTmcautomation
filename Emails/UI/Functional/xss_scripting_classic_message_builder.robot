*** Settings ***
Documentation       Suite description
Resource            Emails/UI/Utils/keywords.robot
Default Tags        ui    email    xss

*** Variables ***

*** Test Cases ***
Login And Go To Classic Message Builder
    Login
    Set Selenium Speed    0.1
    Go To ${system_page["email"]}
    Open Content    ${classic_message_builder}      ${classic_message_builder["button_add"]}

XSS scripts in message headers
    :FOR    ${script}    In    @{xss_entries}
    \    ${message_text}=    catenate    [EMV TEXTPART]    ${script}    [EMV HTMLPART]<html><body>    ${script}    </body></html>  # create a html message version of the ${script}
    \    Open Message Header
    \    Input Text    ${classic_message_builder["create"]["message_name_input"]}    ${script}
    \    Input Text    ${classic_message_builder["create"]["message_description_input"]}    ${script}
    \    Input Text    ${classic_message_builder["create"]["message_from_input"]}    ${script}
    \    Input Text    ${classic_message_builder["create"]["message_to_input"]}    ${script}
    \    Input Text    ${classic_message_builder["create"]["message_subject_input"]}    ${script}
    \    Input Text    ${classic_message_builder["create"]["message_reply_to_email"]}    patrick.summers@smartfocus.com
    \    Input Text    ${classic_message_builder["create"]["message_reply_to_input"]}    ${script}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Content    ${classic_message_builder}      ${classic_message_builder["button_list"]}
    \    Select Frame    ${iframes["top"]}    # Click on main frame
    \    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    \    Click Element    ${classic_list["edit"]}
    \    Open Message Header
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_name_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Header has been stripped of XSS text
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_description_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Description has been stripped of XSS text
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_from_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=From has been stripped of XSS text
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_to_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=To has been stripped of XSS text
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_subject_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Subject has been stripped of XSS text
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["message_reply_to_input"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${script}    message=Reply To Label has been stripped of XSS text
    \    Open Message Body
    \    Input Text    ${classic_message_builder["create"]["text_editor"]}    ${message_text}
    \    Click Element    ${classic_message_builder["create"]["save_button"]}
    \    Open Content    ${classic_message_builder}      ${classic_message_builder["button_list"]}
    \    Select Frame    ${iframes["top"]}    # Click on main frame
    \    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    \    Click Element    ${classic_list["edit"]}
    \    ${get_text}=    Get Element Attribute    ${classic_message_builder["create"]["text_editor"]}@value
    \    Should Be Equal As Strings    ${get_text}    ${message_text}    message=Body has been stripped of XSS text
    \    Click Element    ${classic_message_builder["create"]["message_preview"]}
    \    Sleep    1
    \    ${message_part}=    Confirm Action
    \    Should Be Equal As Strings    ${message_part}    random
    \    Select Frame    id=popupFrame
    \    ${text}=    Get Text    css=table.settingsTable1View > tbody > tr:nth-child(1) > td:nth-child(2)
    \    Should Be Equal As Strings    ${text}    ${script}    message=From preview has been stripped of XSS text
    \    ${text}=    Get Text    css=table.settingsTable1View > tbody > tr:nth-child(3) > td:nth-child(2)
    \    Should Be Equal As Strings    ${text}    ${script}    message=Reply To (label part) preview has been stripped of XSS text
    \    ${text}=    Get Text    css=table.settingsTable1View > tbody > tr:nth-child(4) > td:nth-child(2)
    \    Should Be Equal As Strings    ${text}    patrick.summers@smartfocus.com    message=Reply To (email part) preview has been stripped of XSS text
    \    ${text}=    Get Text    css=table.settingsTable1View > tbody > tr:nth-child(5) > td:nth-child(2)
    \    Should Be Equal As Strings    ${text}    ${script}    message=Subject preview has been stripped of XSS text
    \    Click Element    id=tabText-tab
    \    Select Frame    id=iframeText
    \    ${text}=    Get Text    css=pre
    \    Should Be Equal As Strings    ${text.strip()}    ${script}    message=Text preview has been stripped of XSS text
    \    Select Frame    id=popupFrame
    \    Select Frame    ${iframes["ccmd"]}
    \    Click Element    id=popCloseBox

*** Keywords ***
Open Message Header
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${iframes["top"]}
    Run Keyword If    ${is_visible}
    ...    Run Keywords    Select Frame    ${iframes["top"]}    # Click on main frame
    ...    AND    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    ...    AND    Wait Until element Is Visible    ${classic_message_builder["create"]["header_accordion"]}    timeout=60
    click element    ${classic_message_builder["create"]["header_accordion"]}
    Wait Until element Is Visible    ${classic_message_builder["create"]["message_name_input"]}    timeout=60

Open Message Body
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${iframes["top"]}
    Run Keyword If    ${is_visible}
    ...    Run Keywords    Select Frame    ${iframes["top"]}    # Click on main frame
    ...    AND    Select Frame    ${iframes["ccmd"]}    # Click on inner frame
    ...    AND    Wait Until element Is Visible    ${classic_message_builder["create"]["body_accordion"]}    timeout=60
    click element    ${classic_message_builder["create"]["body_accordion"]}
    Wait Until element Is Visible    ${classic_message_builder["create"]["expert_tab"]}    timeout=60