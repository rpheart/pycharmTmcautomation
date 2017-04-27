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

# iframes
iframes = {
    "top": "css=iframe.sfIFrame",
    "ccmd": "id=emv-ccmd-iframe",
    "popup_frame": "id=popupFrame",
    "image_library_editor": "id=msg-editor-imagelib-iframe",
    "html_preview": "//*[@id='iframeHtml']"
}

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
    "first_add_button": "//*[@id='iconAddCriteria' or @id='iconAdd']",
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
calendar = {
    "menu": "//*[@id='engage-calendar']/div[./text()='Calendar']"
}

standard_campaign = {
    "menu": "//*[@id='engage-send']/div[./text()='Send']",
    "label": "//*[@id='engage-send']//span[./text()='Campaigns']",
    "button_add": {
        "add": "//*[@id='engage-send']//ul[@title='Standard']/li"
    },
    "button_list": {
        "list": "//*[@id='engage-send']//ul[@title='Standard']/li[2]",
        "standard_campaigns": "//*[@id='ccmd-appBar-standardCampaignsButton']//td[./text()='Standard Campaigns']",
        "header_status": "//*[@id='content']//th[./text()='Status']",
        "header_id": "//*[@id='content']//th[./text()='ID']",
        "header_name": "//*[@id='content']//th[./text()='Name']",
        "header_message": "//*[@id='content']//th[./text()='Message']",
        "header_segment": "//*[@id='content']//th[./text()='Segment']",
        "header_created_by": "//*[@id='content']//th[./text()='Created by']",
        "header_date": "//*[@id='content']//th[./text()='Date']",
        "header_pct": "//*[@id='content']//th[./text()='PCT']",
        "header_workflow": "//*[@id='content']//th[./text()='Workflow']",
        "header_edit": "//*[@id='content']//th[./text()='Edit']",
        "header_favorites": "//*[@id='content']//th[./text()='Favorites']",
        "header_copy": "//*[@id='content']//th[./text()='Copy']",
        "header_test": "//*[@id='content']//th[./text()='Test']",
        "header_deliv_test": "//*[@id='content']//th[./text()='Deliv. Test']",
        "header_post": "//*[@id='content']//th[./text()='Post']",
        "header_fast_post": "//*[@id='content']//span[@class='red' and ./text()='Fast Post']",
        "header_delete": "//*[@id='content']//span[@class='red' and ./text()='Delete']",
        "copy": "//*[@id='iconCopy']",
        "rename_input": "//*[@name='campaignNewName']"
    }
}

multivariate_campaign = {
    "menu": "//*[@id='engage-send']/div[./text()='Send']",
    "button_add": {
        "add": "//*[@id='engage-send']//ul[@title='MultiVariate']/li",
        "multivariate_tests": "//*[@id='splitrunUI-mainMenu-archiveButton']//span[./text()='MultiVariate Tests']",
        "define_campaign_and_recipients": "//*[@id='splitrunUI-builderView-breadcrumb-1']//div[contains(text(),'Define campaign and recipients')]",
        "1_campaign_name_and_description": "//*[@id='splitrunuidiv']//legend[contains(text(),'1. Campaign name and description')]",
        "campaign_name": "//*[@id='splitrunuidiv']//div[contains(text(),'Campaign Name')]",
        "name_input": "//*[@id='splitrunUI-builderView-nameInput']",
        "campaign_description": "//*[@id='splitrunuidiv']//div[contains(text(),'Campaign description')]",
        "description_input": "//*[@id='splitrunUI-builderView-descriptionInput']",
        "2_select_message": "//*[@id='splitrunuidiv']//legend[contains(text(),'2. Select message')]",
        "message": "//*[@id='splitrunuidiv']//div[contains(text(),'Message')]",
        "select_a_message": "//*[@id='splitrunUI-builderView-messagesExplorer-openButton']//div[contains(text(),'Select a message')]",
        "first_message": "//div[@id='splitrunUI-builderView-messagesExplorer-nameColumn']",
        "3_select_recipients": "//*[@id='splitrunuidiv']//legend[contains(text(),'3. Select recipients')]",
        "segment": "//*[@id='splitrunuidiv']//div[contains(text(),'Segment')]",
        "select_one_or_more_segments": "//*[@id='splitrunUI-builderView-segmentsExplorer-openButton']//div[contains(text(),'Select one or more segments')]",
        "segment_favourites": "//*[@id='splitrunUI-builderView-segmentsExplorer-favoritesButton']",
        "qa_team_segment": "//div[contains(text(), 'QA TEAM')]",
        "ok_button": "//*[@id='splitrunUI-builderView-segmentsExplorer-addEntitiesButton']",
        "continue_button": "//*[@id='splitrunUI-builderView-nextButton']//div[contains(text(),'Continue')]",
        "1_select_the_variable_you_want_to_test": "//*[@id='splitrunuidiv']//legend[./text()='1. Select the variable you want to test']",
        "define_versions_and_samples": "//*[@id='splitrunUI-builderView-breadcrumb-2']//div[contains(text(),'Define versions and samples')]",
        "variable_subject": "//*[@id='splitrunUI-builderView-testElementMenuBar-Subject']/img",
        "variable_send_date_and_time": "//*[@id='splitrunUI-builderView-testElementMenuBar-SendDateTime']/img",
        "variable_sender": "//*[@id='splitrunUI-builderView-testElementMenuBar-Sender']/img",
        "variable_dynamic_content": "//*[@id='splitrunUI-builderView-testElementMenuBar-Banner']/img",
        "variable_image": "//*[@id='splitrunUI-builderView-testElementMenuBar-Image']/img",
        "variable_message": "//*[@id='splitrunUI-builderView-testElementMenuBar-Message']/img",
        "2_define_test_versions_up_to_20": "//*[@id='splitrunuidiv']//legend[contains(text(),'2. Define test versions (up to 20)')]",
        "sample_selection": "//*[@id='splitrunuidiv']//div[contains(text(),'Sample Selection')]",
        "percent_segmentation_button": "//*[@id='splitrunUI-builderView-percentSegmentationButton']/tbody/tr/td/div/img",
        "percent_input_verion_0": "id=splitrunUI-builderView-testSubject-percentInput-version0",
        "percent_input_version_1": "id=splitrunUI-builderView-testSubject-percentInput-version1",
        "number_segmentation_button": "//*[@id='splitrunUI-builderView-numberSegmentationButton']/tbody/tr/td/div/img",
        "version_2_input": "//*[@id='splitrunUI-builderView-testSubject-subjectInput-version1']",
        "select_a_field": "//*[@id='splitrunUI-builderView-testSubject-persoFieldsButton-version1']/div",
        "select_email_select_a_field": "//*[@id='splitrunUI-builderView-testSubject-persoFieldsList-version1']/option[contains(text(),'EMAIL')]",
        "subject_input_version_1": "id=splitrunUI-builderView-testSubject-subjectInput-version1",
        "label_add_version": "//*[@id='splitrunUI-builderView-addVersionButton']//div[contains(text(),'Add version')]",
        "1_schedule_the_multivariate_test": "//*[@id='splitrunuidiv']//legend[./text()='1. Schedule the MultiVariate Test']",
        "send_test_and_schedule_winning_campaign": "//*[@id='splitrunUI-builderView-breadcrumb-3']//div[contains(text(),'Send test and schedule winning campaign')]",
        "send_now_redio_button": "id=splitrunUI-builderView-sendNowRadioButton",
        "send_later_redio_button": "id=splitrunUI-builderView-sendLaterRadioButton",
        "2_select_success_key_indicator_and_schedule_the_winning_campaign": "//*[@id='splitrunuidiv']//legend[./text()='2. Select success key indicator and schedule the winning campaign']",
        "key_indicator_dropdown": "id=splitrunUI-builderView-kpiInput",
        "send_after": "id=splitrunUI-builderView-autoSendRadioButton",
        "24_hours_input": "id=splitrunUI-builderView-autoSendInput",
        "opti_send_redio_button": "id=splitrunUI-builderView-optiSendRadioButton",
        "manual_radio_button": "id=splitrunUI-builderView-manualRadioButton",
        "more_options": "//*[@id='splitrunUI-builderView-moreOptionsButton']//div[./text()='More options']",
        "back_button": "//*[@id='splitrunUI-builderView-previousButton']//div[contains(text(),'Back')]",
        "schedule_button": "//*[@id='splitrunUI-builderView-sendCampaignButton']//div[contains(text(),'Schedule')]",
        "add_recipient": "//*[@id='splitrunUI-builderView-alertRecipients-item0-emailInput']",
        "track_link_hostname": "//*[@id='splitrunUI-builderView-brandedTrackerHostInput']",
        "track_url": "//td[contains(@class, 'firstSubjectBackground')]//input[contains(@id, 'splitrunUI-builderView')]",
        "version_one_preview": "//*[@class='GDPGA2PBNQ-com-emailvision-splitrun-ui-client-component-preview-Preview-IPreviewCssResource-previewThumbPanel']",
        "schedule_rollout_icon": "//*[@id='splitrunUI-preview-scheduleIcon']",
        "send_rollout_button": "//*[@id='splitrunUI-resultView-rolloutPopupLaunchButton']//div[contains(text(), 'Send')]"
    },
    "button_list": {
        "list": "//*[@id='engage-send']//ul[@title='MultiVariate']/li[2]",
        "multivariate_tests": "//*[@id='splitrunUI-mainMenu-archiveButton']//span[./text()='MultiVariate Tests']",
        "campaign_name": "//*[@id='splitrunuidiv']//div[./text()='Campaign Name']",
        "id": "//*[@id='splitrunuidiv']//div[./text()='ID']",
        "status": "//*[@id='splitrunuidiv']//div[./text()='Status']",
        "test_variable": "//*[@id='splitrunuidiv']//div[./text()='Test variable']",
        "send_date": "//*[@id='splitrunuidiv']//div[./text()='Send date']",
        "message_count": "//*[@id='splitrunUI-archiveView-archiveFooterLabel']/tbody/tr/td/div",
        "first_row": "//*[@__gwt_row='0']",
        "first_campaign_name": "//*[@__gwt_row='0']/td[1]",
        "refresh_button": "//table//img[contains(@class, 'GreyButtonWithIcon')]",
        "delete_button": "//*[contains(@id, 'splitrunUI-archiveView-deleteButton')]",
        "edit_button": "//*[contains(@id, 'splitrunUI-archiveView-editButton')]",
        "view_button": "//*[contains(@id, 'splitrunUI-archiveView-viewButton')]"
    }
}

multimessage_campaign = {
    "menu": "//*[@id='engage-send']/div[./text()='Send']",
    "button_add": {
        "add": "//*[@id='engage-send']//ul[@title='MultiMessage']/li",
        "multi_messages": "//*[@id='splitrunUI-mainMenu-archiveButton']//span[./text()='MultiMessages']",
        "define_campaign_and_recipients": "//*[@id='splitrunUI-builderView-breadcrumb-1']//div[contains(text(),'Define campaign and recipients')]",
        "campaign_name_and_description": "//*[@id='splitrunuidiv']//legend[contains(text(),'1. Campaign name and description')]",
        "campaign_name": "//*[@id='splitrunuidiv']//div[contains(text(),'Campaign Name')]",
        "input_name": "//*[@id='splitrunUI-builderView-nameInput']",
        "campaign_description": "//*[@id='splitrunuidiv']//div[contains(text(),'Campaign description')]",
        "input_description": "//*[@id='splitrunUI-builderView-descriptionInput']",
        "select_recipients": "//*[@id='splitrunuidiv']//legend[contains(text(),'2. Select recipients')]",
        "segment": "//*[@id='splitrunuidiv']//div[contains(text(),'Segment')]",
        "select_one_or_more_segments": "//*[@id='splitrunUI-builderView-segmentsExplorer-openButton']//div[contains(text(),'Select one or more segments')]",
        "segment_favourites": "//*[@id='splitrunUI-builderView-segmentsExplorer-favoritesButton']",
        "qa_team_segment": "//div[contains(text(), 'QA TEAM')]",
        "qa_auto_test_segment": "//*[@id='splitrunUI-builderView-segmentsExplorer-nameColumn' and contains(text(),'QA auto test Segment')]",
        "ok_button": "//*[@id='splitrunUI-builderView-segmentsExplorer-addEntitiesButton']//div[contains(text(),'Ok')]",
        "continue_button": "//*[@id='splitrunUI-builderView-nextButton']//div[contains(text(),'Continue')]",
        "define_campaign_messages_up_to_20": "//*[@id='splitrunuidiv']//legend[contains(text(),'1. Define campaign messages (up to 20)')]",
        "define_messages_and_partitions": "//*[@id='splitrunUI-builderView-breadcrumb-2']//div[contains(text(),'Define messages and partitions')]",
        "message_one_list": "//*[@id='splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton']",
        "message_one_first_message": "//*[@id='splitrunUI-builderView-testMessage-messagesExplorer-version1-nameColumn']",
        "message_two_list": "//*[@id='splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton']",
        "message_two_first_message": "//*[@id='splitrunUI-builderView-testMessage-messagesExplorer-version2-nameColumn']",
        "add_message": "//*[@id='splitrunUI-builderView-addVersionButton']//div[contains(text(),'Add message')]",
        "back_button": "//*[@id='splitrunUI-builderView-previousButton']//div[contains(text(),'Back')]",
        "preview_button": "//*[@id='splitrunUI-builderView-previewVersionsButton']//div[contains(text(),'Preview all versions')]",
        "1_schedule_the_campaign": "//*[@id='splitrunuidiv']//legend[contains(text(),'1. Schedule the campaign')]",
        "schedule_campaign": "//*[@id='splitrunUI-builderView-breadcrumb-3']//div[contains(text(),'Schedule campaign')]",
        "send_now_radio_button": "id=splitrunUI-builderView-sendNowRadioButton",
        "send_later_radio_button": "id=splitrunUI-builderView-sendLaterRadioButton",
        "schedule_button": "//*[@id='splitrunUI-builderView-sendCampaignButton']//div[contains(text(),'Schedule')]",
        "button_new": "//span[contains(text(),'New') or ./text() = 'New']",
        "more_options": "//*[@id='splitrunUI-builderView-moreOptionsButton']",
        "add_recipient_button": "//*[@id='splitrunUI-builderView-alertRecipients-addButton']/div",
        "add_recipient": "//*[@id='splitrunUI-builderView-alertRecipients-item0-emailInput']",
        "track_link_hostname": "//*[@id='splitrunUI-builderView-brandedTrackerHostInput']",
        "track_url": "//*[@id='splitrunUI-builderView-endOfTrackingUrlInput']",
    },
    "button_list": {
        "list": "//*[@id='engage-send']//ul[@title='MultiMessage']/li[2]",
        "multi_messages": "//*[@id='splitrunUI-mainMenu-archiveButton']//span[./text()='MultiMessages']",
        "campaign_name": "//*[@id='splitrunuidiv']//div[./text()='Campaign Name']",
        "id": "//*[@id='splitrunuidiv']//div[./text()='ID']",
        "status": "//*[@id='splitrunuidiv']//div[./text()='Status']",
        "send_date": "//*[@id='splitrunuidiv']//div[./text()='Send date']",
        "table": "xpath=//*[@id='splitrunuidiv']/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div/table",
        "message_count": "//*[@id='splitrunUI-archiveView-archiveFooterLabel']/tbody/tr/td/div",
        "first_row": "//tr[@__gwt_row='0']",
        "refresh_button": "//table//img[contains(@class, 'GreyButtonWithIcon')]",
        "delete_button": "//*[contains(@id, 'splitrunUI-archiveView-deleteButton')]",
        "edit_button": "//*[contains(@id, 'splitrunUI-archiveView-editButton')]",
        "view_button": "//*[contains(@id, 'splitrunUI-archiveView-viewButton')]"
    }
}

trigger_campaign = {
    "menu": "//*[@id='engage-send']/div[./text()='Send']",
    "button_add": {
        "add": "//*[@id='engage-send']//ul[@title='Trigger']/li"
    },
    "button_list": {
        "list": "//*[@id='engage-send']//ul[@title='Trigger']/li[2]",
        "trigger_campaigns": "//*[@id='ccmd-appBar-triggerCampaignsButton']//td[./text()='Trigger Campaigns']",
        "header_id": "//*[@id='content']//th[./text()='ID']",
        "header_trigger_campaign_name": "//*[@id='content']//th[./text()='Trigger Campaign Name']",
        "header_segment": "//*[@id='content']//th[./text()='Segment']",
        "header_manager": "//*[@id='content']//th[./text()='Manager']",
        "header_start_date": "//*[@id='content']//th[./text()='Start Date']",
        "header_end_date": "//*[@id='content']//th[./text()='End Date']",
        "header_timezone": "//*[@id='content']//th[./text()='Timezone']",
        "header_status": "//*[@id='content']//th[./text()='Status']",
        "header_assign": "//*[@id='content']//th[./text()='Assign']",
        "header_stop_start": "//*[@id='content']//th[./text()='Stop/Start']",
        "header_edit": "//*[@id='content']//th[./text()='Edit']",
        "header_delete": "//*[@id='content']//span[@class='red' and ./text()='Delete']"
    }
}

new_message_builder = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "standard_content": "//*[@id='engage-create']//span[contains(text(),'Standard Content')]",
    "button_add": {
        "add": "//*[@id='engage-create']//ul[@title='Message Builder']/li",
        "general_settings": "id=general-settings",
        "untitled": "//*[@id='action-bar-name'][./text()='Untitled']",
        "input_name": "//*[@id='action-bar-inputname']",
        "add_a_row": "//*[@id='action-bar-addrow']/span[./text()='Add a row']",
        "add_content": "//*[@id='action-bar-addcontent']/span[./text()='Add content']",
        "change_style": "//*[@id='action-bar-styles']/span[./text()='Change style']",
        "links": "//*[@id='action-bar-links']/span[./text()='Links']",
        "tests": "//*[@id='action-bar-tests']/span[./text()='Tests']",
        "import": "//*[@id='action-bar-import']/span[./text()='Import']",
        "import_input": "//*[@id='action-bar-import-input' and @type='file']",
        "export": "//*[@id='action-bar-export']/a/span[./text()='Export']",
        "headers": "//div[contains(@class, 'item ') and text()='Headers']",
        "visual": "//*[@id='editor-switch']//div[./text()='Visual']",
        "plain_text": "//*[@id='editor-switch']//div[./text()='Plain-text']",
        "contents_panel": "//*[@id='content-palette']//div[text()='Contents']",
        "layout": "id=palette-contents-carousel-layout",
        "basic": "id=palette-contents-carousel-basic",
        "content_blocks": "id=palette-contents-carousel-content-blocks",
        "drop_content_here": "//*[@id='message-html']//span[normalize-space(.//text())='Drop content here']",
        # "text_icon": "//*[@id='content-type-item-text']/div[@class='icon text-icon']",
        # "image_icon": "//*[@id='content-type-item-image']/div[@class='icon image-icon']",
        # "text_image_icon": "//*[@id='content-type-item-text-image']/div[@class='icon text-image-icon']",
        # "image_text_icon": "//*[@id='content-type-item-image-text']/div[@class='icon image-text-icon']",
        # "share_icon": "//*[@id='content-type-item-share']/div[@class='icon share-icon']",
        # "html_icon": "//*[@id='content-type-item-html']/div[@class='icon html-icon']",
        # "spacer_icon": "//*[@id='content-type-item-spacer']/div[@class='icon spacer-icon']",
        # "video_icon": "//*[@id='content-type-item-video']/div[@class='icon video-icon']",
        # "reco_icon": "//*[@id='content-type-item-reco']/div[@class='icon reco-icon']",
        "text_widget": "//*[@id='content-type-item-text']",
        "image_widget": "//*[@id='content-type-item-image']",
        "text_image_widget": "//*[@id='content-type-item-text-image']",
        "image_text_widget": "//*[@id='content-type-item-image-text']",
        "share_widget": "//*[@id='content-type-item-share']",
        "html_widget": "//*[@id='content-type-item-html']",
        "spacer_widget": "//*[@id='content-type-item-spacer']",
        "video_widget": "//*[@id='content-type-item-video']",
        "smart_personalisation_widget": "//*[@id='content-type-item-reco']",
        "chevron_left": "//*[@id='editor-switch']/div/div[4]",
        "message_name": "//*[@id='action-bar-name']",
        "message_name_input": "//*[@id='action-bar-inputname']",
        "empty_canvas": "//div[contains(@class, 'content-cell empty')]",
        "add_empty_row": "//*[@id='action-bar-addrow-icon']",
        "save_as_a_template": "//*[@id='msg-editor-btnsaveastemplate']",
        "save": "//*[@id='msg-editor-btnsave']",
        "save_and_finalize": "//*[@id='msg-editor-btnfinalise']",
        "company_sender": "//input[@placeholder='Company Sender']",
        "reply_to_email": "//input[contains(@data-bind, 'replyToEmail')]",
        "reply_to_label": "//input[@placeholder='My Reply To Label']",
        "subject": "//input[@placeholder='What is your subject line?']",
        "send_to": "//input[@placeholder='{{FIRSTNAME}} {{LASTNAME}}']",
        "content_block_search_input": "//*[@id='content-blocks-region']/div/div[3]/div/input",
        "content_block_search_button": "//*[@id='content-blocks-region']/div/div[3]/div/div/div[2]/div[2]",
        "templates": "//*[@id='palette-contents-carousel-templates']",
        "templates_search_input": "//*[@id='templates-region']/div/div[2]/div/input",
        "templates_search_button": "//*[@id='templates-region']/div/div[2]/div/div/div[2]/div[2]",
        "save_template_input": "//*[@id='template-name-container']/input",
        "save_template_button": "//*[@id='template-btnsave']",
        "add_recipients": "//*[@id='test-email-search-input-container']/div/div/div[2]/div[1]",
        "tests_panel": "//*[@id='content-palette']//div[text()='Tests']",
        "send_test_emails": "//*[@id='send-test-emails']",
        "first_test_email_slider": "//*[@class='test-email']/div/div[2]",
        "send_test_search_input": "//*[@id='test-email-search-input-container']/div/input",
        "send_test_search_button": "//*[@id='test-email-search-input-container']/div/div/div[2]/div[2]",
        "text_content_box": "//*[@class='content-cell editable text']",
        "add_a_picture": "//*[contains(text(), 'Add a picture')]",
        "first_image": "//*[@class='image ng-scope']",
        "apply_and_close": "//*[@id='image-popup-options-apply']",
        "add_a_link": "//*[contains(text(), 'Add a link')]"
    },
    "button_list": {
        "list": "//*[@id='engage-create']//ul[@title='Message Builder']/li[2]",
        "name": "//*[@id='msg-archive-tablediv-header-name']/div[@title='Name']",
        "status": "//*[@id='msg-archive-tablediv-header-message-status']/div[@title='Status']",
        "mode": "//*[@id='msg-archive-tablediv-header-message-mode']/div[@title='Mode']",
        "created": "//*[@id='msg-archive-tablediv-header-creation-date']/div[@title='Created']",
        "last_modified": "//*[@id='msg-archive-tablediv-header-modification-date']/div[@title='Last modified']",
        "creator": "//*[@id='msg-archive-tablediv-header-creation-user']/div[@title='Creator']",
        "qa_auto_test_Message": "//*[@id='archive-list-container']//div[./text()='QA auto test Message']",
        "message_count": "//span[@class='tabledivFooterText']",
        "first_row": "//*[@id='tabledivRow-0']",
        "duplicate": "//*[contains(@id, 'duplicateenable')]",
        "rename_input": "//*[@id='archive-duplicate-name']",
        "duplicate_button": "//div[contains(text(), 'Duplicate')]",
        "delete_button": "//*[contains(@id, 'deleteenable')]",
        "edit_button": "//*[contains(@id, 'editenable')]",
        "convert_to_html_button": "//*[contains(@id, 'convertenable')]",
        "preview_button": "//*[contains(@id, 'preview-icon')]"
    }
}

classic_message_builder = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "standard_content": "//*[@id='engage-create']//span[contains(text(),'Standard Content')]",
    "button_add": {
        "add": "//*[@id='engage-create']//ul[@title='Message']/li",
        "header_accordion": "css=img#accordionIcon.accordionIcon.sprite",
        "body_accordion": "css=img.accordionIcon.msg-body02.sprite",
        "expert_content": "name=expertContent",
        "accordion_icon": "id=accordionIcon",
        "save_button": "css=#messageAccordion > form > div:nth-child(5) > table > tbody > tr > td > a:nth-child(1)",
        "save_and_view_the_result": "css=#messageAccordion > form > div:nth-child(5) > table > tbody > tr > td > a:nth-child(3)",
        "message_name_input": "name=messageName",
        "message_description_input": "name=messageDescription",
        "message_from_input": "name=messageFrom",
        "message_to_input": "name=messageTo",
        "from_member_columns": "name=fromMemberColumns",
        "to_member_columns": "name=toMemberColumns",
        "subject_member_columns": "name=subjectMemberColumns",
        "message_encoding": "name=messageEncoding",
        "to_reply_to_email": "name=toReplyToEmail",
        "message_reply_to_label_input": "name=messageReplyTo",
        "to_reply_to_input": "name=toReplyTo",
        "message_subject_input": "name=messageSubject",
        "message_reply_to_email_input": "name=messageReplyToEmail",
        "message_custom_header_input": "name=xheaderValue(HEADER)",
        "expert_tab": "css=#EXPERT.editorMode.editorModeActive.editorModeText",
        "text_editor": "id=textContent",
        "message_preview": "//*[@id='previewBtn']",
        "from_member_columns_select_firstname": "//*[@id='content']//select[@name='fromMemberColumns']//option[contains(text(),'FIRSTNAME')]",
        "to_member_columns_select_member_id": "//*[@id='content']//select[@name='toMemberColumns']//option[contains(text(),'MEMBER_ID')]",
        "subject_member_culums_select_title": "//*[@id='content']//select[@name='subjectMemberColumns']//option[contains(text(),'TITLE')]",
        "to_reply_to_email_select_email": "//*[@id='content']//select[@name='toReplyToEmail']//option[contains(text(),'EMAIL')]",
        "to_reply_to_select_source": "//*[@id='content']//select[@name='toReplyTo']//option[contains(text(),'SOURCE')]",
        "general_us_and_west_european": "//*[@id='content']//option[contains(text(),'General US & West European (iso-8859-15)')]",
        "create_and_personalize": "//*[@id='messageAccordion']//b[./text() = 'Create and Personalize']",
        "expert": "id=EXPERT",
        "visual": "id=VISUAL",
        "template": "id=TEMPLATE",
        "share_link": "//*[@id='iconToolboxShare']/../../a[contains(text(), 'Share') or ./text() = 'Share']",
        "content_upload_link": "//*[@id='iconToolboxContentUpload']/../../a/div[contains(text(), 'Content Upload') or ./text() = 'Content Upload']",
        "copy_html_to_text_link": "//*[@id='iconToolboxCopyHtmlToText']/../../a/div[contains(text(), 'Copy Html to Text') or ./text() = 'Copy Html to Text']",
        "insert_imate_link": "//*[@id='iconToolboxInsertImage']/../../a/div[contains(text(), 'Insert Image') or ./text() = 'Insert Image']",
        "insert_dynamic_content_block_link": "//*[@id='iconBannerSmall']/../../a/div[contains(text(), 'Insert Dynamic Content Block') or ./text() = 'Insert Dynamic Content Block']",
        "track_all_link": "//*[@id='iconToolboxTrackLinks']/../../a/div[contains(text(), 'Track All Links') or ./text() = 'Track All Links']",
        "link_management_link": "//*[@id='iconToolboxLinksManagt']/../../a/div[contains(text(), 'Link Management') or ./text() = 'Link Management']",
        "external_content_link": "//*[@id='iconToolboxCMS']/../../a/div[contains(text(), 'External Content') or ./text() = 'External Content']",
        "message_personalization_link": "//*[@id='iconToolboxMessagePerso']/../../a/div[contains(text(), 'Message Personalization') or ./text() = 'Message Personalization']",
        "insert_emoji_link": "//*[@id='iconToolboxMessageEmoji']/../../a/div[contains(text(), 'Insert Emoji') or ./text() = 'Insert Emoji']",
        "send_test_message_link": "//*[@id='iconToolboxMessageSendTest']/../../a/div[contains(text(), 'Send Test Message') or ./text() = 'Send Test Message']",
        "deliverability_test_link": "//*[@id='iconDeliverability']/../../a/div[contains(text(), 'Deliverability Test') or ./text() = 'Deliverability Test']",
        "first_emoji": "//table[@id='emojiTable']//img",
        "bounce_back_checkbox": "//input[@name='bounceBckFlg']",
        "content_file_url": "//input[@name='cmsUrl']",
        "external_content_field_selector": "//select[@name='cmsMemberField']",
        "generate_external_content": "//*[@id='iconButtonAdd']"
    },
    "button_list": {
        "list": "//*[@id='engage-create']//ul[@title='Message']/li[2]",
        "workflow": "css=#ccmd-messages-cell-workflow1.actionColumnUneven > a > #iconWfmAssign.sprite",
        "edit": "//*[@id='iconEdit']",
        "favourites": "css=#favourites.actionColumnUneven > a > #span.checkbox",
        "copy": "//*[@id='iconCopy']",
        "preview": "//*[@id='iconView']",
        "test_message": "//*[@id='iconCampaignTest'][@title='Test']/../../a",
        "audit_deliverability": "css=#ccmd-messages-cell-deliv1.actionColumnUneven > a > #iconDeliverability.sprite",
        "delete": "//*[@id='iconTrash']/../../a",
        "messages": "//*[@id='ccmd-appBar-messagesButton']//td[@class='applicationBarButtonTextTD' and ./text()='Messages']",
        "header_id": "//*[@id='ccmd-messages-table']//th[./text()='ID']",
        "header_message_name": "//*[@id='ccmd-messages-table']//th[./text()='Message Name']",
        "header_association_id": "//*[@id='ccmd-messages-table']//th[./text()='Association (ID)']",
        "header_workflow": "//*[@id='ccmd-messages-table']//th[./text()='Workflow']",
        "header_edit": "//*[@id='ccmd-messages-table']//th[./text()='Edit']",
        "header_favorites": "//*[@id='ccmd-messages-table']//th[./text()='Favorites']",
        "header_copy": "//*[@id='ccmd-messages-table']//th[./text()='Copy']",
        "header_preview": "//*[@id='ccmd-messages-table']//th[./text()='Preview']",
        "header_test_message": "//*[@id='ccmd-messages-table']//th[./text()='Test Message']",
        "header_audit_deliverability": "//*[@id='ccmd-messages-table']//th[./text()='Audit Deliverability']",
        "header_delete": "//*[@id='ccmd-messages-table']//span[@class='red' and ./text()='Delete']",
        "table": "xpath=//table[@class='list']",
        "rename_input": "//*[@name='messageNewName']"
    }
}

sms_message_builder = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "//*[@id='engage-create']//ul[@title='SMS Message']/li",
        "sms_message_name": "id=qa-sms-message-name",
        "sms_message_description": "id=qa-sms-message-description",
        "sms_message_from": "id=qa-sms-message-from",
        "sms_message_body": "id=textContent",
        "message_personalization_link": "//a[contains(text(), 'Message Personalization') or ./text() = 'Message Personalization']",
        "message_preview_link": "//a[contains(text(),'Message Preview') or ./text() = 'Message Preview']",
        "send_test_message_link": "//a[contains(text(),'Send Test Message') or ./text() = 'Send Test Message']",
        "back_button": "//a[contains(text(),'Back') or ./text() = 'Back']",
        "save_button": "//a[contains(text(),'Save') or ./text() = 'Save']",
        "save_and_go_to_sms_messages_button": "//a[contains(text(),'Save and go to SMS Messages') or ./text() = 'Save and go to SMS Messages']"
    },
    "button_list": {
        "list": "//*[@id='engage-create']//ul[@title='SMS Message']/li[2]",
        "delete": "//*[@id='iconTrash']/../../a",
        "sms": "//*[@id='ccmd-appBar-SMSButton']//td[@class='applicationBarButtonTextTD' and ./text()='SMS']",
        "header_id": "//*[@id='ccmd-messages-table']//th[./text()='ID']",
        "header_message_name": "//*[@id='ccmd-messages-table']//th[./text()='Message Name']",
        "header_created_by": "//*[@id='ccmd-messages-table']//th[./text()='Created by']",
        "header_association_id": "//*[@id='ccmd-messages-table']//th[./text()='Association (ID)']",
        "header_workflow": "//*[@id='ccmd-messages-table']//th[./text()='Workflow']",
        "header_edit": "//*[@id='ccmd-messages-table']//th[./text()='Edit']",
        "header_favorites": "//*[@id='ccmd-messages-table']//th[./text()='Favorites']",
        "header_copy": "//*[@id='ccmd-messages-table']//th[./text()='Copy']",
        "header_delete": "//*[@id='ccmd-messages-table']//span[@class='red' and ./text()='Delete']",
        "table": "xpath=//*[@id='ccmd-messages-table']",
        "copy": "//*[@id='iconCopy']",
        "rename_input": "//*[@name='messageNewName']",
        "edit": "//*[@id='iconEdit']"
    }
}

landing_page = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "//*[@id='engage-create']//ul[@title='Landing page']/li",
        "page_name": "//*[@id='lpages-pagebar-name']",
        "page_name_input": "//input[@id='lpages-pagebar-inputname']",
        "undo": "//*[@id='lpages-pagebar-undo']/span[./text()='Undo']",
        "add_a_row": "//*[@id='lpages-pagebar-addrow']/span[./text()='Add a row']",
        "change_style": "//*[@id='lpages-pagebar-presets']/span[./text()='Change styles']",
        "apply_to_entire_page": "//*[@id='lpages-editor-presets']//span[./text()='Apply to entire page']",
        "overwrite_inline_styles": "//*[@id='lpages-editor-presets']//span[./text()='Overwrite inline styles']",
        "page_style": "//*[@id='lpages-editor-presets-carousel']/div[./text()='Page']",
        "text_style": "//*[@id='lpages-editor-presets-carousel']/div[./text()='Text']",
        "form_style": "//*[@id='lpages-editor-presets-carousel']/div[./text()='Form']",
        "wizard_controls": "//*[@id='lpages-editor-rows']//div[@class='lpages-editor-wizardcontrols']",
        "button_text": "//button[@class='btn btn-large lpages-editor-wizardtext']",
        "button_image": "//button[@class='btn btn-large lpages-editor-wizardimage']",
        "button_smart_personalisation": "//button[@class='btn btn-large lpages-editor-wizardsmartengage']",
        "button_html": "//button[@class='btn btn-large lpages-editor-wizardshtml']",
        "button_form": "//button[@class='btn btn-large lpages-editor-wizardform']",
        "button_subscription_suspension": "//button[@class='btn btn-large lpages-editor-wizardform-subscriptionsuspension']",
        "label_input_field": "//div[contains(text(), 'Label')]",
        "first_input_container": "//*[@class='lpages-formfiels-input-container']",
        "input_selector": "//*[@id='lpages-editorform-typepfield']",
        "save": "//*[contains(@id, 'btnsave')]",
        "save_and_schedule": "//*[@id='lpages-editor-btnsavechedule']/div",
        "submission_slider": "//*[@id='lpages-prop-submission-toggleButton']",
        "track_page_slider": "//*[@id='lpages-prop-analytics-togglebutton-track']",
        "overview": "//*[@id='lpages-prop-overview-title-input']",
        "confirmation_message": "//*[@id='lpages-prop-submission-msg-input']",
        "submission_url": "//*[contains(@name, 'submitRedirection')]",
        "redirect_selector": "//*[@id='lpages-prop-fallback']/div/div[1]/select",
        "redirection_url": "//*[@id='lpages-prop-fallback-url-input']",
        "data_sync_page": "//li[@aria-controls='lpages-prop-fragment-data-synchronisation']",
        "data_sync_button": "//*[@id='lpages-prop-datasync-toggleButton']",
        "activate": "//*[@id='lpages-prop-datasync-activation-popup']/div[2]/div[3]/div[2]",
        "source_field_slider": "//*[@id='lpages-prop-datasync-source-toggle']",
        "source_field_input": "//*[@id='lpages-prop-datasync-source-input']",
        "general_properties": "//*[@id='ui-id-4']",
        "landing_page_url": "//*[@id='lpages-prop-overview-url']/a"
    },
    "button_list": {
        "list": "//*[@id='engage-create']//ul[@title='Landing page']/li[2]",
        "my_pages": "//*[@id='lpages-appbar-btnpages']/span[./text()='My Pages']",
        "header_id": "//*[@id='lpages-pages-tablediv-header-id']/div[./text()='ID']",
        "header_name": "//*[@id='lpages-pages-tablediv-header-name']/div[./text()='Name']",
        "header_last_modified": "//*[@id='lpages-pages-tablediv-header-lastmodified']/div[./text()='Last Modified']",
        "header_status": "//*[@id='lpages-pages-tablediv-header-status']/div[./text()='Status']",
        "header_start_date": "//*[@id='lpages-pages-tablediv-header-startdate']/div[./text()='Start date']",
        "header_stop_date": "//*[@id='lpages-pages-tablediv-header-stopdate']/div[./text()='Stop date']",
        "page_count": "//*[@id='tabledivFooterTextID']/span",
        "first_row": "//*[@id='tabledivRow-0']",
        "duplicate": "//*[contains(@id, 'duplicate-icon')]",
        "rename_input": "//*[@id='lpages-pages-duplicatePromptName-name']",
        "yes": "//div[contains(text(), 'Yes')]",
        "properties": "//*[contains(@id, 'lpages-pages-icon-prop-icon')]",
        "edit": "//*[contains(@id, 'lpages-pages-icon-edit-icon')]",
        "preview": "//*[contains(@id, 'lpages-pages-icon-view-icon')]",
        "statistics": "//*[contains(@id, 'lpages-pages-icon-stats-icon')]",
        "delete": "//*[contains(@id, 'lpages-pages-icon-delete-icon')]"
    }
}

content_block = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "//*[@id='engage-create']//ul[@title='Content Block']/li",
        "name": "name=name",
        "description": "name=description",
        "text_content": "id=textContent",
        "tool_box": "id=toolbox",
        # "message_name": "name=messageName",
        # "message_description": "name=messageDescription",
        # "message_from": "name=messageFrom",
        # "message_to": "name=messageTo",
        # "message_reply_to": "name=messageReplyToEmail",
        "html_checkbox": "//*[@id='content']//input[@type='radio' and @value='TEXT']",
        "text_only_checkbox": "//*[@id='content']//input[@type='radio' and @value='HTML']",
        "content_upload": "//*[@id='iconUpload']/../../a/div[./text()='Content upload']",
        "track_all_links": "//*[@id='iconToolboxTrackLinks']/../../a/div[./text()='Track All Links']",
        "link_management": "//*[@id='iconToolboxLinksManagt']/../../a/div[./text()='Link Management']",
        "create_advanced_link": "//*[@id='navmenu']/li/a[./text()='Create Advanced Link']",
        "mirror_link": "//*[@id='navmenu']//a[./text()='Mirror Link']",
        "save_and_link": "//a[@href='javascript:saveAndAddLink();' and ./text()='Choice2: Save/Add Link']",
        "close_popup_box": "id=popCloseBox",
        "save": "//*[@id='iconSave']/../../a[normalize-space(.//text())='Save']",
        "external_content": "//*[@id='iconToolboxCMS']/../../a/div[./text()='External Content']",
        "dynamic_content_block_personalization": "//*[@id='iconToolboxMessagePerso']/../../a/div[./text()='Dynamic Content Block Personalization']",
        "dynamic_content_block_preview": "//*[@id='iconToolboxMessagePreview']/../../a/div[./text()='Dynamic Content Block Preview']"
    },
    "button_list": {
        "list": "//*[@id='engage-create']//ul[@title='Content Block']/li[2]",
        "dynamic_content_blocks": "//*[@id='archive']/span[./text()='Dynamic Content Blocks']",
        "header_id": "//*[@id='content-blocks-tablediv-header-id']/div[./text()='ID']",
        "header_name": "//*[@id='content-blocks-tablediv-header-name']/div[./text()='Name']",
        "header_description": "//*[@id='content-blocks-tablediv-header-description']/div[./text()='Description']",
        "header_type": "//*[@id='content-blocks-tablediv-header-type']/div[./text()='Type']",
        "header_creation_date": "//*[@id='content-blocks-tablediv-header-creation-date']/div[./text()='Creation Date']",
        "header_modification_date": "//*[@id='content-blocks-tablediv-header-modification-date']/div[./text()='Modification date']",
        "header_creator": "//*[@id='content-blocks-tablediv-header-creator']/div[./text()='Creator']",
        "first_block_id": "//div[@class='tabledivColumnText']",
        "preview": "//*[contains(@id, 'preview-icon')]",
        "edit": "//*[contains(@id, 'editenable-icon')]",
        "delete_button": "//*[contains(@id, 'deleteenable-icon')]",
        "copy": "//*[contains(@id, 'duplicateenable-icon')]",
        "rename_input": "//*[@id='archive-duplicate-name']",
        "first_row": "//div[@id='tabledivRow-0']",
        "duplicate": "//*[@id='duplicate-confirmation-popup']//div[contains(text(), 'Duplicate')]",
        "delete_confirm": "//*[@id='delete-confirmation-popup']//div[contains(text(), 'Delete')]"
    }
}

webform = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "//*[@id='engage-create']//ul[@title='Webform']/li",
        "STEP_1_settings": "//*[@id='content']//td[./text()='STEP 1: Settings']",
        "STEP_2_Fields": "//*[@id='content']//td[normalize-space(.//text())='STEP 2: Fields']",
        "STEP_3_confirmation_email": "//*[@id='content']//td[./text()='STEP 3: Confirmation Email']",
        "name": "//input[@name='name']",
        "description": "//input[@name='description']",
        "select_languages": "//select[@name='language']",
        "language_option": "//*[@id='content']//option[contains(text(),'English')]",
        "select_date": "//input[@id='datepicker']",
        "today_date": "//button[@class='picker__button--today']",
        "confirm_url": "//input[@name='confirmUrl']",
        "error_url": "//input[@name='errorUrl']",
        "next_step": "//*[@id='iconButtonNext']",
        "webform_type": "//*[@id='content']//select[@name='type']",
        "webform_update_profile": "//*[@id='webFormTypeDesc']",
        "update_webform_option": "//*[@id='content']//option[normalize-space(.//text())='Update webform']",
        "dupe_url": "name=dupErrorUrl",
        "field_name": "//select[@name='entry[0].field']",
        "display_name": "//*[@id='entry[0]']/td[3]/input[@type='text']",
        "input_type": "//select[@name='entry[0].inputType']",
        "default_value": "//*[@id='entry[0]']/td[6]/input[@type='text']",
        "validation_type": "//select[@name='entry[0].fieldType']",
        "text_length": "//*[@id='entry[0]']/td[8]/input[@type='text']",
        "select_user": "//*[@id='bounceBackSection']//select/option[./text()='User']",
        "bounce_back_type": "//*[@id='bounceBackSection']//select[@name='bounceBackType']",
        "service_email_address": "name=managerMail",
        "reply_to_email": "//input[@name='replyTo']",
        "first_message_id": "//input[@name='messageId']",
        "save_webform": "//*[@id='iconButtonPersonnalisation']",
        "previous_step": "//*[@id='content']//a[@class='btn blue']",
        "submit_form": "//*[@id='emvForm']//input[@value='Submit Form']",
        "edit_webform": "//*[@id='content']//a[normalize-space(.//text())='Edit Webform' and @class='btn orange']",
        "add_criteria": "//*[@id='iconAddCriteria']",
        "first_row_bounce_back_table": "//table[@id='msgSelection']/tbody/tr"
    },
    "button_list": {
        "list": "//*[@id='engage-create']//ul[@title='Webform']/li[2]",
        "webforms": "//*[@id='ccmd-appBar-webformsButton']//td[./text()='Webforms']",
        "header_id": "//*[@id='content']//th[./text()='ID']",
        "header_webform_name": "//*[@id='content']//th[./text()='Webform Name']",
        "header_webform_description": "//*[@id='content']//th[./text()='Webform Description']",
        "header_webform_end_date": "//*[@id='content']//th[./text()='Webform End Date']",
        "header_manager": "//*[@id='content']//th[./text()='Manager']",
        "header_status": "//*[@id='content']//th[./text()='Status']",
        "header_edit": "//*[@id='content']//th[./text()='Edit']",
        "header_copy": "//*[@id='content']//th[./text()='Copy']",
        "header_preview": "//*[@id='content']//th[./text()='Preview']",
        "select_delete_check_box": "//*[@id='ccmd-member-archive-cell-delete0']/input[@name='deleteMember']",
        "icon_trash": "//*[@id='iconTrash']/../../a",
        "confirm_delete": "css=#content > form > table.validationTable > tbody > tr > td.validationR > a",
        "first_name": "//*[@id='content']//th[./text()='First Name']",
        "last_name": "//*[@id='content']//th[./text()='Last name']",
        "name_webform": "//*[@id='rows']/tr/td[./text()='NameWebForm']",
        "surname_webform": "//*[@id='rows']/tr/td[./text()='SurnameWebForm']",
        "qa_auto_email": "//*[@id='rows']/tr/td[text()='qa.auto@smartfocus.com']",
        "search_input": "//input[contains(@name, 'searchPattern')]",
        "table": "xpath=//table[@class='list']",
        "edit": "//*[@id='iconEdit']",
        "copy": "//*[@id='iconCopy']",
        "preview": "//*[@id='iconView']"
    }
}

template = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "//*[@id='engage-create']//ul[@title='Template']/li",
        "template_name": "name=name",
        "template_description": "name=description",
        "upload_file": "name=uploadFile",
        "create_message": "//*[@id='toolbox']/tbody/tr[2]/td/a",
        "delete": "//*[@id='toolbox']/tbody/tr[3]/td/a",
        "replace": "//*[@id='toolbox']/tbody/tr[4]/td/a",
        "export": "//*[@id='toolbox']/tbody/tr[5]/td/a",
        "import_file": "//*[@id='iconUpload']/../../a[contains(text(),'Import') or ./text()='Import']",
        "happy_easter": "//*[@id='templateContent']//div[./text()='Happy Easter']",
        "save": "//*[@id='iconButtonSave']",
    },
    "button_list": {
        "list": "//*[@id='engage-create']//ul[@title='Template']/li[2]",
        "templates": "//*[@id='ccmd-appBar-lists-templatesButton']//td[./text()='Templates']",
        "display_options_link": "//*[@id='ccmd-templates-cell-header']//a[./text()='Display Options']",
        "header_template_id": "//*[@id='ccmd-templates-table']//th[./text()='Template Id']",
        "header_name": "//*[@id='ccmd-templates-table']//th[./text()='Name']",
        "header_description": "//*[@id='ccmd-templates-table']//th[./text()='Description']",
        "header_view": "//*[@id='ccmd-templates-table']//th[./text()='View']",
        "header_create_message": "//*[@id='ccmd-templates-table']//th[./text()='Create message']",
        "header_export": "//*[@id='ccmd-templates-table']//th[./text()='Export']",
        "header_replace": "//*[@id='ccmd-templates-table']//th[./text()='Replace']",
        "header_delete": "//*[@id='ccmd-templates-table']//span[@class='red' and ./text()='Delete']",
        "tick_check_box_to_delete": "name=deleteTemplate",
        "view": "//*[@id='iconToolboxMessagePreview']",
        "create_message": "//*[@id='iconEdit']",
        "replace": "//*[@id='iconReset']",
        "delete_checkbox": "//*[@name='deleteTemplate']",
        "delete": "//*[@id='iconTrash']",
        "table": "xpath=//*[@id='ccmd-templates-table']",
        "upload_button": "//*[@id='iconUpload']"
    }
}

transactional_message = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "transactional_content": "//*[@id='engage-create']//span[./text()='Transactional Content']",
    "button_add": {
        "add": "//*[@id='engage-create']//span[contains(text(),'Transactional Content')]/..//ul[@title='Message']/li",
        "radio_notification_classic": "id=qa-notification-type-classic",
        "radio_notification_attachment": "id=qa-notification-type-attachment",
        "name": "name=name",
        "description": "name=description",
        "message_from": "name=messageFrom",
        "message_to": "name=messageTo",
        "message_subject": "name=messageSubject",
        "message_reply_to_emails": "name=messageReplyToEmail",
        "message_reply_to": "name=messageReplyTo",
        "message_encoding": "name=messageEncoding",
        "text_content": "id=textContent",
        "message_rename_input": "//*[@name='nmTransactionalNewName']",
        "content_upload": "//*[@id='toolbox']//a/div[normalize-space(.//text())='Creative Upload']",
        "copy_HTML_to_text": "//*[@id='iconToolboxCopyHtmlToText']/../../a/div[contains(text(),'Copy HTML to Text')]",
        "insert_dynamic_content_block": "//*[@id='iconPromotionAdsSmall']/../../a/div[contains(text(),'Insert Dynamic Content Block')]",
        "track_links": "//*[@id='iconToolboxTrackLinks']/../../a/div[contains(text(),'Track Links')]",
        "manage_links": "//*[@id='iconToolboxLinksManagt']/../../a/div[contains(text(),'Manage Links')]",
        "personalize_content": "//*[@id='iconToolboxMessagePerso']/../../a/div[contains(text(),'Personalize Content')]",
        "preview": "//*[@id='iconToolboxMessagePreview']/../../a/div[contains(text(),'Preview')]",
        "send_test": "//*[@id='iconToolboxMessageSendTest']/../../a/div[contains(text(),'Send Test')]",
        "save": "//*[@id='iconSave']/../../a[normalize-space(.//text())='Save']",
        "save_and_back": "//*[@id='iconSave']/../../a[normalize-space(.//text())='Save & Back To Integration and Testing']"
    },
    "button_list": {
        "list": "//*[@id='engage-create']//span[contains(text(),'Transactional Content')]/..//ul[@title='Message']/li[2]",
        "message": "//*[@id='ccmd-appBar-realTimeMessagesButton']//td[./text()='Messages']",
        "header_id": "//*[@id='archiveList']//th[normalize-space(.//text())='ID']",
        "header_integration_status": "//*[@id='archiveList']//th[normalize-space(.//text())='Integration Status']",
        "header_name": "//*[@id='archiveList']//th[normalize-space(.//text())='Name']",
        "header_description": "//*[@id='archiveList']//th[normalize-space(.//text())='Description']",
        "header_created_by": "//*[@id='archiveList']//th[normalize-space(.//text())='Created by']",
        "header_preview": "//*[@id='archiveList']//th[normalize-space(.//text())='Preview']",
        "header_edit": "//*[@id='archiveList']//th[normalize-space(.//text())='Edit']",
        "header_copy": "//*[@id='archiveList']//th[normalize-space(.//text())='Copy']",
        "header_delete": "//*[@id='archiveList']//span[@class='red' and normalize-space(.//text())='Delete']",
        "delete": "//*[@id='iconTrash']/../../a",
        "reports": "//*[@id='ccmd-appBar-realTimeReportsButton']//td[./text()='Reports']",
        "dashbords": "//*[@id='dashboard-tab']/a[normalize-space(.//text())='Dashboards']",
        "export_in_excel": "//*[@id='NotificationDashboardForm']/a[@alt='Export in Excel']",
        "date_range_report": "//*[@id='daterange-tab']/a[normalize-space(.//text())='Date Range Report']",
        "notification_lable": "//*[@id='NotificationDateRangeForm']//b[./text()='Notification']",
        "select_message_id": "name=selectedMessageId",
        "begin_date_lable": "//*[@id='NotificationDateRangeForm']//b[./text()='Begin Date']",
        "begin_date_picker": "id=beginDatePicker",
        "end_date_lable": "//*[@id='NotificationDateRangeForm']//b[./text()='End Date']",
        "end_date_picker": "id=endDatePicker",
        "range_form_ok_button": "//*[@id='NotificationDateRangeForm']//a[./text()='OK']",
        "custom_search": "//*[@id='custom-tab']//a[normalize-space(.//text())='Custom Search']",
        "email_lable": "//*[@id='NotificationCustomForm']//b[./text()='Email']",
        "email_input": "name=email",
        "custom_form_ok_button": "//*[@id='NotificationCustomForm']//a[./text()='OK']",
        "table": "xpath=//table[@class='list']"
    }
}

transactional_content_block = {
    "menu": "//*[@id='engage-create']/div[./text()='Create']",
    "transactional_content": "//*[@id='engage-create']//span[./text()='Transactional Content']",
    "button_add": {
        "add": "//*[@id='engage-create']//span[contains(text(),'Transactional Content')]/..//ul[@title='Content Block']/li",
        "content_block_name_input": "name=name",
        "content_block_description_input": "name=description",
        "content_block_body_input": "id=textContent",
        "content_block_rename_input": "//*[contains(@name, 'NewName')]",
        "html_checkbox": "//*[@id='content']//input[@type='radio' and @value='TEXT']",
        "text_only_checkbox": "//*[@id='content']//input[@type='radio' and @value='HTML']",
        "save": "//*[@id='iconSave']/../../a[contains(text(),'Save') or ./text()='Save']",
        "content_upload": "//*[@id='iconUpload']/../../a/div[contains(text(),'Content upload')]",
        "track_all_links": "//*[@id='iconToolboxTrackLinks']/../../a/div[contains(text(),'Track All Links')]",
        "link_management": "//*[@id='iconToolboxLinksManagt']/../../a/div[contains(text(),'Link Management')]",
        "message_personalization": "//*[@id='iconToolboxMessagePerso']/../../a/div[contains(text(),'Message Personalization')]",
        "message_preview": "//*[@id='iconToolboxMessagePreview']/../../a/div[contains(text(),'Message Preview')]"
    },
    "button_list": {
        "list": "//*[@id='engage-create']//span[contains(text(),'Transactional Content')]/..//ul[@title='Content Block']/li[2]",
        "dynamic_content_blocks": "//*[@id='ccmd-appBar-realTimeBannersButton']//td[./text()='Dynamic Content Blocks']",
        "table": "xpath=//table[@class='list']",
        "header_id": "//*[@id='content']//th[normalize-space(.//text())='ID']",
        "header_name": "//*[@id='content']//th[normalize-space(.//text())='Name']",
        "header_description": "//*[@id='content']//th[normalize-space(.//text())='Description']",
        "header_created_by": "//*[@id='content']//th[normalize-space(.//text())='Created by']",
        "header_preview": "//*[@id='content']//th[normalize-space(.//text())='Preview']",
        "header_edit": "//*[@id='content']//th[normalize-space(.//text())='Edit']",
        "header_copy": "//*[@id='content']//th[normalize-space(.//text())='Copy']",
        "header_delete": "//*[@id='content']//span[@class='red' and normalize-space(.//text())='Delete']",
        "delete": "//*[@id='iconTrash']/../../a"
    }
}

segments = {
    "menu": "//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "//*[@id='engage-list-management']//span[contains(text(),'Subscriber Management')]",
    "button_add": {
        "add": "//*[@id='engage-list-management']//span[@class='dropdown-module-title no-title' and contains(text(),'Segment')]/../ul/li"
    },
    "button_list": {
        "list": "//*[@id='engage-list-management']//span[contains(text(),'Segment')]/../ul/li[2]"
    }
}

add_subscriber = {
    "menu": "//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "//*[@id='engage-list-management']//span[./text()='Subscriber Management']",
    "button_add": {
        "add": "//*[@id='engage-list-management']//ul[@title='Add subscriber']/li",
        "search_button": "//*[@id='ccmd-appBar-searchMemberButton']//td[./text()='Search']",
        "header_database_field": "//*[@id='content']//th[./text()='Database Field']",
        "header_database_type": "//*[@id='content']//th[./text()='Type']",
        "header_database_value": "//*[@id='content']//th[./text()='Value']",
        "header_database_stats": "//*[@id='content']//th[./text()='Stats']",
        "save_member": "//*[@id='iconButtonSave']/../../a[@class='btn blue']",
        "reset": "//*[@id='iconButtonReset']/../../a[./text()='Reset']",
        "cancel": "//*[@id='iconCancel']/../../a[./text()='Cancel']",
        "input_fields": {
            "firstname": "//input[contains(@name, '(FIRSTNAME)')]",
            "lastname": "//input[contains(@name, '(LASTNAME)')]",
            "email_original": "//input[contains(@name, '(EMAIL_ORIGINE)')]",
            "email": "//input[contains(@name, '(EMAIL)')]",
            "emv_cellphone": "//input[contains(@name, '(EMVCELLPHONE)')]",
            "email_format": "//input[contains(@name, '(EMAIL_FORMAT)')]",
            "title": "//input[contains(@name, '(TITLE)')]",
            "date_of_birth": "//input[contains(@name, '(DATEOFBIRTH)')]",
            "seed": "//input[contains(@name, '(SEED)')]",
            "client_urn": "//input[contains(@name, '(CLIENTURN)')]",
            "source": "//input[contains(@name, '(SOURCE)')]",
            "code": "//input[contains(@name, '(CODE)')]",
            "segment": "//input[contains(@name, '(SEGMENT)')]"
        }
    }
}

search_subscriber = {
    "menu": "//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "//*[@id='engage-list-management']//span[./text()='Subscriber Management']",
    "button_add": {
        "add": "//*[@id='engage-list-management']//ul[@title='Search subscriber']/li",
        "search_button": "//*[@id='ccmd-appBar-searchMemberButton']//td[./text()='Search']",
        "header_database_field": "//*[@id='content']//th[./text()='Database Field']",
        "header_select_operator": "//*[@id='content']//th[./text()='Select Operator']",
        "header_value": "//*[@id='content']//th[./text()='Value']",
        "header_add": "//*[@id='content']//th[./text()='Add']",
        "text_field_combo": "name=textFieldCombo",
        # "select_text_field_option_email": "//*[@id='content']//select/option[normalize-space(.//text())= 'EMAIL']",
        "text_field_operator": "name=textFieldOperator",
        # "text_field_operator_option_contains": "//*[@id='content']//select/option[normalize-space(.//text())= 'contains']",
        "text_field_value": "name=textFieldValue",
        "add_text": "//*[@id='iconAddCriteria']",
        "text_search": "//*[@id='iconSearch']",
        "numeric_field_combo": "name=numericFieldCombo",
        "numeric_field_operator": "name=numericFieldOperator",
        "numeric_field_value": "name=numericFieldValue",
        "numeric_search": "//tr[3]/td[4]/a/img[@id='iconAddCriteria']",
        # "add_text": "//*[@id='content']//a[@href='javascript:addText()']",
        "select_number_field": "//*[@id='iconCriteriaNum']/../select[@name='numericFieldCombo']",
        "number_field_operator": "//*[@id='content']//select[@name='numericFieldOperator']",
        "number_field_value": "//*[@id='content']//input[@name='numericFieldValue']",
        "add_numeric": "//*[@id='content']//a[@href='javascript:addNumeric()']",
        "date_field_operator": "//*[@id='content']//select[@name='dateFieldOperator']",
        "date_picker": "id=datepicker",
        "add_date": "//*[@id='content']//a[@href='javascript:addDate()']",
        "segmentation_operator": "//*[@id='content']//select[@name='segmentationOperator']",
        "segmentation_index": "//*[@id='content']//select[@name='segmentationIndex']",
        "add_segmentation": "//*[@id='content']//a[@href='javascript:addSegmentation()']",
        "search_criteria": "//*[@id='content']//td[./text()='Search Criteria' or normalize-space(.//text())='Search Criteria']",
        "member_count": "//*[@id='nbMembers']",
        "delete_members": "//a[contains(text(),'Delete Members') or ./text() = 'Delete Members']",
        "member_table": "xpath=//table[@class='list']"
    }
}

import_subscriber = {
    "menu": "//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "//*[@id='engage-list-management']//span[./text()='Subscriber Management']",
    "button_add": {
        "add": "//*[@id='engage-list-management']//ul[@title='Import subscriber']/li",
        "imports_button": "//*[@id='ccmd-appBar-membersImportsButton']//td[./text()='Imports']",
        "import_button": "id=ccmd-import-btn",
        "header_id": "//*[@id='content']//th[./text()='ID']",
        "header_filename": "//*[@id='content']//th[./text()='Filename']",
        "header_import_date": "//*[@id='content']//th[./text()='Import Date']",
        "header_create_date": "//*[@id='content']//th[./text()='Created by']",
        "header_original_filename": "//*[@id='content']//th[./text()='Original Filename']",
        "header_size_b": "//*[@id='content']//th[./text()='Size (b)']",
        "header_status": "//*[@id='content']//th[./text()='Status']",
        "header_del": "//*[@id='content']//span[./text()='Del.']",
        "fail_table": "xpath=//*[@id='content']/form/table[2]",
        "good_table": "xpath=//*[@id='content']/form/div/table[2]",
        "import_table": "xpath=//*[@id='content']/table"
    },
    "button_list": {
        "list": "//*[@id='engage-list-management']//ul[@title='Import subscriber']/li[2]",
        "imports_button": "//*[@id='ccmd-appBar-membersImportsButton']//td[./text()='Imports']",
        "header_status": "//*[@id='content']//th[./text()='Status']",
        "header_id": "//*[@id='content']//th[./text()='ID']",
        "header_original_filename": "//*[@id='content']//th[./text()='Original Filename']",
        "header_created_by": "//*[@id='content']//th[./text()='Created by']",
        "header_import_date": "//*[@id='content']//th[./text()='Import Date']",
        "header_size_b": "//*[@id='content']//th[./text()='Size (b)']",
        "header_step": "//*[@id='content']//th[./text()='Sep.']",
        "header_lines": "//*[@id='content']//th[./text()='Lines']",
        "header_val_errors": "//*[@id='content']//th[./text()='Val. Errors']",
        "header_imp_errors": "//*[@id='content']//th[./text()='Imp. Errors']",
        "header_log": "//*[@id='content']//th[./text()='Log']",
        "header_nb_insert": "//*[@id='content']//th[./text()='Nb Insert']",
        "header_job_begin": "//*[@id='content']//th[./text()='Job Begin']",
        "header_job_end": "//*[@id='content']//th[./text()='Job End']"
    }
}

export_subscriber = {
    "menu": "//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "//*[@id='engage-list-management']//span[./text()='Subscriber Management']",
    "button_add": {
        "add": "//*[@id='engage-list-management']//ul[@title='Export subscriber']/li",
        "exports": "//*[@id='ccmd-appBar-membersExportsButton']//td[./text()='Exports']",
        "email_view": "id=emailView",
        "sms_view": "id=smsView",
        "select_a_campaign_and_action": "//*[@id='content']//select[@name='campaignId']",
        "selected": "//*[@id='content']//input[@value='1']",
        "sent": "//*[@id='content']//input[@value='27']",
        "received_and_not_opened": "//*[@id='content']//input[@value='2']",
        "opend": "//*[@id='content']//input[@value='6']",
        "clicked": "//*[@id='content']//input[@value='4']",
        "clicked_with_url_details": "//*[@id='content']//input[@value='5']",
        "post_click_tracking": "//*[@id='content']//input[@value='8']",
        "filtered": "//*[@id='content']//input[@value='15']",
        "unjoin": "//*[@id='content']//input[@value='7']",
        "hard_bounced": "//*[@id='content']//input[@value='9']",
        "soft_bounced": "//*[@id='content']//input[@value='10']",
        "hard_and_soft_bounced": "//*[@id='content']//input[@value='3']",
        "conplaints": "//*[@id='content']//input[@value='16']",
        "submit_campaign_form": "//*[@id='content']//a[@href='javascript:submitCampaignForm();']",
        "select_a_segment_and_status": "//*[@id='content']//select[@name='mailinglistId']",
        "active_members": "//*[@id='content']//input[@value='17']",
        "quarantined_or_unjoin_members": "//*[@id='content']//input[@value='18']",
        "quarantined_members": "//*[@id='content']//input[@value='19']",
        "unjoin_members": "//*[@id='content']//input[@value='20']",
        "sms_active_members": "//*[@id='content']//input[@value='23']",
        "sms_quarantined_or_sms_unjoin_members": "//*[@id='content']//input[@value='24']",
        "sms_quarantined_members": "//*[@id='content']//input[@value='25']",
        "sms_unjoin_members": "//*[@id='content']//input[@value='26']",
        "all_members": "//*[@id='content']//input[@value='21']",
        "submit_segment_form": "//*[@id='content']//a[@href='javascript:submitSegmentationForm();']"
    },
    "button_list": {
        "list": "//*[@id='engage-list-management']//ul[@title='Export subscriber']/li[2]",
        "exports": "//*[@id='ccmd-appBar-membersExportsButton']//td[./text()='Exports']",
        "header_status": "//*[@id='content']//th[./text()='Status']",
        "header_id": "//*[@id='content']//th[./text()='ID']",
        "header_original_exported": "//*[@id='content']//th[./text()='Filename export']",
        "header_created_by": "//*[@id='content']//th[./text()='Created by']",
        "header_job_type": "//*[@id='content']//th[./text()='Job type']",
        "header_nb_members": "//*[@id='content']//th[./text()='Nb Members']",
        "header_scheduled_time": "//*[@id='content']//th[./text()='Scheduled time']",
        "header_start_time": "//*[@id='content']//th[./text()='Start Time']",
        "header_process_time": "//*[@id='content']//th[./text()='Process Time']"
    }
}

image_library = {
    "menu": "//*[@id='image-library']/div[./text()='Image Library']",
    "button_add": {
        "image_library": "//*[@id='appbar-archive-button']/span[./text()='Image Library']",
        "create_new_folder": "//*[@id='action-bar-create-folder']/span[./text()='Create new folder']",
        "select_all": "//*[@id='action-bar-select-all']/span[./text()='Select all']",
        "deselect_all": "//span[contains(text(), 'Deselect all')]",
        "delete": "//span[contains(text(), 'Delete')]",
        "confirm_delete": "//div[2]/span[contains(text(), 'Delete')]",
        "storage": "//*[@id='action-bar']//span[./text()='Storage:']",
        "add_button": "//*[@id='appbar-add-button']//span[./text()='Add']",
        "image_library_iframe": "id=ImageLibrary-IMAGES_THUMBNAIL_VIEW-frame",
        "browse_button": "//*[@name='uploadFile']",
        "start_upload_button": "//*[@id='imagelib-submit-label'][./text()='Start upload']"
    }

}

deliverability = {
    "menu": "//*[@id='engage-deliverability']/div[./text()='Deliverability']"
}

email_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='Email']/li"
    }
}

multivariate_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='MultiVariate']/li"
    }
}

multimessage_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='MultiMessage']/li"
    }
}

test_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='Test']/li"
    }
}

transactional_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='Transactional']/li",
        "date_range_report": "//a[contains(text(), 'Date Range Report')]",
        "custom_search": "//a[contains(text(), 'Custom Search')]",
        "email": "//input[contains(@name, 'email')]"
    }
}

trigger_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='Trigger']/li"
    }
}

landing_page_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='Landing page']/li"
    }
}

mobile_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "mobile": "//*[@id='engage-reports']//span[./text()='Mobile']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='SMS']/li",
        "sms_reports": "//span[./text()='SMS Reports']",
        "header_id": "//div[./text()='ID']",
        "header_campaign_name": "//div[./text()='Campaign name']",
        "header_status": "//div[./text()='Status']",
        "header_send_date": "//div[./text()='Send date']",
        "header_selected": "//div[./text()='Selected']",
        "header_sent": "//div[./text()='Sent']",
        "header_delivered": "//div[./text()='Delivered']",
        "header_undelivered": "//div[./text()='Undelivered']",
        "header_stops": "//div[./text()='Stops']",
        "first_row": "//*[@id='tabledivRowColumnsID_0']"
    }
}

list_growth_reports = {
    "menu": "//*[@id='engage-reports']/div[./text()='Reports']",
    "list_growth": "//*[@id='engage-reports']//span[./text()='List Growth']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='List Growth']/li",
        "reports": "//*[@id='listReportUI-mainMenu-archiveButton']//span[./text()='Reports']",
        "header_report_name": "//div[./text()='Report Name']",
        "header_id": "//div[./text()='ID']",
        "header_status": "//div[./text()='Status']",
        "header_creation_date": "//div[./text()='Creation Date']",
        "header_created_by": "//div[./text()='Created by']",
        "report_chart_window": "//div[contains(@class, 'ui-list-report-client-bundle-ListReportCSS-mainContent')]",
        "create_new": {
            "report_name": "//input[contains(@id, 'reportNameInput')]",
            "create_report": "//*[contains(text(), 'Create Report')]",
            "segments_radio": "//input[@id='gwt-uid-9']",
            "segments_list": "//*[@id='listReportUI-builderView-segmentsExplorer-openButton']",
            "segments_search_input": "//input[@id='listReportUI-builderView-segmentsExplorer-searchButton-textBox']",
            "segments_search_button": "//*[@id='listReportUI-builderView-segmentsExplorer-searchButton-button']",
            "segmentss_row": "//*[@id='listReportUI-builderView-segmentsExplorer-nameColumn']",
        }
    },
    "button_list": {
        "first_row": "//*[@id='emvTab1-row-0']",
        "refresh_button": "//*[@id='listReportUI-mainMenu-refreshButton']",
        "results_button": "//*[contains(@id, 'listReportUi-ArchiveView-resultView')]",
        "delete_button": "//*[contains(@id, 'listReportUi-ArchiveView-deleteIcon')]",

    }
}

folders = {
    "menu": "//*[@id='engage-folders']/div[./text()='Folders']",
    "button_add": {
        "folders": "//*[@id='ccmd-appBar-foldersButton']//td[./text()='Folders']",
        "save": "//*[@id='iconSave']/../../a",
        "new_directory_name": "name=newDirectoryName",
        "new_directory_description": "name=newDirectoryDescription",
        "header_delete": "//*[@id='content']//span[@class='red' and ./text()='Delete']",
        "header_name": "//*[@id='content']//th[./text()='Name']",
        "header_description": "//*[@id='content']//th[./text()='Description']",
        "header_content_summary": "//*[@id='content']//th[./text()='Content Summary']",
        "delete": "//*[@id='iconTrash']/../../a",
        "first_folder": "//a[@class='folderName']"
    }

}

workflow = {
    "menu": "//*[@id='engage-workflow']/div[./text()='Workflow']",
    "workflow_management": "//*[@id='engage-workflow']//span[./text()='Workflow management']",
    "button_add": {
        "add": "//*[@id='engage-workflow']//ul[@title='Workflow']/li",
        "workflows": "//*[@id='ccmd-appBar-workflowsButton']//td[./text()='Workflows']",
        "header_name": "//*[@id='content']//th[./text()='Name']",
        "header_description": "//*[@id='content']//th[./text()='Description']",
        "header_status": "//*[@id='content']//th[./text()='Status']",
        "header_creation": "//*[@id='content']//th[./text()='Creation']",
        "header_update": "//*[@id='content']//th[./text()='Update']",
        "header_edit": "//*[@id='content']//th[./text()='Edit']",
        "header_delete": "//*[@id='content']//span[@class='red' and ./text()='Delete']",
        "delete": "//*[@id='iconTrash']/../../a",
        "model_radio_button": "//input[@name='modelId']",
        "first_manager_checkbox": "//input[contains(@name, 'wfm')]",
        "workflow_name": "//input[@name='name']",
        "workflow_description": "//input[@name='description']",
        "table": "xpath=//table[@class='list']"
    }
}

workflow_model = {
    "menu": "//*[@id='engage-workflow']/div[./text()='Workflow']",
    "workflow_management": "//*[@id='engage-workflow']//span[./text()='Workflow management']",
    "button_add": {
        "add": "//*[@id='engage-workflow']//ul[@title='Model']/li",
        "models": "//*[@id='ccmd-appBar-workflowModelsButton']//td[./text()='Models']",
        "header_model_name": "//*[@id='content']//th[./text()='Model Name']",
        "header_model_description": "//*[@id='content']//th[./text()='Model Description']",
        "header_created": "//*[@id='content']//th[./text()='Creation']",
        "header_view": "//*[@id='content']//th[./text()='View']",
        "header_delete": "//*[@id='content']//span[@class='red' and ./text()='Delete']",
        "delete": "//*[@id='iconTrash']/../../a"
    }
}

approval = {
    "menu": "//*[@id='engage-approval']/div[./text()='Approval']"
}
