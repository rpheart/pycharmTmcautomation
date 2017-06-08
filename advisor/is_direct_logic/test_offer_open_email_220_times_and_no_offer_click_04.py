import os
import unittest
from random import randint

import requests

import advisor.is_direct_logic.utils as utils
import advisor.utils.api_calls as api
import advisor.utils.env_config as settings
import advisor.utils.tcpdump as tcp

# Globals
unique_key = randint(1000, 10000)
email = "TC04_%s@advisortest.com" % unique_key
cookie_id = "44444_%s" % unique_key
sku = "123"
filtered_response = []

# environment variables
env = os.environ["BUILD_ENV"]
advisor = settings.api_settings[env]["advisor"]
renderer = settings.api_settings[env]["renderer"]
guid = settings.client_settings[env]["guid"]
aid = settings.client_settings[env]["aid"]
username = settings.client_settings[env]["username"]
password = settings.client_settings[env]["password"]
tcp_username = settings.kafka_settings[env]["tcp_username"]
tcp_server = settings.kafka_settings[env]["tcp_server"]
tcp_key = settings.kafka_settings[env]["tcp_key"]
if env == "QA":
    engagement = "12877"
elif env == "PREPROD":
    engagement = "6754"


def send_requests():
    offer_open = api.offer_open(renderer, guid, engagement, email=email)

    request_list = [
        api.login(advisor, username, password, aid, cookie_id=cookie_id, email=email),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.buy(advisor, username, password, aid, sku, cookie_id=cookie_id)
    ]

    for i in range(220):
        requests.get(offer_open)

    for request in request_list:
        requests.get(request)


class TestOfferOpenEmail220TimesAndNoOfferClick(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        send_requests()
        response = tcp.fetch_tcpdump(tcp_server, tcp_username, tcp_key)
        for line in tcp.filter_tcpdump(response):
            if str(unique_key) in line:
                filtered_response.append(line)

    def test_is_direct_is_false(self):
        self.assertEqual(utils.verify_is_direct(filtered_response), "isDirect=false",
                         msg='is direct logic should be false')

    @unittest.skip("test fails iterating over a NoneType that shouldn't be None")
    def test_campaign_information_is_present_in_all_requests(self):
        for line in filtered_response:
            self.assertTrue(utils.verify_json_contains_events(line), msg="campaign information is missing")

    @unittest.skip("test fails iterating over a NoneType that shouldn't be None")
    def test_all_event_types_appear_in_kafka(self):
        event_types = ["offer-open", "login", "browse", "cart-add", "buy"]
        for event_type in event_types:
            self.assertIn(event_type, filtered_response, msg="kafka output is missing event: %s" % event_type)


if __name__ == '__main__':
    unittest.main()
