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
email = "TC01_%s@advisortest.com" % unique_key
cookie_id = "11111_%s" % unique_key
sku = "123"
filtered_response = []
root = Tkinter.Tk().withdraw()

# Build Specific Variables
if os.environ["BUILD_ENV"] == "QA":
    advisor = settings.api_settings["QA"]["advisor"]
    renderer = settings.api_settings["QA"]["renderer"]
    guid = settings.client_settings["QA"]["SIDEV01"]["guid"]
    aid = settings.client_settings["QA"]["SIDEV01"]["aid"]
    username = settings.client_settings["QA"]["SIDEV01"]["username"]
    password = settings.client_settings["QA"]["SIDEV01"]["password"]
    engagement = "12874"
    tcp_username = settings.kafka_settings["QA"]["tcp_username"]
    tcp_server = settings.kafka_settings["QA"]["tcp_server"]
elif os.environ["BUILD_ENV"] == "PREPROD":
    advisor = settings.api_settings["PREPROD"]["advisor"]
    renderer = settings.api_settings["PREPROD"]["renderer"]
    guid = settings.client_settings["PREPROD"]["PREPRODTMC"]["guid"]
    aid = settings.client_settings["PREPROD"]["PREPRODTMC"]["aid"]
    username = settings.client_settings["PREPROD"]["PREPRODTMC"]["username"]
    password = settings.client_settings["PREPROD"]["PREPRODTMC"]["password"]
    engagement = "6751"
    tcp_username = settings.kafka_settings["PREPROD"]["tcp_username"]
    tcp_server = settings.kafka_settings["PREPROD"]["tcp_server"]
else:
    quit()

print "Please login into %s@%s and start the tcpdump, then press any key to continue:" % (tcp_username, tcp_server)
pause = getch()

request_list = [
    api.offer_open(renderer, guid, engagement, email=email),
    api.login(advisor, username, password, aid, cookie_id=cookie_id, email=email),
    api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
    api.buy(advisor, username, password, aid, sku, cookie_id=cookie_id)
]

for request in request_list:
    print "sending %s" % request
    response = requests.get(request)
    if response.status_code == requests.codes.ok:
        print "Send OK"
    else:
        print "Send Failed"
        print "Terminating test"
        quit()

print "Complete"

print "Please copy the response from Kafka to your clipboard and press any key for me to read it"
print ""
pause = getch()
while True:
    kafka_ouput = root.clipboard_get()
    if not kafka_ouput:
        print "was not able to read clipboard, please copy text again and press any key"
        pause = getch()
        continue
    else:
        break

for line in tcp.filter_tcpdump(kafka_ouput):
    if email in line or cookie_id in line:
        filtered_response.append(line)

if utils.verify_is_direct(filtered_response) == "isDirect=false":
    print "isDirect=false"
else:
    print "isDirect should be 'false', instead found '%s'" % utils.verify_is_direct(filtered_response)

for line in filtered_response:
    if utils.verify_json_contains_events(line):
        print "Correct info found in", line
    else:
        print utils.verify_json_contains_events(line), line

print ""
print "Press any key to continue"
pause = getch()
