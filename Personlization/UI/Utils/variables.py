# coding=utf-8
# navigation settings
system_page = {
    "view": "css=li.logo_button.insight_button",
    "analyze": "css=li.logo_button.optimize_button",
    "personalization": "css=li.logo_button.define_button",
    # "email": "//*[@id='SFUI_Nav']//div[./text()='Email')]",
    "email": "css=li.logo_button.engage_button",
    "social": "css=li.logo_button.social_button"
}

drop_down_menu = "css=div.btn-group.pull-right"
smart_focus_logo = "css=i.sf_logo"
document_title = "title=SmartFocus"
navigation_bar = "css=ul.si-module-navigation"

# generic tabs
generics = {
    "workflow": "css=#ccmd-messages-cell-workflow1.actionColumnUneven > a > #iconWfmAssign.sprite",
    "edit": "css=#ccmd-messages-cell-edit1 > a > #iconEdit",
    "favourites": "css=#favourites.actionColumnUneven > a > #span.checkbox",
    "copy": "//*[@id='iconCopy']",
    "preview": "css=#ccmd-messages-cell-preview1.actionColumnUneven > a > #iconView.sprite",
    "test_message": "css=#ccmd-messages-cell-test1.actionColumnUneven > a > #iconCampaignTest.sprite",
    "audit_deliverability": "css=#ccmd-messages-cell-deliv1.actionColumnUneven > a > #iconDeliverability.sprite",
    "delete": "css=#ccmd-messages-cell-delete1.actionColumnUneven > a > #deleteMessage",
    "test_campaign_name": "name=campaignName",
    "new_test_email": "//*[@id='content']//input[@name='emailToAdd']",
    "add_email_to_test_recipients": "id=iconAddCriteria",
    "test_group_dropdown": "//select[@name='groupSelected']",
    "group_name": "//*[@id='content']//option[contains(text(),'QA_auto')]",
    "qa_test_email": "//*[@id='content']//td[contains(.,'qa.test@smartfocus.com')]/input",
    "auto_test_email": "//*[@id='content']//td[contains(.,'qa.auto@smartfocus.com')]/input",
    "update_group_button": "id=updateGroupBtn",
    "send_test_button": "//*[@id='iconArrowBack']/../a",
    "close_popup_box": "//*[@id='iconCancel' or @id='popCloseBox']",
    "send_test_message": "//*[@id='toolbox']//div[contains(text(),'Send Test Message')]",
    "create_new": "//*[contains(@class, 'applicationBar') and contains(text(), 'New')]",
    "add": "//*[contains(text(), 'Add') and (contains(@class, 'applicationBar') or contains(@class, 'appbar') or contains(@class, 'label'))]",
    "save": "//a[contains(text(),'Save') or ./text() = 'Save']",
    "next": "//a[contains(text(),'Next') or ./text() = 'Next']",
    "search_input": "//input[contains(@class, 'search') or contains(@class, 'Search') or contains(@name, 'search-input') or @type='text' and contains(@name, 'searchQuery') or contains(@data-ng-model, 'search')]",
    "search_button": "//*[contains(@id, 'searchButton') or contains(@id, 'searchInputButton') or contains(@class, 'search-button') or contains(@class, 'search-input-button') or @id='iconSearch']",
    "select_all": "//img[@id='iconSelectAll']",
    "trash": "//*[@id='iconTrash']",
    "ok_button": "//a[contains(text(), 'OK')]",
    "yes_button": "//*[(@type='submit' or @type='button') and contains(text(), 'Yes')]",
    "content_upload": {
        "link": "//*[@id='iconToolboxContentUpload']/../../a/div[contains(text(), 'Content Upload') or ./text() = 'Content Upload']",
        "popup_url_input": "name=uploadUrl",
        "popup_file_btn": "//a[contains(text(),'Upload')]",
    },
    "link_management": {
        "link": "//*[@id='iconToolboxLinksManagt']",
        "create_standard_link_btn": "//a[contains(text(),'Create Standard Link')]",
        "create_unsubscribe_link_btn": "//a[contains(text(),'Create Unsubscribe Link')]",
        "link_type_name": "name=linkName",
        "link_type_url": "name=linkURL",
        "page_ok": "name=linkPageOK",
        "page_error": "name=linkPageKO",
        "save_link": "//a[contains(text(),'Choice1: Save Link')]",
        "save&add_link": "//a[contains(text(),'Choice2: Save/Add Link')]",
        "create_advanced_link": "//a[contains(text(),'Create Advanced Link')]",
        "pers_link": "//a[contains(text(),'Pers. Link')]",
        "update_link": "//a[contains(text(),'Update Link')]",
        "action_link": "//a[contains(text(),'Action Link')]",
        "mirror_link": "//a[contains(text(),'Mirror Link')]",
        "landing_pages": "//a[contains(text(),'Landing Pages')]",
    },
    "insert_dynamic_content_block": {
        "link": "//*[@id='iconBannerSmall']"
    }
}

# pages
