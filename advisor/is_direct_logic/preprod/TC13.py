from msvcrt import getch
from random import randint
import requests
from datetime import timedelta, datetime

advisor = "preprod-eu1-api-ext-lb-580332958.eu-west-1.elb.amazonaws.com"
renderer = "preprod-eu1-p3-renderer.advisor.smartfocus.com"
click = "preprod-eu1-p3-api-public.advisor.smartfocus.com"
guid = "f04323d7-4224-41b9-8906-17327182c866"
aid = "50004"
username = "u50004Z1EmS9rs"
password = "gHHaHrUYo9SgXuzq"
engagement = "6763"
unique_key = randint(1000, 10000)
email = "TC13_%s@advisortest.com" % unique_key
cookie_id = "1313131313_%s" % unique_key
cbtt = None

# time stamp format "2016/09/07" // "YYYY/MM/DD"
timestamp_with_delta = datetime.now() - timedelta(1)  # deducts 1 day from timestamp
timestamp1 = timestamp_with_delta.strftime("%Y-%m-%d")  # formats timestamp properly

timestamp_with_delta = datetime.now() - timedelta(3)  # deducts 3 days from timestamp
timestamp3 = timestamp_with_delta.strftime("%Y-%m-%d")  # formats timestamp properly

offer_open = "http://%s/api-public/3.0/personaliseemail?a=%s&ue=%s&e=%s&f=png&l=en&h=500&w=500&pos=default&tstamp=%s" % (
    renderer, guid, email, engagement, timestamp3)
offer_click = "http://%s/api-public/3.0/click/4?a=%s&e=%s&ue=%s&l=en&pos=default&tstamp=%s" % (
    click, guid, engagement, email, timestamp1)
login = "http://%s/ips/cred/%s/%s/3.0/notify/%s/login?cookieid=%s&email=%s" % (
    advisor, username, password, aid, cookie_id, email)
browse = "http://%s/ips/cred/%s/%s/3.0/notify/%s/browse?cookieid=%s&data=009431" % (
    advisor, username, password, aid, cookie_id)
cart_add = "http://%s/ips/cred/%s/%s/3.0/notify/%s/cart-add?cookieid=%s&data=123" % (
    advisor, username, password, aid, cookie_id)
buy = "http://%s/ips/cred/%s/%s/3.0/notify/%s/buy?cookieid=%s&data=009431&eventamnt=10&eventamntcurr=GBP" % (
    advisor, username, password, aid, cookie_id)

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

request_list = [login, browse_cbtt, browse, cart_add, buy]

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
