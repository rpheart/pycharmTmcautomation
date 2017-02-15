# coding=utf-8
# navigation settings
system_page = {
    "view": "css=li.logo_button.insight_button",
    "analyze": "css=li.logo_button.optimize_button",
    "personalization": "css=li.logo_button.define_button",
    # "email": "xpath=//*[@id='SFUI_Nav']//div[./text()='Email')]",
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
    "popup": "id=popupFrame"
}

# generic tabs
generics = {
    "workflow": "css=#ccmd-messages-cell-workflow1.actionColumnUneven > a > #iconWfmAssign.sprite",
    "edit": "css=#ccmd-messages-cell-edit1 > a > #iconEdit",
    "favourites": "css=#favourites.actionColumnUneven > a > #span.checkbox",
    "copy": "css=#ccmd-messages-cell-copy1.actionColumnUneven > a > #iconCopy.sprite",
    "preview": "css=#ccmd-messages-cell-preview1.actionColumnUneven > a > #iconView.sprite",
    "test_message": "css=#ccmd-messages-cell-test1.actionColumnUneven > a > #iconCampaignTest.sprite",
    "audit_deliverability": "css=#ccmd-messages-cell-deliv1.actionColumnUneven > a > #iconDeliverability.sprite",
    "delete": "css=#ccmd-messages-cell-delete1.actionColumnUneven > a > #deleteMessage",
    "test_campaign_name": "name=campaignName",
    "new_test_email": "xpath=//*[@id='content']//input[@name='emailToAdd']",
    "add_email_to_test_recipients": "id=iconAddCriteria",
    "group_name": "xpath=//*[@id='content']//option[contains(text(),'QA_auto')]",
    "qa_test_email": "xpath=//*[@id='content']//td[contains(.,'qa.test@smartfocus.com')]/input",
    "auto_test_email": "xpath=//*[@id='content']//td[contains(.,'qa.auto@smartfocus.com')]/input",
    "update_group_button": "id=updateGroupBtn",
    "send_test_button": "xpath=//*[@id='iconArrowBack']/../a",
    "close_popup_box": "id=popCloseBox",
    "send_test_message": "xpath=//*[@id='toolbox']//div[contains(text(),'Send Test Message')]",
    "create_new": "//*[contains(text(), 'New') and (contains(@class, 'applicationBar') or contains(@class, 'appbar') or contains(@class, 'label'))]",
    "add": "//*[contains(text(), 'Add') and (contains(@class, 'applicationBar') or contains(@class, 'appbar') or contains(@class, 'label'))]"
}

# pages
calendar = {
    "menu": "xpath=//*[@id='engage-calendar']/div[./text()='Calendar']"
}

standard_campaign = {
    "menu": "xpath=//*[@id='engage-send']/div[./text()='Send']",
    "label": "xpath=//*[@id='engage-send']//span[./text()='Campaigns']",
    "button_add": {
        "add": "xpath=//*[@id='engage-send']//ul[@title='Standard']/li"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-send']//ul[@title='Standard']/li[2]",
        "standard_campaigns": "xpath=//*[@id='ccmd-appBar-standardCampaignsButton']//td[./text()='Standard Campaigns']",
        "header_status": "xpath=//*[@id='content']//th[./text()='Status']",
        "header_id": "xpath=//*[@id='content']//th[./text()='ID']",
        "header_name": "xpath=//*[@id='content']//th[./text()='Name']",
        "header_message": "xpath=//*[@id='content']//th[./text()='Message']",
        "header_segment": "xpath=//*[@id='content']//th[./text()='Segment']",
        "header_created_by": "xpath=//*[@id='content']//th[./text()='Created by']",
        "header_date": "xpath=//*[@id='content']//th[./text()='Date']",
        "header_pct": "xpath=//*[@id='content']//th[./text()='PCT']",
        "header_workflow": "xpath=//*[@id='content']//th[./text()='Workflow']",
        "header_edit": "xpath=//*[@id='content']//th[./text()='Edit']",
        "header_favorites": "xpath=//*[@id='content']//th[./text()='Favorites']",
        "header_copy": "xpath=//*[@id='content']//th[./text()='Copy']",
        "header_test": "xpath=//*[@id='content']//th[./text()='Test']",
        "header_deliv_test": "xpath=//*[@id='content']//th[./text()='Deliv. Test']",
        "header_post": "xpath=//*[@id='content']//th[./text()='Post']",
        "header_fast_post": "xpath=//*[@id='content']//span[@class='red' and ./text()='Fast Post']",
        "header_delete": "xpath=//*[@id='content']//span[@class='red' and ./text()='Delete']"
    }
}

multivariate_campaign = {
    "menu": "xpath=//*[@id='engage-send']/div[./text()='Send']",
    "button_add": {
        "add": "xpath=//*[@id='engage-send']//ul[@title='MultiVariate']/li",
        "multivariate_tests": "xpath=//*[@id='splitrunUI-mainMenu-archiveButton']//span[./text()='MultiVariate Tests']",
        "define_campaign_and_recipients": "xpath=//*[@id='splitrunUI-builderView-breadcrumb-1']//div[contains(text(),'Define campaign and recipients')]",
        "1_campaign_name_and_description": "xpath=//*[@id='splitrunuidiv']//legend[contains(text(),'1. Campaign name and description')]",
        "campaign_name": "xpath=//*[@id='splitrunuidiv']//div[contains(text(),'Campaign Name')]",
        "name_input": "id=splitrunUI-builderView-nameInput",
        "campaign_description": "xpath=//*[@id='splitrunuidiv']//div[contains(text(),'Campaign description')]",
        "description_input": "id=splitrunUI-builderView-descriptionInput",
        "2_select_message": "xpath=//*[@id='splitrunuidiv']//legend[contains(text(),'2. Select message')]",
        "message": "xpath=//*[@id='splitrunuidiv']//div[contains(text(),'Message')]",
        "select_a_message": "xpath=//*[@id='splitrunUI-builderView-messagesExplorer-openButton']//div[contains(text(),'Select a message')]",
        "qa_auto_test_message": "xpath=//*[@id='splitrunUI-builderView-messagesExplorer-nameColumn' and contains(text(),'QA auto test Message')]",
        "3_select_recipients": "xpath=//*[@id='splitrunuidiv']//legend[contains(text(),'3. Select recipients')]",
        "segment": "xpath=//*[@id='splitrunuidiv']//div[contains(text(),'Segment')]",
        "select_one_or_more_segments": "xpath=//*[@id='splitrunUI-builderView-segmentsExplorer-openButton']//div[contains(text(),'Select one or more segments')]",
        "qa_auto_test_segment": "xpath=//*[@id='splitrunUI-builderView-segmentsExplorer-nameColumn' and contains(text(),'QA auto test Segment')]",
        "click_ok": "xpath=//*[@id='splitrunUI-builderView-segmentsExplorer-addEntitiesButton']//div[contains(text(),'Ok')]",
        "continue_button": "xpath=//*[@id='splitrunUI-builderView-nextButton']//div[contains(text(),'Continue')]",
        "1_select_the_variable_you_want_to_test": "xpath=//*[@id='splitrunuidiv']//legend[./text()='1. Select the variable you want to test']",
        "define_versions_and_samples": "xpath=//*[@id='splitrunUI-builderView-breadcrumb-2']//div[contains(text(),'Define versions and samples')]",
        "variable_subject": "xpath=//*[@id='splitrunUI-builderView-testElementMenuBar-Subject']/img",
        "variable_send_date_and_time": "xpath=//*[@id='splitrunUI-builderView-testElementMenuBar-SendDateTime']/img",
        "variable_sender": "xpath=//*[@id='splitrunUI-builderView-testElementMenuBar-Sender']/img",
        "variable_dynamic_content": "xpath=//*[@id='splitrunUI-builderView-testElementMenuBar-Banner']/img",
        "variable_image": "xpath=//*[@id='splitrunUI-builderView-testElementMenuBar-Image']/img",
        "variable_message": "xpath=//*[@id='splitrunUI-builderView-testElementMenuBar-Message']/img",
        "2_define_test_versions_up_to_20": "xpath=//*[@id='splitrunuidiv']//legend[contains(text(),'2. Define test versions (up to 20)')]",
        "sample_selection": "xpath=//*[@id='splitrunuidiv']//div[contains(text(),'Sample Selection')]",
        "percent_segmentation_button": "xpath=//*[@id='splitrunUI-builderView-percentSegmentationButton']/tbody/tr/td/div/img",
        "percent_input_verion_0": "id=splitrunUI-builderView-testSubject-percentInput-version0",
        "percent_input_version_1": "id=splitrunUI-builderView-testSubject-percentInput-version1",
        "number_segmentation_button": "xpath=//*[@id='splitrunUI-builderView-numberSegmentationButton']/tbody/tr/td/div/img",
        "select_a_field": "xpath=//*[@id='splitrunUI-builderView-testSubject-persoFieldsButton-version1']/div",
        "select_email_select_a_field": "xpath=//*[@id='splitrunUI-builderView-testSubject-persoFieldsList-version1']/option[contains(text(),'EMAIL')]",
        "subject_input_version_1": "id=splitrunUI-builderView-testSubject-subjectInput-version1",
        "label_add_version": "xpath=//*[@id='splitrunUI-builderView-addVersionButton']//div[contains(text(),'Add version')]",
        "continue_button": "xpath=//*[@id='splitrunUI-builderView-nextButton']//div[contains(text(),'Continue')]",
        "1_schedule_the_multivariate_test": "xpath=//*[@id='splitrunuidiv']//legend[./text()='1. Schedule the MultiVariate Test']",
        "send_test_and_schedule_winning_campaign": "xpath=//*[@id='splitrunUI-builderView-breadcrumb-3']//div[contains(text(),'Send test and schedule winning campaign')]",
        "send_now_redio_button": "id=splitrunUI-builderView-sendNowRadioButton",
        "send_later_redio_button": "id=splitrunUI-builderView-sendLaterRadioButton",
        "2_select_success_key_indicator_and_schedule_the_winning_campaign": "xpath=//*[@id='splitrunuidiv']//legend[./text()='2. Select success key indicator and schedule the winning campaign']",
        "key_indicator_dropdown": "id=splitrunUI-builderView-kpiInput",
        "send_after": "id=splitrunUI-builderView-autoSendRadioButton",
        "24_hours_input": "id=splitrunUI-builderView-autoSendInput",
        "opti_send_redio_button": "id=splitrunUI-builderView-optiSendRadioButton",
        "manual_redio_button": "id=splitrunUI-builderView-manualRadioButton",
        "more_options": "xpath=//*[@id='splitrunUI-builderView-moreOptionsButton']//div[./text()='More options']",
        "back_button": "xpath=//*[@id='splitrunUI-builderView-previousButton']//div[contains(text(),'Back')]",
        "schedule_button": "xpath=//*[@id='splitrunUI-builderView-sendCampaignButton']//div[contains(text(),'Schedule')]"

    },
    "button_list": {
        "list": "xpath=//*[@id='engage-send']//ul[@title='MultiVariate']/li[2]",
        "multivariate_tests": "xpath=//*[@id='splitrunUI-mainMenu-archiveButton']//span[./text()='MultiVariate Tests']",
        "campaign_name": "xpath=//*[@id='splitrunuidiv']//div[./text()='Campaign Name']",
        "id": "xpath=//*[@id='splitrunuidiv']//div[./text()='ID']",
        "status": "xpath=//*[@id='splitrunuidiv']//div[./text()='Status']",
        "test_variable": "xpath=//*[@id='splitrunuidiv']//div[./text()='Test variable']",
        "send_date": "xpath=//*[@id='splitrunuidiv']//div[./text()='Send date']"
    }
}

multimessage_campaign = {
    "menu": "xpath=//*[@id='engage-send']/div[./text()='Send']",
    "button_add": {
        "add": "xpath=//*[@id='engage-send']//ul[@title='MultiMessage']/li",
        "multi_messages": "xpath=//*[@id='splitrunUI-mainMenu-archiveButton']//span[./text()='MultiMessages']",
        "define_campaign_and_recipients": "xpath=//*[@id='splitrunUI-builderView-breadcrumb-1']//div[contains(text(),'Define campaign and recipients')]",
        "campaign_name_and_description": "xpath=//*[@id='splitrunuidiv']//legend[contains(text(),'1. Campaign name and description')]",
        "campaign_name": "xpath=//*[@id='splitrunuidiv']//div[contains(text(),'Campaign Name')]",
        "input_name": "id=splitrunUI-builderView-nameInput",
        "campaign_description": "xpath=//*[@id='splitrunuidiv']//div[contains(text(),'Campaign description')]",
        "input_description": "id=splitrunUI-builderView-descriptionInput",
        "select_recipients": "xpath=//*[@id='splitrunuidiv']//legend[contains(text(),'2. Select recipients')]",
        "segment": "xpath=//*[@id='splitrunuidiv']//div[contains(text(),'Segment')]",
        "select_one_or_more_segments": "xpath=//*[@id='splitrunUI-builderView-segmentsExplorer-openButton']//div[contains(text(),'Select one or more segments')]",
        "qa_auto_test_segment": "xpath=//*[@id='splitrunUI-builderView-segmentsExplorer-nameColumn' and contains(text(),'QA auto test Segment')]",
        "click_ok": "xpath=//*[@id='splitrunUI-builderView-segmentsExplorer-addEntitiesButton']//div[contains(text(),'Ok')]",
        "click_continue": "xpath=//*[@id='splitrunUI-builderView-nextButton']//div[contains(text(),'Continue')]",
        "define_campaign_messages_up_to_20": "xpath=//*[@id='splitrunuidiv']//legend[contains(text(),'1. Define campaign messages (up to 20)')]",
        "define_messages_and_partitions": "xpath=//*[@id='splitrunUI-builderView-breadcrumb-2']//div[contains(text(),'Define messages and partitions')]",
        "message_one": "xpath=//*[@id='splitrunUI-builderView-testMessage-messagesExplorer-version1-openButton']//div[contains(text(),'Select a message')]",
        "select_one_record_message_one": "id=splitrunUI-builderView-testMessage-messagesExplorer-version1-idColumn",
        "message_two": "xpath=//*[@id='splitrunUI-builderView-testMessage-messagesExplorer-version2-openButton']//div[contains(text(),'Select a message')]",
        "select_one_record_message_two": "id=splitrunUI-builderView-testMessage-messagesExplorer-version2-idColumn",
        "add_message": "xpath=//*[@id='splitrunUI-builderView-addVersionButton']//div[contains(text(),'Add message')]",
        "back_button": "xpath=//*[@id='splitrunUI-builderView-previousButton']//div[contains(text(),'Back')]",
        "preview_button": "xpath=//*[@id='splitrunUI-builderView-previewVersionsButton']//div[contains(text(),'Preview all versions')]",
        "continue_button": "xpath=//*[@id='splitrunUI-builderView-nextButton']//div[contains(text(),'Continue')]",
        "1_schedule_the_campaign": "xpath=//*[@id='splitrunuidiv']//legend[contains(text(),'1. Schedule the campaign')]",
        "schedule_campaign": "xpath=//*[@id='splitrunUI-builderView-breadcrumb-3']//div[contains(text(),'Schedule campaign')]",
        "send_now_redio_button": "id=splitrunUI-builderView-sendNowRadioButton",
        "send_later_redio_button": "id=splitrunUI-builderView-sendLaterRadioButton",
        "schedule_button": "xpath=//*[@id='splitrunUI-builderView-sendCampaignButton']//div[contains(text(),'Schedule')]"

    },
    "button_list": {
        "list": "xpath=//*[@id='engage-send']//ul[@title='MultiMessage']/li[2]",
        "multi_messages": "xpath=//*[@id='splitrunUI-mainMenu-archiveButton']//span[./text()='MultiMessages']",
        "campaign_name": "xpath=//*[@id='splitrunuidiv']//div[./text()='Campaign Name']",
        "id": "xpath=//*[@id='splitrunuidiv']//div[./text()='ID']",
        "status": "xpath=//*[@id='splitrunuidiv']//div[./text()='Status']",
        "send_date": "xpath=//*[@id='splitrunuidiv']//div[./text()='Send date']"
    }
}

trigger_campaign = {
    "menu": "xpath=//*[@id='engage-send']/div[./text()='Send']",
    "button_add": {
        "add": "xpath=//*[@id='engage-send']//ul[@title='Trigger']/li"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-send']//ul[@title='Trigger']/li[2]",
        "trigger_campaigns": "xpath=//*[@id='ccmd-appBar-triggerCampaignsButton']//td[./text()='Trigger Campaigns']",
        "header_id": "xpath=//*[@id='content']//th[./text()='ID']",
        "header_trigger_campaign_name": "xpath=//*[@id='content']//th[./text()='Trigger Campaign Name']",
        "header_segment": "xpath=//*[@id='content']//th[./text()='Segment']",
        "header_manager": "xpath=//*[@id='content']//th[./text()='Manager']",
        "header_start_date": "xpath=//*[@id='content']//th[./text()='Start Date']",
        "header_end_date": "xpath=//*[@id='content']//th[./text()='End Date']",
        "header_timezone": "xpath=//*[@id='content']//th[./text()='Timezone']",
        "header_status": "xpath=//*[@id='content']//th[./text()='Status']",
        "header_assign": "xpath=//*[@id='content']//th[./text()='Assign']",
        "header_stop_start": "xpath=//*[@id='content']//th[./text()='Stop/Start']",
        "header_edit": "xpath=//*[@id='content']//th[./text()='Edit']",
        "header_delete": "xpath=//*[@id='content']//span[@class='red' and ./text()='Delete']"
    }
}

new_message_builder = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "standard_content": "xpath=//*[@id='engage-create']//span[contains(text(),'Standard Content')]",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//ul[@title='Message Builder']/li",
        "general_settings": "id=general-settings",
        "untitled": "xpath=//*[@id='action-bar-name'][./text()='Untitled']",
        "input_name": "xpath=//*[@id='action-bar-inputname']",
        "add_a_row": "xpath=//*[@id='action-bar-addrow']/span[./text()='Add a row']",
        "add_content": "xpath=//*[@id='action-bar-addcontent']/span[./text()='Add content']",
        "change_style": "xpath=//*[@id='action-bar-styles']/span[./text()='Change style']",
        "links": "xpath=//*[@id='action-bar-links']/span[./text()='Links']",
        "tests": "xpath=//*[@id='action-bar-tests']/span[./text()='Tests']",
        "import": "xpath=//*[@id='action-bar-import']/span[./text()='Import']",
        "import_input": "xpath=//*[@id='action-bar-import-input' and @type='file']",
        "export": "xpath=//*[@id='action-bar-export']/a/span[./text()='Export']",
        "headers": "xpath=//*[@id='editor-switch']//div[./text()='Headers']",
        "visual": "xpath=//*[@id='editor-switch']//div[./text()='Visual']",
        "plain_text": "xpath=//*[@id='editor-switch']//div[./text()='Plain-text']",
        "contents": "xpath=//*[@id='content-palette']//div[./text()='Contents']",
        "layout": "id=palette-contents-carousel-layout",
        "basic": "id=palette-contents-carousel-basic",
        "content_blocks": "id=palette-contents-carousel-content-blocks",
        "drop_content_here": "xpath=//*[@id='message-html']//span[normalize-space(.//text())='Drop content here']",
        "text_icon": "xpath=//*[@id='content-type-item-text']/div[@class='icon text-icon']",
        "image_icon": "xpath=//*[@id='content-type-item-image']/div[@class='icon image-icon']",
        "text_image_icon": "xpath=//*[@id='content-type-item-text-image']/div[@class='icon text-image-icon']",
        "image_text_icon": "xpath=//*[@id='content-type-item-image-text']/div[@class='icon image-text-icon']",
        "share_icon": "xpath=//*[@id='content-type-item-share']/div[@class='icon share-icon']",
        "html_icon": "xpath=//*[@id='content-type-item-html']/div[@class='icon html-icon']",
        "spacer_icon": "xpath=//*[@id='content-type-item-spacer']/div[@class='icon spacer-icon']",
        "video_icon": "xpath=//*[@id='content-type-item-video']/div[@class='icon video-icon']",
        "reco_icon": "xpath=//*[@id='content-type-item-reco']/div[@class='icon reco-icon']"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//ul[@title='Message Builder']/li[2]",
        "name": "xpath=//*[@id='msg-archive-tablediv-header-name']/div[@title='Name']",
        "status": "xpath=//*[@id='msg-archive-tablediv-header-message-status']/div[@title='Status']",
        "mode": "xpath=//*[@id='msg-archive-tablediv-header-message-mode']/div[@title='Mode']",
        "created": "xpath=//*[@id='msg-archive-tablediv-header-creation-date']/div[@title='Created']",
        "last_modified": "xpath=//*[@id='msg-archive-tablediv-header-modification-date']/div[@title='Last modified']",
        "creator": "xpath=//*[@id='msg-archive-tablediv-header-creation-user']/div[@title='Creator']",
        "qa_auto_test_Message": "xpath=//*[@id='archive-list-container']//div[./text()='QA auto test Message']"
    }
}

classic_message_builder = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "standard_content": "xpath=//*[@id='engage-create']//span[contains(text(),'Standard Content')]",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//ul[@title='Message']/li",
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
        "message_reply_to_input": "name=messageReplyTo",
        "to_reply_to_input": "name=toReplyTo",
        "message_subject_input": "name=messageSubject",
        "message_reply_to_email": "name=messageReplyToEmail",
        "message_custom_header_input": "name=xheaderValue(HEADER)",
        "expert_tab": "css=#EXPERT.editorMode.editorModeActive.editorModeText",
        "text_editor": "id=textContent",
        "message_preview": "css=span.blueBtnText",
        "from_member_columns_select_firstname": "xpath=//*[@id='content']//select[@name='fromMemberColumns']//option[contains(text(),'FIRSTNAME')]",
        "to_member_columns_select_member_id": "xpath=//*[@id='content']//select[@name='toMemberColumns']//option[contains(text(),'MEMBER_ID')]",
        "subject_member_culums_select_title": "xpath=//*[@id='content']//select[@name='subjectMemberColumns']//option[contains(text(),'TITLE')]",
        "to_reply_to_email_select_email": "xpath=//*[@id='content']//select[@name='toReplyToEmail']//option[contains(text(),'EMAIL')]",
        "to_reply_to_select_source": "xpath=//*[@id='content']//select[@name='toReplyTo']//option[contains(text(),'SOURCE')]",
        "general_us_and_west_european": "xpath=//*[@id='content']//option[contains(text(),'General US & West European (iso-8859-15)')]",
        "create_and_personalize": "xpath=//*[@id='messageAccordion']//b[./text() = 'Create and Personalize']",
        "expert": "id=EXPERT",
        "visual": "id=VISUAL",
        "template": "id=TEMPLATE",
        "share_link": "xpath=//*[@id='iconToolboxShare']/../../a[contains(text(), 'Share') or ./text() = 'Share']",
        "content_upload_link": "xpath=//*[@id='iconToolboxContentUpload']/../../a/div[contains(text(), 'Content Upload') or ./text() = 'Content Upload']",
        "copy_html_to_text_link": "xpath=//*[@id='iconToolboxCopyHtmlToText']/../../a/div[contains(text(), 'Copy Html to Text') or ./text() = 'Copy Html to Text']",
        "insert_imate_link": "xpath=//*[@id='iconToolboxInsertImage']/../../a/div[contains(text(), 'Insert Image') or ./text() = 'Insert Image']",
        "insert_dynamic_content_block_link": "xpath=//*[@id='iconBannerSmall']/../../a/div[contains(text(), 'Insert Dynamic Content Block') or ./text() = 'Insert Dynamic Content Block']",
        "track_all_link": "xpath=//*[@id='iconToolboxTrackLinks']/../../a/div[contains(text(), 'Track All Links') or ./text() = 'Track All Links']",
        "link_management_link": "xpath=//*[@id='iconToolboxLinksManagt']/../../a/div[contains(text(), 'Link Management') or ./text() = 'Link Management']",
        "external_content_link": "xpath=//*[@id='iconToolboxCMS']/../../a/div[contains(text(), 'External Content') or ./text() = 'External Content']",
        "message_personalization_link": "xpath=//*[@id='iconToolboxMessagePerso']/../../a/div[contains(text(), 'Message Personalization') or ./text() = 'Message Personalization']",
        "insert_emoji_link": "xpath=//*[@id='iconToolboxMessageEmoji']/../../a/div[contains(text(), 'Insert Emoji') or ./text() = 'Insert Emoji']",
        "send_test_message_link": "xpath=//*[@id='iconToolboxMessageSendTest']/../../a/div[contains(text(), 'Send Test Message') or ./text() = 'Send Test Message']",
        "deliverability_test_link": "xpath=//*[@id='iconDeliverability']/../../a/div[contains(text(), 'Deliverability Test') or ./text() = 'Deliverability Test']"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//ul[@title='Message']/li[2]",
        "workflow": "css=#ccmd-messages-cell-workflow1.actionColumnUneven > a > #iconWfmAssign.sprite",
        "edit": "css=#ccmd-messages-cell-edit1 > a > #iconEdit",
        "favourites": "css=#favourites.actionColumnUneven > a > #span.checkbox",
        "copy": "css=#ccmd-messages-cell-copy1.actionColumnUneven > a > #iconCopy.sprite",
        "preview": "css=#ccmd-messages-cell-preview1.actionColumnUneven > a > #iconView.sprite",
        "test_message": "xpath=//*[@id='iconCampaignTest'][@title='Test']/../../a",
        "audit_deliverability": "css=#ccmd-messages-cell-deliv1.actionColumnUneven > a > #iconDeliverability.sprite",
        "delete": "xpath=//*[@id='iconTrash']/../../a",
        "messages": "xpath=//*[@id='ccmd-appBar-messagesButton']//td[@class='applicationBarButtonTextTD' and ./text()='Messages']",
        "header_id": "xpath=//*[@id='ccmd-messages-table']//th[./text()='ID']",
        "header_message_name": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Message Name']",
        "header_association_id": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Association (ID)']",
        "header_workflow": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Workflow']",
        "header_edit": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Edit']",
        "header_favorites": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Favorites']",
        "header_copy": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Copy']",
        "header_preview": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Preview']",
        "header_test_message": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Test Message']",
        "header_audit_deliverability": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Audit Deliverability']",
        "header_delete": "xpath=//*[@id='ccmd-messages-table']//span[@class='red' and ./text()='Delete']"

    }
}

sms_message_builder = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//ul[@title='SMS Message']/li",
        "qa_sms_message_name": "id=qa-sms-message-name",
        "qa_sms_message_description": "id=qa-sms-message-description",
        "qa_sms_message_form": "id=qa-sms-message-from",
        "text_content": "id=textContent",
        "message_personalization_link": "xpath=//a[contains(text(), 'Message Personalization') or ./text() = 'Message Personalization']",
        "message_preview_link": "xpath=//a[contains(text(),'Message Preview') or ./text() = 'Message Preview']",
        "send_test_message_link": "xpath=//a[contains(text(),'Send Test Message') or ./text() = 'Send Test Message']",
        "back_button": "xpath=//a[contains(text(),'Back') or ./text() = 'Back']",
        "save_button": "xpath=//a[contains(text(),'Save') or ./text() = 'Save']",
        "save_and_go_to_sms_messages_button": "xpath=//a[contains(text(),'Save and go to SMS Messages') or ./text() = 'Save and go to SMS Messages']"

    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//ul[@title='SMS Message']/li[2]",
        "delete": "xpath=//*[@id='iconTrash']/../../a",
        "sms": "xpath=//*[@id='ccmd-appBar-SMSButton']//td[@class='applicationBarButtonTextTD' and ./text()='SMS']",
        "header_id": "xpath=//*[@id='ccmd-messages-table']//th[./text()='ID']",
        "header_message_name": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Message Name']",
        "header_created_by": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Created by']",
        "header_association_id": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Association (ID)']",
        "header_workflow": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Workflow']",
        "header_edit": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Edit']",
        "header_favorites": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Favorites']",
        "header_copy": "xpath=//*[@id='ccmd-messages-table']//th[./text()='Copy']",
        "header_delete": "xpath=//*[@id='ccmd-messages-table']//span[@class='red' and ./text()='Delete']"
    }
}

landing_page = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//ul[@title='Landing page']/li",
        "untitled": "xpath=//*[@id='lpages-pagebar-name'][./text()='Untitled']",
        "undo": "xpath=//*[@id='lpages-pagebar-undo']/span[./text()='Undo']",
        "add_a_row": "xpath=//*[@id='lpages-pagebar-addrow']/span[./text()='Add a row']",
        "change_style": "xpath=//*[@id='lpages-pagebar-presets']/span[./text()='Change styles']",
        "apply_to_entire_page": "xpath=//*[@id='lpages-editor-presets']//span[./text()='Apply to entire page']",
        "overwrite_inline_styles": "xpath=//*[@id='lpages-editor-presets']//span[./text()='Overwrite inline styles']",
        "page_style": "xpath=//*[@id='lpages-editor-presets-carousel']/div[./text()='Page']",
        "text_style": "xpath=//*[@id='lpages-editor-presets-carousel']/div[./text()='Text']",
        "form_style": "xpath=//*[@id='lpages-editor-presets-carousel']/div[./text()='Form']",
        "wisard_controls": "xpath=//*[@id='lpages-editor-rows']//div[@class='lpages-editor-wizardcontrols']",
        "editor_wizard_text": "xpath=//*[@id='lpages-editor-rows']//button[@class='btn btn-large lpages-editor-wizardtext']",
        "editor_wizard_image": "xpath=//*[@id='lpages-editor-rows']//button[@class='btn btn-large lpages-editor-wizardimage']",
        "editor_qizard_smartengage": "xpath=//*[@id='lpages-editor-rows']//button[@class='btn btn-large lpages-editor-wizardsmartengage']",
        "editor_ wizard_shtml": "xpath=//*[@id='lpages-editor-rows']//button[@class='btn btn-large lpages-editor-wizardshtml']",
        "editor_qizard_form": "xpath=//*[@id='lpages-editor-rows']//button[@class='btn btn-large lpages-editor-wizardform']",
        "editor_subscriptionsuspension": "xpath=//*[@id='lpages-editor-rows']//button[@class='btn btn-large lpages-editor-wizardform-subscriptionsuspension']",
        "save": "xpath=//*[@id='lpages-editor-btnsave' and contains(text(),'Save')]"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//ul[@title='Landing page']/li[2]",
        "my_pages": "xpath=//*[@id='lpages-appbar-btnpages']/span[./text()='My Pages']",
        "header_id": "xpath=//*[@id='lpages-pages-tablediv-header-id']/div[./text()='ID']",
        "header_name": "xpath=//*[@id='lpages-pages-tablediv-header-name']/div[./text()='Name']",
        "header_last_modified": "xpath=//*[@id='lpages-pages-tablediv-header-lastmodified']/div[./text()='Last Modified']",
        "header_status": "xpath=//*[@id='lpages-pages-tablediv-header-status']/div[./text()='Status']",
        "header_start_date": "xpath=//*[@id='lpages-pages-tablediv-header-startdate']/div[./text()='Start date']",
        "header_stop_date": "xpath=//*[@id='lpages-pages-tablediv-header-stopdate']/div[./text()='Stop date']"
    }
}

content_block = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//ul[@title='Content Block']/li",
        "name": "name=name",
        "description": "name=description",
        "text_content": "id=textContent",
        "tool_box": "id=toolbox",
        "text_content": "id=textContent",
        "message_name": "name=messageName",
        "message_description": "name=messageDescription",
        "message_from": "name=messageFrom",
        "message_to": "name=messageTo",
        "message_reply_to": "name=messageReplyToEmail",
        "html_checkbox": "xpath=//*[@id='content']//input[@type='radio' and @value='TEXT']",
        "text_only_checkbox": "xpath=//*[@id='content']//input[@type='radio' and @value='HTML']",
        "save": "//a[contains(text(),'Save') or ./text()='Save']",
        "content_upload": "xpath=//*[@id='iconUpload']/../../a/div[./text()='Content upload']",
        "track_all_links": "xpath=//*[@id='iconToolboxTrackLinks']/../../a/div[./text()='Track All Links']",
        "link_management": "xpath=//*[@id='iconToolboxLinksManagt']/../../a/div[./text()='Link Management']",
        "create_advanced_link": "xpath=//*[@id='navmenu']/li/a[./text()='Create Advanced Link']",
        "mirror_link": "xpath=//*[@id='navmenu']//a[./text()='Mirror Link']",
        "save_and_link": "xpath=//a[@href='javascript:saveAndAddLink();' and ./text()='Choice2: Save/Add Link']",
        "close_popup_box": "id=popCloseBox",
        "save": "xpath=//*[@id='iconSave']/../../a[normalize-space(.//text())='Save']",
        "external_content": "xpath=//*[@id='iconToolboxCMS']/../../a/div[./text()='External Content']",
        "dynamic_content_block_personalization": "xpath=//*[@id='iconToolboxMessagePerso']/../../a/div[./text()='Dynamic Content Block Personalization']",
        "dynamic_content_block_preview": "xpath=//*[@id='iconToolboxMessagePreview']/../../a/div[./text()='Dynamic Content Block Preview']"

    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//ul[@title='Content Block']/li[2]",
        "dynamic_content_blocks": "xpath=//*[@id='archive']/span[./text()='Dynamic Content Blocks']",
        "header_id": "xpath=//*[@id='content-blocks-tablediv-header-id']/div[./text()='ID']",
        "header_name": "xpath=//*[@id='content-blocks-tablediv-header-name']/div[./text()='Name']",
        "header_description": "xpath=//*[@id='content-blocks-tablediv-header-description']/div[./text()='Description']",
        "header_type": "xpath=//*[@id='content-blocks-tablediv-header-type']/div[./text()='Type']",
        "header_creation_date": "xpath=//*[@id='content-blocks-tablediv-header-creation-date']/div[./text()='Creation Date']",
        "header_modification_date": "xpath=//*[@id='content-blocks-tablediv-header-modification-date']/div[./text()='Modification date']",
        "header_creator": "xpath=//*[@id='content-blocks-tablediv-header-creator']/div[./text()='Creator']"
    }
}

webform = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//ul[@title='Webform']/li",
        "STEP_1_settings": "xpath=//*[@id='content']//td[./text()='STEP 1: Settings']",
        "STEP_2_Fields": "xpath=//*[@id='content']//td[normalize-space(.//text())='STEP 2: Fields']",
        "STEP_3_confirmation_email": "xpath=//*[@id='content']//td[./text()='STEP 3: Confirmation Email']",
        "customer_name": "name=name",
        "customer_description": "name=description",
        "select_languages": "name=language",
        "language_option": "xpath=//*[@id='content']//option[contains(text(),'English')]",
        "select_date": "id=datepicker",
        "today_date": "xpath=//*[@id='datepicker_root']//button[@class='picker__button--today']",
        "confirm_url": "name=confirmUrl",
        "error_url": "name=errorUrl",
        "next_step": "xpath=//*[@id='iconButtonNext']/../../a[normalize-space(.//text())='Next Step']",
        "webform_type": "xpath=//*[@id='content']//select[@name='type']",
        "webform_type": "name=type",
        "webform_update_profile": "xpath=//*[@id='webFormTypeDesc']",
        "update_webform_option": "//*[@id='content']//option[normalize-space(.//text())='Update webform']",
        "field_name": "xpath=//*[@id='entry[0]']/td[1]/select/option[normalize-space(.//text())='EMAIL']",
        "display_name": "xpath=//*[@id='entry[0]']/td[3]/input[@type='text']",
        "input_type": "xpath=//*[@id='entry[0]']/td[4]/select/option[normalize-space(.//text())='TEXT']",
        "default_value": "xpath=//*[@id='entry[0]']/td[6]/input[@type='text']",
        "validation_type": "xpath=//*[@id='entry[0]']/td[7]/select/option[normalize-space(.//text())='EMAIL']",
        "text_length": "xpath=//*[@id='entry[0]']/td[8]/input[@type='text']",
        "select_user": "xpath=//*[@id='bounceBackSection']//select/option[./text()='User']",
        "bounce_back_type": "name=bounceBackType",
        "service_email_address": "name=managerMail",
        "reply_to_email": "name=replyTo",
        "message_id": "name=messageId",
        "save_webform": "xpath=//*[@id='iconButtonPersonnalisation']/../../a[@class='btn orange']",
        "previous_step": "xpath=//*[@id='content']//a[@class='btn blue']",
        "submit_form": "xpath=//*[@id='emvForm']//input[@value='Submit Form']",
        "edit_webform": "xpath=//*[@id='content']//a[normalize-space(.//text())='Edit Webform' and @class='btn orange']"

    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//ul[@title='Webform']/li[2]",
        "webforms": "xpath=//*[@id='ccmd-appBar-webformsButton']//td[./text()='Webforms']",
        "header_id": "xpath=//*[@id='content']//th[./text()='ID']",
        "header_webform_name": "xpath=//*[@id='content']//th[./text()='Webform Name']",
        "header_webform_description": "xpath=//*[@id='content']//th[./text()='Webform Description']",
        "header_webform_end_date": "xpath=//*[@id='content']//th[./text()='Webform End Date']",
        "header_manager": "xpath=//*[@id='content']//th[./text()='Manager']",
        "header_status": "xpath=//*[@id='content']//th[./text()='Status']",
        "header_edit": "xpath=//*[@id='content']//th[./text()='Edit']",
        "header_copy": "xpath=//*[@id='content']//th[./text()='Copy']",
        "header_preview": "xpath=//*[@id='content']//th[./text()='Preview']",
        "select_delete_check_box": "xpath=//*[@id='ccmd-member-archive-cell-delete0']/input[@name='deleteMember']",
        "icon_trash": "xpath=//*[@id='iconTrash']/../../a",
        "confirm_delete": "css=#content > form > table.validationTable > tbody > tr > td.validationR > a",

        "first_name": "xpath=//*[@id='content']//th[./text()='First Name']",
        "last_name": "xpath=//*[@id='content']//th[./text()='Last name']",
        "name_webform": "xpath=//*[@id='rows']/tr/td[./text()='NameWebForm']",
        "surname_webform": "xpath=//*[@id='rows']/tr/td[./text()='SurnameWebForm']",
        "qa_auto_email": "xpath=//*[@id='rows']/tr/td[text()='qa.auto@smartfocus.com']",

    }
}

template = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//ul[@title='Template']/li",
        "customer_name": "name=name",
        "customer_description": "name=description",
        "upload_file": "name=uploadFile",
        "message_name": "name=messageName",
        "message_description": "name=messageDescription",
        "message_from": "name=messageFrom",
        "message_to": "name=messageTo",
        "message_reply_to": "name=messageReplyToEmail",
        "import_file": "xpath=//*[@id='iconUpload']/../../a[contains(text(),'Import') or ./text()='Import']",
        "happy_easter": "xpath=//*[@id='templateContent']//div[./text()='Happy Easter']",
        "save": "xpath=//*[@id='iconButtonSave']/../../a[./text()='Save']",
        "message_preview": "id=iconToolboxMessagePreview"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//ul[@title='Template']/li[2]",
        "templates": "xpath=//*[@id='ccmd-appBar-lists-templatesButton']//td[./text()='Templates']",
        "display_options_link": "xpath=//*[@id='ccmd-templates-cell-header']//a[./text()='Display Options']",
        "header_template_id": "xpath=//*[@id='ccmd-templates-table']//th[./text()='Template Id']",
        "header_name": "xpath=//*[@id='ccmd-templates-table']//th[./text()='Name']",
        "header_description": "xpath=//*[@id='ccmd-templates-table']//th[./text()='Description']",
        "header_view": "xpath=//*[@id='ccmd-templates-table']//th[./text()='View']",
        "header_create_message": "xpath=//*[@id='ccmd-templates-table']//th[./text()='Create message']",
        "header_export": "xpath=//*[@id='ccmd-templates-table']//th[./text()='Export']",
        "header_replace": "xpath=//*[@id='ccmd-templates-table']//th[./text()='Replace']",
        "header_delete": "xpath=//*[@id='ccmd-templates-table']//span[@class='red' and ./text()='Delete']",
        "tick_check_box_to_delete": "name=deleteTemplate",
        "edit": "id=iconEdit",
        "delete": "xpath=//*[@id='iconTrash']/../../a",
        "save": "css=#messageAccordion > form > div:nth-child(5) > table > tbody > tr > td > a:nth-child(1)"
    }
}

transactional_message = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "transactional_content": "xpath=//*[@id='engage-create']//span[./text()='Transactional Content']",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//span[contains(text(),'Transactional Content')]/..//ul[@title='Message']/li",
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
        "content_upload": "xpath=//*[@id='toolbox']//a/div[normalize-space(.//text())='Creative Upload']",
        "copy_HTML_to_text": "xpath=//*[@id='iconToolboxCopyHtmlToText']/../../a/div[contains(text(),'Copy HTML to Text')]",
        "insert_dynamic_content_block": "xpath=//*[@id='iconPromotionAdsSmall']/../../a/div[contains(text(),'Insert Dynamic Content Block')]",
        "track_links": "xpath=//*[@id='iconToolboxTrackLinks']/../../a/div[contains(text(),'Track Links')]",
        "manage_links": "xpath=//*[@id='iconToolboxLinksManagt']/../../a/div[contains(text(),'Manage Links')]",
        "personalize_content": "xpath=//*[@id='iconToolboxMessagePerso']/../../a/div[contains(text(),'Personalize Content')]",
        "preview": "xpath=//*[@id='iconToolboxMessagePreview']/../../a/div[contains(text(),'Preview')]",
        "send_test": "xpath=//*[@id='iconToolboxMessageSendTest']/../../a/div[contains(text(),'Send Test')]",
        "save": "xpath=//*[@id='iconSave']/../../a[normalize-space(.//text())='Save']",
        "save_and_back": "xpath=//*[@id='iconSave']/../../a[normalize-space(.//text())='Save & Back To Integration and Testing']"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//span[contains(text(),'Transactional Content')]/..//ul[@title='Message']/li[2]",
        "message": "xpath=//*[@id='ccmd-appBar-realTimeMessagesButton']//td[./text()='Messages']",
        "header_id": "xpath=//*[@id='archiveList']//th[normalize-space(.//text())='ID']",
        "header_integration_status": "xpath=//*[@id='archiveList']//th[normalize-space(.//text())='Integration Status']",
        "header_name": "xpath=//*[@id='archiveList']//th[normalize-space(.//text())='Name']",
        "header_description": "xpath=//*[@id='archiveList']//th[normalize-space(.//text())='Description']",
        "header_created_by": "xpath=//*[@id='archiveList']//th[normalize-space(.//text())='Created by']",
        "header_preview": "xpath=//*[@id='archiveList']//th[normalize-space(.//text())='Preview']",
        "header_edit": "xpath=//*[@id='archiveList']//th[normalize-space(.//text())='Edit']",
        "header_copy": "xpath=//*[@id='archiveList']//th[normalize-space(.//text())='Copy']",
        "header_delete": "xpath=//*[@id='archiveList']//span[@class='red' and normalize-space(.//text())='Delete']",
        "delete": "xpath=//*[@id='iconTrash']/../../a",
        "reports": "xpath=//*[@id='ccmd-appBar-realTimeReportsButton']//td[./text()='Reports']",
        "dashbords": "xpath=//*[@id='dashboard-tab']/a[normalize-space(.//text())='Dashboards']",
        "export_in_excel": "xpath=//*[@id='NotificationDashboardForm']/a[@alt='Export in Excel']",
        "date_range_report": "xpath=//*[@id='daterange-tab']/a[normalize-space(.//text())='Date Range Report']",
        "notification_lable": "xpath=//*[@id='NotificationDateRangeForm']//b[./text()='Notification']",
        "select_message_id": "name=selectedMessageId",
        "begin_date_lable": "xpath=//*[@id='NotificationDateRangeForm']//b[./text()='Begin Date']",
        "begin_date_picker": "id=beginDatePicker",
        "end_date_lable": "xpath=//*[@id='NotificationDateRangeForm']//b[./text()='End Date']",
        "end_date_picker": "id=endDatePicker",
        "range_form_ok_button": "xpath=//*[@id='NotificationDateRangeForm']//a[./text()='OK']",
        "custom_search": "xpath=//*[@id='custom-tab']//a[normalize-space(.//text())='Custom Search']",
        "email_lable": "xpath=//*[@id='NotificationCustomForm']//b[./text()='Email']",
        "email_input": "name=email",
        "custom_form_ok_button": "xpath=//*[@id='NotificationCustomForm']//a[./text()='OK']"
    }
}

transactional_content_block = {
    "menu": "xpath=//*[@id='engage-create']/div[./text()='Create']",
    "transactional_content": "xpath=//*[@id='engage-create']//span[./text()='Transactional Content']",
    "button_add": {
        "add": "xpath=//*[@id='engage-create']//span[contains(text(),'Transactional Content')]/..//ul[@title='Content Block']/li",
        "customer_name": "name=name",
        "customer_description": "name=description",
        "text_content": "id=textContent",
        "html_checkbox": "xpath=//*[@id='content']//input[@type='radio' and @value='TEXT']",
        "text_only_checkbox": "xpath=//*[@id='content']//input[@type='radio' and @value='HTML']",
        "save": "xpath=//*[@id='iconSave']/../../a[contains(text(),'Save') or ./text()='Save']",
        "content_upload": "xpath=//*[@id='iconUpload']/../../a/div[contains(text(),'Content upload')]",
        "track_all_links": "xpath=//*[@id='iconToolboxTrackLinks']/../../a/div[contains(text(),'Track All Links')]",
        "link_management": "xpath=//*[@id='iconToolboxLinksManagt']/../../a/div[contains(text(),'Link Management')]",
        "message_personalization": "xpath=//*[@id='iconToolboxMessagePerso']/../../a/div[contains(text(),'Message Personalization')]",
        "message_preview": "xpath=//*[@id='iconToolboxMessagePreview']/../../a/div[contains(text(),'Message Preview')]"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-create']//span[contains(text(),'Transactional Content')]/..//ul[@title='Content Block']/li[2]",
        "dynamic_content_blocks": "xpath=//*[@id='ccmd-appBar-realTimeBannersButton']//td[./text()='Dynamic Content Blocks']",
        "header_id": "xpath=//*[@id='content']//th[normalize-space(.//text())='ID']",
        "header_name": "xpath=//*[@id='content']//th[normalize-space(.//text())='Name']",
        "header_description": "xpath=//*[@id='content']//th[normalize-space(.//text())='Description']",
        "header_created_by": "xpath=//*[@id='content']//th[normalize-space(.//text())='Created by']",
        "header_preview": "xpath=//*[@id='content']//th[normalize-space(.//text())='Preview']",
        "header_edit": "xpath=//*[@id='content']//th[normalize-space(.//text())='Edit']",
        "header_copy": "xpath=//*[@id='content']//th[normalize-space(.//text())='Copy']",
        "header_delete": "xpath=//*[@id='content']//span[@class='red' and normalize-space(.//text())='Delete']",
        "delete": "xpath=//*[@id='iconTrash']/../../a"
    }
}

segments = {
    "menu": "xpath=//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "xpath=//*[@id='engage-list-management']//span[contains(text(),'Subscriber Management')]",
    "button_add": {
        "add": "xpath=//*[@id='engage-list-management']//span[@class='dropdown-module-title no-title' and contains(text(),'Segment')]/../ul/li"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-list-management']//span[contains(text(),'Segment')]/../ul/li[2]"
    }
}

add_subscriber = {
    "menu": "xpath=//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "xpath=//*[@id='engage-list-management']//span[./text()='Subscriber Management']",
    "button_add": {
        "add": "xpath=//*[@id='engage-list-management']//ul[@title='Add subscriber']/li",
        "search_button": "xpath=//*[@id='ccmd-appBar-searchMemberButton']//td[./text()='Search']",
        "header_database_field": "xpath=//*[@id='content']//th[./text()='Database Field']",
        "header_database_type": "xpath=//*[@id='content']//th[./text()='Type']",
        "header_database_value": "xpath=//*[@id='content']//th[./text()='Value']",
        "header_database_stats": "xpath=//*[@id='content']//th[./text()='Stats']",
        "save_member": "xpath=//*[@id='iconButtonSave']/../../a[@class='btn blue']",
        "reset": "xpath=//*[@id='iconButtonReset']/../../a[./text()='Reset']",
        "cancel": "xpath=//*[@id='iconCancel']/../../a[./text()='Cancel']"
    }
}

search_subscriber = {
    "menu": "xpath=//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "xpath=//*[@id='engage-list-management']//span[./text()='Subscriber Management']",
    "button_add": {
        "add": "xpath=//*[@id='engage-list-management']//ul[@title='Search subscriber']/li",
        "search_button": "xpath=//*[@id='ccmd-appBar-searchMemberButton']//td[./text()='Search']",
        "header_database_field": "xpath=//*[@id='content']//th[./text()='Database Field']",
        "header_select_operator": "xpath=//*[@id='content']//th[./text()='Select Operator']",
        "header_value": "xpath=//*[@id='content']//th[./text()='Value']",
        "header_add": "xpath=//*[@id='content']//th[./text()='Add']",
        "select_text_field": "name=textFieldCombo",
        "select_text_field_option_email": "xpath=//*[@id='content']//select/option[normalize-space(.//text())= 'EMAIL']",
        "text_field_operator": "name=textFieldOperator",
        "text_field_operator_option_contains": "xpath=//*[@id='content']//select/option[normalize-space(.//text())= 'contains']",
        "search": "id=iconSearch",
        "text_field_value": "name=textFieldValue",
        "add_text": "xpath=//*[@id='content']//a[@href='javascript:addText()']",
        "select_number_field": "xpath=//*[@id='iconCriteriaNum']/../select[@name='numericFieldCombo']",
        "number_field_operator": "xpath=//*[@id='content']//select[@name='numericFieldOperator']",
        "number_field_value": "xpath=//*[@id='content']//input[@name='numericFieldValue']",
        "add_numeric": "xpath=//*[@id='content']//a[@href='javascript:addNumeric()']",
        "date_field_operator": "xpath=//*[@id='content']//select[@name='dateFieldOperator']",
        "date_picker": "id=datepicker",
        "add_date": "xpath=//*[@id='content']//a[@href='javascript:addDate()']",
        "segmentation_operator": "xpath=//*[@id='content']//select[@name='segmentationOperator']",
        "segmentation_index": "xpath=//*[@id='content']//select[@name='segmentationIndex']",
        "add_segmentation": "xpath=//*[@id='content']//a[@href='javascript:addSegmentation()']",
        "search_chrateria": "xpath=//*[@id='content']//td[./text()='Search Criteria' or normalize-space(.//text())='Search Criteria']"
    }
}

import_subscriber = {
    "menu": "xpath=//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "xpath=//*[@id='engage-list-management']//span[./text()='Subscriber Management']",
    "button_add": {
        "add": "xpath=//*[@id='engage-list-management']//ul[@title='Import subscriber']/li",
        "imports_button": "xpath=//*[@id='ccmd-appBar-membersImportsButton']//td[./text()='Imports']",
        "import_button": "id=ccmd-import-btn",
        "header_id": "xpath=//*[@id='content']//th[./text()='ID']",
        "header_filename": "xpath=//*[@id='content']//th[./text()='Filename']",
        "header_import_date": "xpath=//*[@id='content']//th[./text()='Import Date']",
        "header_create_date": "xpath=//*[@id='content']//th[./text()='Created by']",
        "header_original_filename": "xpath=//*[@id='content']//th[./text()='Original Filename']",
        "header_size_b": "xpath=//*[@id='content']//th[./text()='Size (b)']",
        "header_status": "xpath=//*[@id='content']//th[./text()='Status']",
        "header_del": "xpath=//*[@id='content']//span[./text()='Del.']"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-list-management']//ul[@title='Import subscriber']/li[2]",
        "imports_button": "xpath=//*[@id='ccmd-appBar-membersImportsButton']//td[./text()='Imports']",
        "header_status": "xpath=//*[@id='content']//th[./text()='Status']",
        "header_id": "xpath=//*[@id='content']//th[./text()='ID']",
        "header_original_filename": "xpath=//*[@id='content']//th[./text()='Original Filename']",
        "header_created_by": "xpath=//*[@id='content']//th[./text()='Created by']",
        "header_import_date": "xpath=//*[@id='content']//th[./text()='Import Date']",
        "header_size_b": "xpath=//*[@id='content']//th[./text()='Size (b)']",
        "header_step": "xpath=//*[@id='content']//th[./text()='Sep.']",
        "header_lines": "xpath=//*[@id='content']//th[./text()='Lines']",
        "header_val_errors": "xpath=//*[@id='content']//th[./text()='Val. Errors']",
        "header_imp_errors": "xpath=//*[@id='content']//th[./text()='Imp. Errors']",
        "header_log": "xpath=//*[@id='content']//th[./text()='Log']",
        "header_nb_insert": "xpath=//*[@id='content']//th[./text()='Nb Insert']",
        "header_job_begin": "xpath=//*[@id='content']//th[./text()='Job Begin']",
        "header_job_end": "xpath=//*[@id='content']//th[./text()='Job End']"
    }
}

export_subscriber = {
    "menu": "xpath=//*[@id='engage-list-management']/div[./text()='List Management']",
    "subscriber_management": "xpath=//*[@id='engage-list-management']//span[./text()='Subscriber Management']",
    "button_add": {
        "add": "xpath=//*[@id='engage-list-management']//ul[@title='Export subscriber']/li",
        "exports": "xpath=//*[@id='ccmd-appBar-membersExportsButton']//td[./text()='Exports']",
        "email_view": "id=emailView",
        "sms_view": "id=smsView",
        "select_a_campaign_and_action": "xpath=//*[@id='content']//select[@name='campaignId']",
        "selected": "xpath=//*[@id='content']//input[@value='1']",
        "sent": "xpath=//*[@id='content']//input[@value='27']",
        "received_and_not_opened": "xpath=//*[@id='content']//input[@value='2']",
        "opend": "xpath=//*[@id='content']//input[@value='6']",
        "clicked": "xpath=//*[@id='content']//input[@value='4']",
        "clicked_with_url_details": "xpath=//*[@id='content']//input[@value='5']",
        "post_click_tracking": "xpath=//*[@id='content']//input[@value='8']",
        "filtered": "xpath=//*[@id='content']//input[@value='15']",
        "unjoin": "xpath=//*[@id='content']//input[@value='7']",
        "hard_bounced": "xpath=//*[@id='content']//input[@value='9']",
        "soft_bounced": "xpath=//*[@id='content']//input[@value='10']",
        "hard_and_soft_bounced": "xpath=//*[@id='content']//input[@value='3']",
        "conplaints": "xpath=//*[@id='content']//input[@value='16']",
        "submit_campaign_form": "xpath=//*[@id='content']//a[@href='javascript:submitCampaignForm();']",
        "select_a_segment_and_status": "xpath=//*[@id='content']//select[@name='mailinglistId']",
        "active_members": "xpath=//*[@id='content']//input[@value='17']",
        "quarantined_or_unjoin_members": "xpath=//*[@id='content']//input[@value='18']",
        "quarantined_members": "xpath=//*[@id='content']//input[@value='19']",
        "unjoin_members": "xpath=//*[@id='content']//input[@value='20']",
        "sms_active_members": "xpath=//*[@id='content']//input[@value='23']",
        "sms_quarantined_or_sms_unjoin_members": "xpath=//*[@id='content']//input[@value='24']",
        "sms_quarantined_members": "xpath=//*[@id='content']//input[@value='25']",
        "sms_unjoin_members": "xpath=//*[@id='content']//input[@value='26']",
        "all_members": "xpath=//*[@id='content']//input[@value='21']",
        "submit_segment_form": "xpath=//*[@id='content']//a[@href='javascript:submitSegmentationForm();']"
    },
    "button_list": {
        "list": "xpath=//*[@id='engage-list-management']//ul[@title='Export subscriber']/li[2]",
        "exports": "xpath=//*[@id='ccmd-appBar-membersExportsButton']//td[./text()='Exports']",
        "header_status": "xpath=//*[@id='content']//th[./text()='Status']",
        "header_id": "xpath=//*[@id='content']//th[./text()='ID']",
        "header_original_exported": "xpath=//*[@id='content']//th[./text()='Filename export']",
        "header_created_by": "xpath=//*[@id='content']//th[./text()='Created by']",
        "header_job_type": "xpath=//*[@id='content']//th[./text()='Job type']",
        "header_nb_members": "xpath=//*[@id='content']//th[./text()='Nb Members']",
        "header_scheduled_time": "xpath=//*[@id='content']//th[./text()='Scheduled time']",
        "header_start_time": "xpath=//*[@id='content']//th[./text()='Start Time']",
        "header_process_time": "xpath=//*[@id='content']//th[./text()='Process Time']"
    }
}

image_library = {
    "menu": "xpath=//*[@id='image-library']/div[./text()='Image Library']",
    "button_add": {
        "image_library": "xpath=//*[@id='appbar-archive-button']/span[./text()='Image Library']",
        "create_new_folder": "xpath=//*[@id='action-bar-create-folder']/span[./text()='Create new folder']",
        "select_all": "xpath=//*[@id='action-bar-select-all']/span[./text()='Select all']",
        "storage": "xpath=//*[@id='action-bar']//span[./text()='Storage:']",
        "add_button": "xpath=//*[@id='appbar-add-button']//span[./text()='Add']",
        "image_library_iframe": "id=ImageLibrary-IMAGES_THUMBNAIL_VIEW-frame",
        "browse_button": "xpath=//*[@id='imagelib-browse-label'][./text()='Browse']",
        "start_upload_button": "xpath=//*[@id='imagelib-submit-label'][./text()='Start upload']"
    }

}

deliverability = {
    "menu": "xpath=//*[@id='engage-deliverability']/div[./text()='Deliverability']"
}

email_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "//*[@id='engage-reports']//ul[@title='Email']/li"
    }
}

multivariate_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "xpath=//*[@id='engage-reports']//ul[@title='MultiVariate']/li"
    }
}

multimessage_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "xpath=//*[@id='engage-reports']//ul[@title='MultiMessage']/li"
    }
}

test_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "xpath=//*[@id='engage-reports']//ul[@title='Test']/li"
    }
}

transactional_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "xpath=//*[@id='engage-reports']//ul[@title='Transactional']/li"
    }
}

trigger_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "xpath=//*[@id='engage-reports']//ul[@title='Trigger']/li"
    }
}

landing_page_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "button_add": {
        "add": "xpath=//*[@id='engage-reports']//ul[@title='Landing page']/li"
    }
}

mobile_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "mobile": "xpath=//*[@id='engage-reports']//span[./text()='Mobile']",
    "button_add": {
        "add": "xpath=//*[@id='engage-reports']//ul[@title='SMS']/li",
        "sms_reports": "xpath=//span[./text()='SMS Reports']",
        "header_id": "xpath=//div[./text()='ID']",
        "header_campaign_name": "xpath=//div[./text()='Campaign name']",
        "header_status": "xpath=//div[./text()='Status']",
        "header_send_date": "xpath=//div[./text()='Send date']",
        "header_selected": "xpath=//div[./text()='Selected']",
        "header_sent": "xpath=//div[./text()='Sent']",
        "header_delivered": "xpath=//div[./text()='Delivered']",
        "header_undelivered": "xpath=//div[./text()='Undelivered']",
        "header_stops": "xpath=//div[./text()='Stops']"
    }
}

list_growth_reports = {
    "menu": "xpath=//*[@id='engage-reports']/div[./text()='Reports']",
    "list_growth": "xpath=//*[@id='engage-reports']//span[./text()='List Growth']",
    "button_add": {
        "add": "xpath=//*[@id='engage-reports']//ul[@title='List Growth']/li",
        "reports": "xpath=//*[@id='listReportUI-mainMenu-archiveButton']//span[./text()='Reports']",
        "header_report_name": "xpath=//div[./text()='Report Name']",
        "header_id": "xpath=//div[./text()='ID']",
        "header_status": "xpath=//div[./text()='Status']",
        "header_creation_date": "xpath=//div[./text()='Creation Date']",
        "header_created_by": "xpath=//div[./text()='Created by']"
    }
}

folders = {
    "menu": "xpath=//*[@id='engage-folders']/div[./text()='Folders']",
    "button_add": {
        "folders": "xpath=//*[@id='ccmd-appBar-foldersButton']//td[./text()='Folders']",
        "save": "xpath=//*[@id='iconSave']/../../a",
        "new_directory_name": "name=newDirectoryName",
        "new_directory_description": "name=newDirectoryDescription",
        "header_delete": "xpath=//*[@id='content']//span[@class='red' and ./text()='Delete']",
        "header_name": "xpath=//*[@id='content']//th[./text()='Name']",
        "header_description": "xpath=//*[@id='content']//th[./text()='Description']",
        "header_content_summary": "xpath=//*[@id='content']//th[./text()='Content Summary']",
        "delete": "xpath=//*[@id='iconTrash']/../../a"
    }

}

workflow = {
    "menu": "xpath=//*[@id='engage-workflow']/div[./text()='Workflow']",
    "workflow_management": "xpath=//*[@id='engage-workflow']//span[./text()='Workflow management']",
    "button_add": {
        "add": "xpath=//*[@id='engage-workflow']//ul[@title='Workflow']/li",
        "workflows": "xpath=//*[@id='ccmd-appBar-workflowsButton']//td[./text()='Workflows']",
        "header_name": "xpath=//*[@id='content']//th[./text()='Name']",
        "header_description": "xpath=//*[@id='content']//th[./text()='Description']",
        "header_status": "xpath=//*[@id='content']//th[./text()='Status']",
        "header_creation": "xpath=//*[@id='content']//th[./text()='Creation']",
        "header_update": "xpath=//*[@id='content']//th[./text()='Update']",
        "header_edit": "xpath=//*[@id='content']//th[./text()='Edit']",
        "header_delete": "xpath=//*[@id='content']//span[@class='red' and ./text()='Delete']",
        "delete": "xpath=//*[@id='iconTrash']/../../a"
    }
}

workflow_model = {
    "menu": "xpath=//*[@id='engage-workflow']/div[./text()='Workflow']",
    "workflow_management": "xpath=//*[@id='engage-workflow']//span[./text()='Workflow management']",
    "button_add": {
        "add": "xpath=//*[@id='engage-workflow']//ul[@title='Model']/li",
        "models": "xpath=//*[@id='ccmd-appBar-workflowModelsButton']//td[./text()='Models']",
        "header_model_name": "xpath=//*[@id='content']//th[./text()='Model Name']",
        "header_model_description": "xpath=//*[@id='content']//th[./text()='Model Description']",
        "header_created": "xpath=//*[@id='content']//th[./text()='Creation']",
        "header_view": "xpath=//*[@id='content']//th[./text()='View']",
        "header_delete": "xpath=//*[@id='content']//span[@class='red' and ./text()='Delete']",
        "delete": "xpath=//*[@id='iconTrash']/../../a"
    }
}

approval = {
    "menu": "xpath=//*[@id='engage-approval']/div[./text()='Approval']"
}

# test data
xss_entries = [
    """<a href=\"\\x0Bjavascript:javascript:alert(1)\" id=\"fuzzelement1\">test</a>"""
    """undefined''"""
]
