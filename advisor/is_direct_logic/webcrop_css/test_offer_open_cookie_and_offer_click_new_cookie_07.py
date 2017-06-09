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
email = "TC07_%s@advisortest.com" % unique_key
cookie_id = "77777_%s" % unique_key
cookie_id_new = "777772_%s" % unique_key
sku = "123"
filtered_response = []

# environment variables
env = os.environ["BUILD_ENV"]
advisor = settings.api_settings[env]["advisor"]
renderer = settings.api_settings[env]["renderer"]
click = settings.api_settings[env]["click_personaliser"]
guid = settings.client_settings[env]["guid"]
aid = settings.client_settings[env]["aid"]
username = settings.client_settings[env]["username"]
password = settings.client_settings[env]["password"]
tcp_username = settings.kafka_settings[env]["tcp_username"]
tcp_server = settings.kafka_settings[env]["tcp_server"]
tcp_key = settings.kafka_settings[env]["tcp_key"]
if env == "QA":
    engagement = ""
    lid = ""
    idx = ""
elif env == "PREPROD":
    engagement = "6892"
    lid = "5e58c980-c086-46ee-8a71-026ced096fd5"
    idx = "0"


def send_requests():
    request_list = [
        api.offer_open(renderer, guid, engagement, cookie_id=cookie_id),
        api.offer_click(click, guid, engagement, cookie_id=cookie_id, lid=lid, idx=idx, position=""),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id_new),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id_new),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id_new),
        api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id_new),
        api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id_new),
        api.buy(advisor, username, password, aid, sku, cookie_id=cookie_id_new)
    ]

    for request in request_list:
        requests.get(request)


class TestOfferOpenCookieAndOfferClickNewCookie(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        send_requests()
        response = tcp.fetch_tcpdump(tcp_server, tcp_username, tcp_key)
        for line in tcp.filter_tcpdump(response):
            if str(unique_key) in line:
                filtered_response.append(line)

    def test_is_direct_is_null(self):
        self.assertIsNone(utils.verify_is_direct(filtered_response),
                          msg="is direct logic should be null but is: %s" % str(
                              utils.verify_is_direct(filtered_response)))

    def test_offer_open_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[0]),
                        msg="offer open event is missing this campaign information")

    def test_offer_click_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[1]),
                        msg="offer click event is missing this campaign information")

    def test_browse_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[2]),
                        msg="browse event is missing this campaign information")

    def test_browse_2_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[3]),
                        msg="browse 2 event is missing this campaign information")

    def test_browse_3_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[4]),
                        msg="browse 3 event is missing this campaign information")

    def test_cart_add_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[5]),
                        msg="cart add event is missing this campaign information")

    def test_cart_add_2_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[6]),
                        msg="cart add 2 event is missing this campaign information")

    def test_buy_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[7]),
                        msg="buy event is missing this campaign information")


if __name__ == "__main__":
    unittest.main()
