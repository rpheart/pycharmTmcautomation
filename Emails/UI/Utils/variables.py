# coding=utf-8
# navigation settings
system_page = {
    "view": "css=li.logo_button.insight_button",
    "analyze": "css=li.logo_button.optimize_button",
    "personalization": "css=li.logo_button.define_button",
    "email": "css=li.logo_button.engage_button",
    "social": "css=li.logo_button.social_button"
}

drop_down_menu = "css=div.btn-group.pull-right"
smart_focus_logo = "css=i.sf_logo"
document_title = "title=SmartFocus"
navigation_bar = "css=ul.si-module-navigation"

# iframes
iframes = {
    "top": "css=iframe.sfIFrame",
    "ccmd": "id=emv-ccmd-iframe"
}

generics = {
    "link_management": "xpath=//*[@id='toolbox']//a/div[contains(text(),'Link Management')]",
    "create_advanced_link": "xpath=//*[@id='navmenu']/li/a[contains(text(),'Create Advanced Link')]",
    "mirror_link": "xpath=//*[@id='navmenu']//a[contains(text(),'Mirror Link')]",
    "button_save_add_link": "id=iconSaveAdd",
    "close_box": "id=popCloseBox",
    "button_save": "id=iconSave",
    "text_box": "id=textContent",
    "insert_dynamic_content_block": "xpath=//*[@id='toolbox']//a/div[contains(text(),'Insert Dynamic Content Block')]",
    "popup_window": "id=popupFrame",
    "button_add_criteria": "xpath=//*[@id='iconAddCriteria']",
    "save_button": "id=iconButtonSave",
    "preview_button": "xpath=//*[@id='content']/table/tbody/tr/td[@id='ccmd-messages-cell-preview1']/a/img[@id='iconView']",
    "edit_button": "xpath=//*[@id='content']/table/tbody/tr/td[@id='ccmd-messages-cell-edit1']/a/img[@id='iconEdit']",
    "copy_button": "xpath=//*[@id='content']/table/tbody/tr/td[@id='ccmd-messages-cell-copy1']/a/img[@id='iconCopy']",
    "copy_page_title_choose": "xpath=//*[@id='content']//span[contains(text(),'Choose')]",
    "copy_page_new_name": "xpath=//*[@id='content']//span[contains(text(),'New Name:')]",
    "new_name_input": "id=nameInput",





}


# list types
classic_list = {
    "workflow": "css=#ccmd-messages-cell-workflow1.actionColumnUneven > a > #iconWfmAssign.sprite",
    "edit": "css=#ccmd-messages-cell-edit1 > a > #iconEdit",
    "favourites": "css=#favourites.actionColumnUneven > a > #span.checkbox",
    "copy": "css=#ccmd-messages-cell-copy1.actionColumnUneven > a > #iconCopy.sprite",
    "preview": "css=#ccmd-messages-cell-preview1.actionColumnUneven > a > #iconView.sprite",
    "test_message": "css=#ccmd-messages-cell-test1.actionColumnUneven > a > #iconCampaignTest.sprite",
    "audit_deliverability": "css=#ccmd-messages-cell-deliv1.actionColumnUneven > a > #iconDeliverability.sprite",
    "delete": "css=#ccmd-messages-cell-delete1.actionColumnUneven > a > #deleteMessage"
}

# pages
calendar = {
    "menu": "css=li#engage-calendar"
}

standard_campaign = {
    "menu": "css=li#engage-send",
    "button_add": "css=li.section.column2 > ul > li:nth-child(1) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column2 > ul > li:nth-child(1) > ul > li:nth-child(2)",
}

multivariate_campaign = {
    "menu": "css=li#engage-send",
    "button_add": "css=li.section.column2 > ul > li:nth-child(2) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column2 > ul > li:nth-child(2) > ul > li:nth-child(2)",
}

multimessage_campaign = {
    "menu": "css=li#engage-send",
    "button_add": "css=li.section.column2 > ul > li:nth-child(3) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column2 > ul > li:nth-child(3) > ul > li:nth-child(2)",
}

trigger_campaign = {
    "menu": "css=li#engage-send",
    "button_add": "css=li.section.column2 > ul > li:nth-child(4) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column2 > ul > li:nth-child(4) > ul > li:nth-child(2)",
}

new_message_builder = {
    "menu": "css=li#engage-create",
    "button_add": "css=li.section.column3 > ul > li:nth-child(1) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column3 > ul > li:nth-child(1) > ul > li:nth-child(2)",
}

classic_message_builder = {
    "menu": "css=li#engage-create",
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
        "message_preview": "css=span.blueBtnText",
        "button_messages_list": "xpath=//*[@id='ccmd-appBar-messagesButton']/tbody/tr/td[contains(text(),'Messages')]",
        "button_html_source": "xpath=//*[@id='tabHtml-tab']/a",
        "html_content_box": "id=tabHtml",

    },
    "list": {}
}

sms_message_builder = {
    "menu": "css=li#engage-create",
    "button_add": "css=li.section.column3 > ul > li:nth-child(3) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column3 > ul > li:nth-child(3) > ul > li:nth-child(2)",
}

landing_page = {
    "menu": "css=li#engage-create",
    "button_add": "css=li.section.column3 > ul > li:nth-child(4) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column3 > ul > li:nth-child(4) > ul > li:nth-child(2)",
}

content_block = {
    "menu": "css=li#engage-create",
    "button_add": "xpath=//*[@id='engage-create']//span[contains(text(),'Content Block')]/../ul/li",
    "button_list": "xpath=//*[@id='engage-create']//span[contains(text(),'Content Block')]/../ul/li[2] ",
    "content_block_name": "name=name",
    "content_block_description": "name=description",
    "toolbox_table": "id=toolbox",
    "grab_id_from_popup": "xpath=//*[@id='content']/form/table/tbody/tr[1]/td[1]"

}

webform = {
    "menu": "css=li#engage-create",
    "button_add": "css=li.section.column3 > ul > li:nth-child(6) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column3 > ul > li:nth-child(6) > ul > li:nth-child(2)",
}

template = {
    "menu": "css=li#engage-create",
    "button_add": "css=li.section.column3 > ul > li:nth-child(7) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column3 > ul > li:nth-child(7) > ul > li:nth-child(2)",
}

transactional_message = {
    "menu": "css=li#engage-create",
    "button_add": "css=li:nth-child(2).section.column3 > ul > li:nth-child(1) > ul > li:nth-child(1)",
    "button_list": "css=li:nth-child(2).section.column3 > ul > li:nth-child(1) > ul > li:nth-child(2)",
}

transactional_content_block = {
    "menu": "css=li#engage-create",
    "button_add": "css=li:nth-child(2).section.column3 > ul > li:nth-child(2) > ul > li:nth-child(1)",
    "button_list": "css=li:nth-child(2).section.column3 > ul > li:nth-child(2) > ul > li:nth-child(2)",
}

segments = {
    "menu": "id=engage-list-management",
    "button_add": "css=li.dropdown-module",  # "css=li.section.column2 > ul > li:nth-child(1) > ul > li:nth-child(1)",
    "button_list": "css=li.section.column2 > ul > li:nth-child(1) > ul > li:nth-child(2)",
}

add_subscriber = {
    "menu": "id=engage-list-management",
    "button_add": "css=ul.dropdown-modules.single-btn > li.dropdown-module"  # "css=li:nth-child(2).section.column2 > ul > li:nth-child(1) > ul > li:nth-child(1)"
}

search_subscriber = {
    "menu": "id=engage-list-management",
    "button_add": "css=li:nth-child(2).section.column2 > ul > li:nth-child(2) > ul > li:nth-child(1)"
}

import_subscriber = {
    "menu": "id=engage-list-management",
    "button_add": "css=li:nth-child(2).section.column2 > ul > li:nth-child(3) > ul > li:nth-child(1)",
    "button_list": "css=li:nth-child(2).section.column2 > ul > li:nth-child(3) > ul > li:nth-child(2)"
}

export_subscriber = {
    "menu": "id=engage-list-management",
    "button_add": "css=li:nth-child(2).section.column2 > ul > li:nth-child(4) > ul > li:nth-child(1)",
    "button_list": "css=li:nth-child(2).section.column2 > ul > li:nth-child(4) > ul > li:nth-child(2)"
}

image_library = {
    "menu": "css=li#image-library"
}

deliverability = {
    "menu": "css=li#engage-deliverability"
}

email_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "css=li.section.column3 > ul > li:nth-child(1) > ul > li:nth-child(1)"
}

multivariate_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "css=li.section.column3 > ul > li:nth-child(2) > ul > li:nth-child(1)"
}

multimessage_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "css=li.section.column3 > ul > li:nth-child(3) > ul > li:nth-child(1)"
}

test_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "css=li.section.column3 > ul > li:nth-child(4) > ul > li:nth-child(1)"
}

transactional_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "css=li.section.column3 > ul > li:nth-child(5) > ul > li:nth-child(1)"
}

trigger_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "css=li.section.column3 > ul > li:nth-child(6) > ul > li:nth-child(1)"
}

landing_page_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "css=li.section.column3 > ul > li:nth-child(7) > ul > li:nth-child(1)"
}

mobile_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "css=li:nth-child(2).section.column1 > ul > li:nth-child(1) > ul > li:nth-child(1)"
}

list_growth_reports = {
    "menu": "css=li#engage-reports",
    "button_add": "xpath=//li[@id='engage-reports']/div[2]/div/ul/li[3]/ul/li/ul/li"
}

folders = {
    "menu": "css=li#engage-folders"
}

workflow = {
    "menu": "css=li#engage-workflow",
    "button_add": "css=li.section.column2 > ul > li:nth-child(1) > ul > li:nth-child(1)",
}

workflow_model = {
    "menu": "css=li#engage-workflow",
    "button_add": "css=li.section.column2 > ul > li:nth-child(2) > ul > li:nth-child(1)"
}

approval = {
    "menu": "css=li#engage-approval"
}

# test data
xss_entries = [
    """EF<script> alert('random');</script>&GH"""
    # """?%&"ÄäÖörÜüß&@?%"">"&@??EF<script> alert('random');</script>&GH>''"""
]
