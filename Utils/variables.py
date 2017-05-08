# coding=utf-8
# login page
login = {
    "username": "//*[@id='IDToken1']",
    "password": "//*[@id='IDToken2']",
    "login_button": "//*[@id='loginButton']",
    "forgot_password_link": "//a[contains(text(), 'Forgot your password?')]"
}

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
