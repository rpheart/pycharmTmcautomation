from datetime import datetime, timedelta
from msvcrt import getch
from random import randint

import requests

advisor = "qa-eu1-advisor1-v3.advisor.smartfocus.com"
renderer = "qa-eu1-p3-renderer.advisor.smartfocus.com"
click = "qa-eu1-p3-api-public.advisor.smartfocus.com"
guid = "e44f26b0-12c7-4c29-aabf-9d11197c9c02"
aid = "20003"
username = "qaTest1"
password = "testPass1"
engagement = "12876"
unique_key = randint(1000, 10000)
email = "TC03_%s@advisortest.com" % unique_key
cookie_id = "33333_%s" % unique_key
cookie_id_new = "333332_%s" % unique_key
cbtt = None

# time stamp format "2016/09/07" // "YYYY/MM/DD"
timestamp_with_delta = datetime.now() - timedelta(1)  # deducts 1 day from timestamp
timestamp1 = timestamp_with_delta.strftime("%Y-%m-%d")  # formats timestamp properly

offer_open = "http://%s/api-public/3.0/personaliseemail?a=%s&ue=%s&e=%s&f=png&l=en&h=500&w=500&pos=default&tstamp=%s" % (
    renderer, guid, email, engagement, timestamp1)
offer_click = "http://%s/api-public/3.0/click/4?a=%s&e=%s&ue=%s&l=en&pos=default&tstamp=%s" % (
    click, guid, engagement, email, timestamp1)
login = "http://%s/ips/cred/%s/%s/3.0/notify/%s/login?cookieid=%s&email=%s" % (
    advisor, username, password, aid, cookie_id_new, email)
browse_new_cookie = "http://%s/ips/cred/%s/%s/3.0/notify/%s/browse?cookieid=%s&data=009431" % (
    advisor, username, password, aid, cookie_id_new)
cart_add = "http://%s/ips/cred/%s/%s/3.0/notify/%s/cart-add?cookieid=%s&data=123" % (
    advisor, username, password, aid, cookie_id_new)
buy = "http://%s/ips/cred/%s/%s/3.0/notify/%s/buy?cookieid=%s&data=009431&eventamnt=10&eventamntcurr=GBP" % (
    advisor, username, password, aid, cookie_id_new)

request_list = [offer_open, offer_click]

for request in request_list:
    print "sending %s" % request
    response = requests.get(request)
    if response.status_code == requests.codes.ok:
        print "Send OK"
        if 'cbtt=' in response.url:
            nonsense, cbtt = response.url.split('cbtt=')
    else:
        print "Send Failed"
        print "Terminating test"
        break

browse_cbtt = "http://%s/ips/cred/%s/%s/3.0/notify/%s/browse?cookieid=%s&cbtt=%s&data=009431&tstamp=%s" % (
    advisor, username, password, aid, cookie_id, cbtt, timestamp1)

request_list = [login, browse_cbtt, browse_new_cookie, cart_add, buy]

for request in request_list:
    print "sending %s" % request
    response = requests.get(request)
    if response.status_code == requests.codes.ok:
        print "Send OK"
    else:
        print "Send Failed"
        print "Terminating test"
        break

print "Complete"

print "Press any key to continue"
pause = getch()
