import Tkinter
import os
from msvcrt import getch
from random import randint

import requests

import advisor.is_direct_logic.utils as utils
import advisor.utils.api_calls as api
import advisor.utils.api_settings as settings
import advisor.utils.tcpdump as tcp

# Globals
unique_key = randint(1000, 10000)
email = "TC09_%s@advisortest.com" % unique_key
cookie_id = "99999_%s" % unique_key
cbtt = None
sku = "123"
filtered_response = []
root = Tkinter.Tk()

# Build Specific Variables
if os.environ["BUILD_ENV"] == "QA":
    advisor = settings.api_settings["QA"]["advisor"]
    click = settings.api_settings["QA"]["click_advisor"]
    renderer = settings.api_settings["QA"]["renderer"]
    guid = settings.client_settings["QA"]["SIDEV01"]["guid"]
    aid = settings.client_settings["QA"]["SIDEV01"]["aid"]
    username = settings.client_settings["QA"]["SIDEV01"]["username"]
    password = settings.client_settings["QA"]["SIDEV01"]["password"]
    engagement = "12882"
    tcp_username = settings.kafka_settings["QA"]["tcp_username"]
    tcp_server = settings.kafka_settings["QA"]["tcp_server"]
elif os.environ["BUILD_ENV"] == "PREPROD":
    advisor = settings.api_settings["PREPROD"]["advisor"]
    click = settings.api_settings["PREPROD"]["click_advisor"]
    renderer = settings.api_settings["PREPROD"]["renderer"]
    guid = settings.client_settings["PREPROD"]["PREPRODTMC"]["guid"]
    aid = settings.client_settings["PREPROD"]["PREPRODTMC"]["aid"]
    username = settings.client_settings["PREPROD"]["PREPRODTMC"]["username"]
    password = settings.client_settings["PREPROD"]["PREPRODTMC"]["password"]
    engagement = "6759"
    tcp_username = settings.kafka_settings["PREPROD"]["tcp_username"]
    tcp_server = settings.kafka_settings["PREPROD"]["tcp_server"]
else:
    print "No environment settings found, please check your environment variables", getch()
    quit()

print "Please login into %s and start the tcpdump, then press any key to continue:" % tcp_server, "\n", getch()

request_list = [
    api.offer_open(renderer, guid, engagement, email=email, position=1),
    api.offer_open(renderer, guid, engagement, email=email, position=2),
    api.offer_open(renderer, guid, engagement, email=email, position=3),
    api.offer_open(renderer, guid, engagement, email=email, position=4),
    api.offer_click(click, guid, engagement, email=email),
]

for request in request_list:
    print "sending %s" % request
    response = requests.get(request)
    if response.status_code == requests.codes.ok:
        print "Sent"
        if 'cbtt=' in response.url:
            nonsense, cbtt = response.url.split('cbtt=')
            print "found cbtt"
    else:
        print "Send Failed"
        print "Terminating test, press any key to continue", getch()
        quit()

request_list_cbtt = [
    api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id, cbtt=cbtt),
    api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
    api.buy(advisor, username, password, aid, sku, cookie_id=cookie_id)
]

for request in request_list_cbtt:
    print "sending %s" % request
    response = requests.get(request)
    if response.status_code == requests.codes.ok:
        print "Sent"
    else:
        print "Send Failed"
        print "Terminating test, press any key to continue", getch()
        quit()

print "Send complete", "\n"
print "Please copy the response from Kafka to your clipboard and press any key for me to read it", "\n", getch()

while True:
    kafka_ouput = root.clipboard_get()
    if not kafka_ouput:
        print "was not able to read clipboard, please copy text again and press any key", getch()
        continue
    else:
        break

for line in tcp.filter_tcpdump(kafka_ouput):
    if str(unique_key) in line:
        filtered_response.append(line)

if utils.verify_is_direct(filtered_response) == "isDirect=true":
    print "Success!", utils.verify_is_direct(filtered_response), "\n"
else:
    print "isDirect should be 'true', instead found '%s'" % utils.verify_is_direct(filtered_response), "\n"

for line in filtered_response:
    if utils.verify_json_contains_events(line):
        print "Correct info found in:", line, "\n"
    else:
        print utils.verify_json_contains_events(line), line, "\n"

print "Press any key to continue", getch()
