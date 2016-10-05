import unittest
from datetime import datetime, timedelta
from random import randint

import requests

import advisor.is_direct_logic.utils as utils
import advisor.utils.api_calls as api
import advisor.utils.api_qa_settings as settings
import advisor.utils.tcpdump as tcp

engagement = "12875"
unique_key = randint(1000, 10000)
email = "TC02_%s@advisortest.com" % unique_key
cookie_id = "22222_%s" % unique_key
sku = "009431"
filtered_response = []

# time stamp format "2016/09/07" // "YYYY/MM/DD"
timestamp_with_delta = datetime.now() - timedelta(1)  # deducts 1 day from timestamp
one_day_past = timestamp_with_delta.strftime("%Y-%m-%d")  # formats timestamp properly

request_list = [
    api.offer_open(settings.renderer, settings.guid, engagement, email=email, timestamp=one_day_past),
    api.login(settings.advisor, settings.username, settings.password, settings.aid, cookie_id=cookie_id, email=email),
    api.browse(settings.advisor, settings.username, settings.password, settings.aid, sku, cookie_id=cookie_id),
    api.cart_add(settings.advisor, settings.username, settings.password, settings.aid, sku, cookie_id=cookie_id),
    api.buy(settings.advisor, settings.username, settings.password, settings.aid, sku, cookie_id=cookie_id)
]

for request in request_list:
    requests.get(request)

response = tcp.fetch_tcpdump(settings.tcp_server, settings.tcp_username, settings.tcp_key)

for line in tcp.filter_tcpdump(response):
    if email in line or cookie_id in line:
        filtered_response.append(line)


class TestBuyEventsResponse(unittest.TestCase):
    def test_is_direct(self):
        global filtered_response
        self.assertEqual(utils.verify_is_direct(filtered_response), "isDirect=false")

    def test_suggest_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[0]))

    def test_offer_open_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[1]))

    def test_browse_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[2]))

    def test_login_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[3]))

    def test_cart_add_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[4]))

    def test_buy_contains_all_event_information(self):
        global filtered_response
        self.assertTrue(utils.verify_json_contains_events(filtered_response[5]))

if __name__ == '__main__':
    unittest.main()
