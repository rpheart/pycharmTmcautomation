from msvcrt import getch
from random import randint
import requests

advisor = "preprod-eu1-api-ext-lb-580332958.eu-west-1.elb.amazonaws.com"
renderer = "preprod-eu1-p3-renderer.advisor.smartfocus.com"
click = "preprod-eu1-p3-api-public.advisor.smartfocus.com"
guid = "f04323d7-4224-41b9-8906-17327182c866"
aid = "50004"
username = "u50004Z1EmS9rs"
password = "gHHaHrUYo9SgXuzq"
engagement = "6759"
unique_key = randint(1000, 10000)
email = "TC09_%s@advisortest.com" % unique_key
cookie_id = "99999_%s" % unique_key
cbtt = None

offer_open1 = "http://%s/api-public/3.0/personaliseemail?a=%s&ue=%s&e=%s&f=png&l=en&h=500&w=500&pos=1" % (
    renderer, guid, email, engagement)
offer_open2 = "http://%s/api-public/3.0/personaliseemail?a=%s&ue=%s&e=%s&f=png&l=en&h=500&w=500&pos=2" % (
    renderer, guid, email, engagement)
offer_open3 = "http://%s/api-public/3.0/personaliseemail?a=%s&ue=%s&e=%s&f=png&l=en&h=500&w=500&pos=3" % (
    renderer, guid, email, engagement)
offer_open4 = "http://%s/api-public/3.0/personaliseemail?a=%s&ue=%s&e=%s&f=png&l=en&h=500&w=500&pos=4" % (
    renderer, guid, email, engagement)
offer_click = "http://%s/api-public/3.0/click/4?a=%s&e=%s&ue=%s&l=en&pos=4" % (
    click, guid, engagement, email)
cart_add = "http://%s/ips/cred/%s/%s/3.0/notify/%s/cart-add?cookieid=%s&data=123" % (
    advisor, username, password, aid, cookie_id)
buy = "http://%s/ips/cred/%s/%s/3.0/notify/%s/buy?cookieid=%s&data=009431&eventamnt=10&eventamntcurr=GBP" % (
    advisor, username, password, aid, cookie_id)


request_list = [offer_open1, offer_open2, offer_open3, offer_open4, offer_click]

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

browse_cbtt = "http://%s/ips/cred/%s/%s/3.0/notify/%s/browse?cookieid=%s&cbtt=%s&data=009431" % (
    advisor, username, password, aid, cookie_id, cbtt)

request_list = [browse_cbtt, cart_add, buy]

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
