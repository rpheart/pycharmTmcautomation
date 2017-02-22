import os
import unittest
from random import randint

import requests

import advisor.is_direct_logic.utils as utils
import advisor.utils.api_calls as api
import advisor.utils.api_settings as settings
import advisor.utils.tcpdump as tcp

# Globals
unique_key = randint(1000, 10000)
email = "TC16_%s@advisortest.com" % unique_key
cookie_id = "1616161616_%s" % unique_key
sku = "009431"
filtered_response = []

# Build specific variables
if os.environ["BUILD_ENV"] == "QA":
    advisor = settings.qa_advisor
    renderer = settings.qa_renderer
    guid = settings.qa_guid
    aid = settings.qa_aid
    username = settings.qa_username
    password = settings.qa_password
    engagement = "12889"
    tcp_server = settings.qa_tcp_server
    tcp_username = settings.qa_tcp_username
    tcp_key = settings.qa_tcp_key
elif os.environ["BUILD_ENV"] == "PREPROD":
    advisor = settings.preprod_advisor
    renderer = settings.preprod_renderer
    guid = settings.preprod_guid
    aid = settings.preprod_aid
    username = settings.preprod_username
    password = settings.preprod_password
    engagement = "6766"
    tcp_server = settings.preprod_tcp_server
    tcp_username = settings.preprod_tcp_username
    tcp_key = settings.preprod_tcp_key
else:
    quit()

request_list = [
    api.offer_open(renderer, guid, engagement, cookie_id=cookie_id, email=email),
    api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
    api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
    api.buy(advisor, username, password, aid, sku, cookie_id=cookie_id)
]

for request in request_list:
    requests.get(request)

response = tcp.fetch_tcpdump(tcp_server, tcp_username, tcp_key)

for line in tcp.filter_tcpdump(response):
    if email in line or cookie_id in line:
        filtered_response.append(line)


class TestBuyEventsResponse(unittest.TestCase):
    def test_is_direct(self):
        global filtered_response
        self.assertEqual(utils.verify_is_direct(filtered_response), "isDirect=false",
                         msg='is direct logic should be false')

    def test_suggest_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[0]),
                        msg="suggest event is missing this campaign information")

    def test_offer_open_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[1]),
                        msg="offer open event is missing this campaign information")

    def test_browse_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[2]),
                        msg="browse event is missing this campaign information")

    def test_cart_add_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[3]),
                        msg="cart add event is missing this campaign information")

    def test_buy_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[4]),
                        msg="buy event is missing this campaign information")


if __name__ == '__main__':
    unittest.main()
