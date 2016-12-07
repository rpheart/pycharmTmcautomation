# navigation settings
# system pages
view_page = "css=ul.nav.navbar-nav.si-nav > li.logo_button.insight_button"
analyze_page = "css=ul.nav.navbar-nav.si-nav > li.logo_button.optimize_button"
personalization_page = "css=ul.nav.navbar-nav.si-nav > li.logo_button.define_button"
email_page = "css=ul.nav.navbar-nav.si-nav > li.logo_button.engage_button"
drop_down_menu = "css=div.btn-group.pull-right"
smart_focus_logo = "css=i.sf_logo"

# iframes
iframes = {
    "top": "css=iframe.sfIFrame",
    "ccmd": "id=emv-ccmd-iframe"
}

classic_message_builder = {
    "menu_list": "css=li#engage-create",
    "button_add": "css=li.section.column3 > ul > li:nth-child(2) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column3 > ul > li:nth-child(2) > ul > li:nth-child(2)",
    "create": {
        "header_accordion": "css=img#accordionIcon.accordionIcon.sprite",
        "body_accordion": "css=img.accordionIcon.msg-body02.sprite",
        "save_button": "id=iconButtonSave",
        "message_name_input": "name=messageName",
        "message_description_input": "name=messageDescription",
        "message_from_input": "name=messageFrom",
        "message_to_input": "name=messageTo",
        "message_subject_input": "name=messageSubject",
        "message_reply_to_input": "name=messageReplyTo",
        "message_custom_header_input": "name=xheaderValue(HEADER)",
        "message_body_text":"css=textarea#textContent.textbox",
        "message_preview":"css=span.blueBtnText"
    },
    "list": {

    }
}

# test data
xss_entries = [
    """EF<script> alert('random');</script>&GH""",
    """AB<script> alert('random');</script>"CD"""
]
