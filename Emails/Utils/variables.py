# coding=utf-8
# navigation settings
# system pages
view_page = "css=ul.nav.navbar-nav.si-nav > li.logo_button.insight_button"
analyze_page = "css=ul.nav.navbar-nav.si-nav > li.logo_button.optimize_button"
personalization_page = "css=ul.nav.navbar-nav.si-nav > li.logo_button.define_button"
email_page = "css=ul.nav.navbar-nav.si-nav > li.logo_button.engage_button"
drop_down_menu = "css=div.btn-group.pull-right"
smart_focus_logo = "css=i.sf_logo"
document_title = "SmartFocus"

# iframes
iframes = {
    "top": "css=iframe.sfIFrame",
    "ccmd": "id=emv-ccmd-iframe"
}

# list types
classic_list = {
    "workflow": "css=#ccmd-messages-cell-workflow1.actionColumnUneven > a > #iconWfmAssign.sprite",
    "edit": "css=#ccmd-messages-cell-edit1.actionColumnUneven > a > #iconEdit.sprite",
    "favourites": "css=#favourites.actionColumnUneven > a > #span.checkbox",
    "copy": "css=#ccmd-messages-cell-copy1.actionColumnUneven > a > #iconCopy.sprite",
    "preview": "css=#ccmd-messages-cell-preview1.actionColumnUneven > a > #iconView.sprite",
    "test_message": "css=#ccmd-messages-cell-test1.actionColumnUneven > a > #iconCampaignTest.sprite",
    "audit_deliverability": "css=#ccmd-messages-cell-deliv1.actionColumnUneven > a > #iconDeliverability.sprite",
    "delete": "css=#ccmd-messages-cell-delete1.actionColumnUneven > a > #deleteMessage"
}

# pages
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
        "message_reply_to_email": "name=messageReplyToEmail",
        "message_reply_to_input": "name=messageReplyTo",
        "message_custom_header_input": "name=xheaderValue(HEADER)",
        "expert_tab": "css=#EXPERT.editorMode.editorModeActive.editorModeText",
        "text_editor": "css=#textContent",
        "message_preview": "css=span.blueBtnText"
    },
    "list": {

    }
}

# test data
xss_entries = [
    """EF<script> alert('random');</script>&GH"""
    # """?%&"ÄäÖörÜüß&@?%"">"&@??EF<script> alert('random');</script>&GH>''"""
]
