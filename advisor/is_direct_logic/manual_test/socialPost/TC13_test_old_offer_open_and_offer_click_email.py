import Tkinter
import os
from datetime import timedelta, datetime
from msvcrt import getch
from random import randint

import requests

import Advisor.is_direct_logic.utils as utils
import Advisor.utils.api_calls as api
import Advisor.utils.api_settings as settings
import Advisor.utils.tcpdump as tcp

# Globals
unique_key = randint(1000, 10000)
email = "TC13_%s@advisortest.com" % unique_key
cookie_id = "1313131313_%s" % unique_key
cbtt = None
sku = "123"
filtered_response = []
root = Tkinter.Tk()

# Build Specific Variables
if os.environ["BUILD_ENV"] == "QA":
    advisor = settings.api_settings["QA"]["Advisor"]
    click = settings.api_settings["QA"]["click_advisor"]
    renderer = settings.api_settings["QA"]["renderer"]
    guid = settings.client_settings["QA"]["SIDEV01"]["guid"]
    aid = settings.client_settings["QA"]["SIDEV01"]["aid"]
    username = settings.client_settings["QA"]["SIDEV01"]["username"]
    password = settings.client_settings["QA"]["SIDEV01"]["password"]
    engagement = ""
    tcp_username = settings.kafka_settings["QA"]["tcp_username"]
    tcp_server = settings.kafka_settings["QA"]["tcp_server"]
elif os.environ["BUILD_ENV"] == "PREPROD":
    advisor = settings.api_settings["PREPROD"]["Advisor"]
    click = settings.api_settings["PREPROD"]["click_advisor"]
    renderer = settings.api_settings["PREPROD"]["renderer"]
    guid = settings.client_settings["PREPROD"]["PREPRODTMC"]["guid"]
    aid = settings.client_settings["PREPROD"]["PREPRODTMC"]["aid"]
    username = settings.client_settings["PREPROD"]["PREPRODTMC"]["username"]
    password = settings.client_settings["PREPROD"]["PREPRODTMC"]["password"]
    engagement = "6933"
    tcp_username = settings.kafka_settings["PREPROD"]["tcp_username"]
    tcp_server = settings.kafka_settings["PREPROD"]["tcp_server"]
else:
    print "No environment settings found, please check your environment variables", getch()
    quit()

print "Please login into %s and start the tcpdump, then press any key to continue:" % tcp_server, "\n", getch()

# time stamp format "2016/09/07" // "YYYY/MM/DD"
timestamp_with_delta = datetime.now() - timedelta(1)  # deducts 1 day from timestamp
one_day_past = timestamp_with_delta.strftime("%Y-%m-%d")  # formats timestamp properly

timestamp_with_delta = datetime.now() - timedelta(3)  # deducts 3 days from timestamp
three_days_past = timestamp_with_delta.strftime("%Y-%m-%d")  # formats timestamp properly

request_list = [
    api.offer_open(renderer, guid, engagement, email=email, timestamp=three_days_past),
    api.offer_click(click, guid, engagement, email=email, timestamp=one_day_past)
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
    api.login(advisor, username, password, aid, cookie_id=cookie_id, email=email),
    api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id, cbtt=cbtt, timestamp=one_day_past),
    api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
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
