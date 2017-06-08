def offer_open(renderer_url, guid, engagement_id, email="", cookie_id="", format="png", height="500", width="500",
               cache_timeout="0", position="default", timestamp=""):
    if email:
        email = "&ue=" + email
    if cookie_id:
        cookie_id = "&uc=" + cookie_id
    if timestamp:
        timestamp = "&tstamp=" + timestamp

    url = "http://%s/api-public/3.0/personaliseemail?a=%s%s%s&e=%s&f=%s&l=en&h=%s&w=%s&cacheTimeout=%s&pos=%s%s" % (
        renderer_url, guid, email, cookie_id, engagement_id, format, height, width, cache_timeout, str(position),
        timestamp)
    return url


def offer_click(click_url, guid, engagement_id, email="", cookie_id="", language="", cache_timeout=0,
                position="default", lid="", idx="", timestamp=""):
    if email:
        email = "&ue=" + email
    if cookie_id:
        cookie_id = "&uc=" + cookie_id
    if lid:
        lid = "&lid=" + str(lid)
    if idx:
        idx = "&idx=" + str(idx)
    if language:
        language = "&l=" + language
    if timestamp:
        timestamp = "&tstamp=" + timestamp

    url = "http://%sa=%s&e=%s%s%s%s&cacheTimeout=%d&pos=%s%s%s%s" % (
        click_url, guid, engagement_id, email, cookie_id, language, cache_timeout, str(position), lid, idx, timestamp)
    return url


def login(advisor_url, username, password, aid, cookie_id="", email=""):
    if cookie_id:
        cookie_id = "cookieid=" + cookie_id
        if email:
            email = "&email=" + email
    elif email:
        email = "email=" + email

    url = "http://%s/ips/cred/%s/%s/3.0/notify/%s/login?%s%s" % (
        advisor_url, username, password, aid, cookie_id, email)
    return url


def browse(advisor_url, username, password, aid, sku, cookie_id="", cbtt="", timestamp=""):
    sku = "&data=" + sku
    if cookie_id:
        cookie_id = "cookieid=" + cookie_id
    if cbtt:
        cbtt = "&cbtt=" + cbtt
    if timestamp:
        timestamp = "&tstamp=" + timestamp

    url = "http://%s/ips/cred/%s/%s/3.0/notify/%s/browse?%s%s%s%s" % (
        advisor_url, username, password, aid, cookie_id, cbtt, sku, timestamp)
    return url


def cart_add(advisor_url, username, password, aid, sku, cookie_id=""):
    sku = "&data=" + sku
    if cookie_id:
        cookie_id = "cookieid=" + cookie_id

    url = "http://%s/ips/cred/%s/%s/3.0/notify/%s/cart-add?%s%s" % (
        advisor_url, username, password, aid, cookie_id, sku)
    return url


def buy(advisor_url, username, password, aid, sku, cookie_id=""):
    sku = "&data=" + sku
    if cookie_id:
        cookie_id = "cookieid=" + cookie_id

    url = "http://%s/ips/cred/%s/%s/3.0/notify/%s/buy?%s%s&eventamnt=10&eventamntcurr=GBP" % (
        advisor_url, username, password, aid, cookie_id, sku)
    return url
