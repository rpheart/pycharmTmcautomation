from msvcrt import getch
from random import randint

import requests

# url settings
advisor = "qa-eu1-advisor1-v3.advisor.smartfocus.com"
renderer = "qa-eu1-p3-renderer.advisor.smartfocus.com"
click = "qa-eu1-p3-api-public.advisor.smartfocus.com"
guid = "e44f26b0-12c7-4c29-aabf-9d11197c9c02"
aid = "20003"
username = "qaTest1"
password = "testPass1"
engagement = "12874"
unique_key = randint(1000, 10000)
email = "TC01_%s@advisortest.com" % unique_key
cookie_id = "11111_%s" % unique_key
sku = "123"
filtered_response = []

# api settings
offer_open = "http://%s/api-public/3.0/personaliseemail?a=%s&ue=%s&e=%s&f=png&l=en&h=500&w=500&pos=default" % (
    renderer, guid, email, engagement)
login = "http://%s/ips/cred/%s/%s/3.0/notify/%s/login?cookieid=%s&email=%s" % (
    advisor, username, password, aid, cookie_id, email)
cart_add = "http://%s/ips/cred/%s/%s/3.0/notify/%s/cart-add?cookieid=%s&data=123" % (
    advisor, username, password, aid, cookie_id)
buy = "http://%s/ips/cred/%s/%s/3.0/notify/%s/buy?cookieid=%s&data=009431&eventamnt=10&eventamntcurr=GBP" % (
    advisor, username, password, aid, cookie_id)

request_list = [offer_open, login, cart_add, buy]

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
