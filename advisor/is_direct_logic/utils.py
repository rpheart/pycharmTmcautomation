evtype_list = ['"evtype":"suggest"', '"evtype":"offer-open"', '"evtype":"offer-click"', '"evtype":"login"',
               '"evtype":"browse"', '"evtype":"cart-add"', '"evtype":"buy"', '"evtype":"social-click"']
suggest_list = ["variantName", "campaignName", "accountName", "engagementName", "messageName", "aguid", "sitekey",
                "evtype", "campid", "engid", "messid", "varid", "quan", "val"]
offer_open_list = ["variantName", "campaignName", "accountName", "engagementName", "messageName", "aguid", "sitekey",
                   "evtype", "campid", "engid", "messid", "varid", "quan", "val"]
offer_click_list = ["variantName", "campaignName", "accountName", "engagementName", "messageName", "aguid", "sitekey",
                    "evtype", "campid", "engid", "messid", "varid", "citem", "ctype", "quan", "val"]
login_list = ["accountName", "aguid", "sitekey", "evtype", "quan", "val"]
browse_list = ["variantName", "campaignName", "accountName", "engagementName", "messageName", "aguid", "sitekey",
               "evtype", "campid", "engid", "messid", "varid", "citem", "ctype", "quan", "val"]
cart_add_list = ["variantName", "campaignName", "accountName", "engagementName", "messageName", "aguid", "sitekey",
                 "evtype", "campid", "engid", "messid", "varid", "citem", "ctype", "quan", "val", "cur"]
buy_list = ["variantName", "campaignName", "accountName", "engagementName", "messageName", "aguid", "sitekey",
            "evtype", "campid", "engid", "messid", "varid", "citem", "ctype", "quan", "val", "cur", "isDirect"]


def choose_event_list(json_response):
    if "suggest" in json_response:
        return suggest_list
    elif "offer-open" in json_response:
        return offer_open_list
    elif "offer-click" in json_response or "social-click" in json_response:
        return offer_click_list
    elif "login" in json_response:
        return login_list
    elif "browse" in json_response:
        return browse_list
    elif "cart-add" in json_response:
        return cart_add_list
    elif "buy" in json_response:
        return buy_list


def choose_event_type(json_response):
    for event_type in evtype_list:
        if event_type in json_response:
            return event_type


def verify_json_contains_events(tcpdump_data):
    for content in choose_event_list(tcpdump_data):
        if content not in tcpdump_data:
            return "%s is missing" % content

    return True


def verify_is_direct(tcpdump_data):
    for line in tcpdump_data:
        if '"evtype":"buy"' in line:
            if '"isDirect":true' in line:
                return True
            elif '"isDirect":false' in line:
                return False
            else:
                return None
