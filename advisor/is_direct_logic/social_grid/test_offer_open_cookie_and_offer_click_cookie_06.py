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
email = "TC06_%s@advisortest.com" % unique_key
cookie_id = "66666_%s" % unique_key
sku = "123"
filtered_response = []

# environment variables
env = os.environ["BUILD_ENV"]
advisor = settings.api_settings[env]["advisor"]
renderer = settings.api_settings[env]["renderer"]
click = settings.api_settings[env]["clickback"]
guid = settings.client_settings[env]["guid"]
aid = settings.client_settings[env]["aid"]
username = settings.client_settings[env]["username"]
password = settings.client_settings[env]["password"]
tcp_username = settings.kafka_settings[env]["tcp_username"]
tcp_server = settings.kafka_settings[env]["tcp_server"]
tcp_key = settings.kafka_settings[env]["tcp_key"]
if env == "QA":
    engagement = "13170"
elif env == "PREPROD":
    engagement = "6869"


def send_requests():
    request_list = [
        api.offer_open(renderer, guid, engagement, cookie_id=cookie_id),
        api.offer_click(click, guid, engagement, cookie_id=cookie_id, position=""),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.buy(advisor, username, password, aid, sku, cookie_id=cookie_id)
    ]

    for request in request_list:
        requests.get(request).raise_for_status()


class TestOfferOpenCookieAndOfferClickCookie(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        send_requests()
        response = tcp.fetch_tcpdump(tcp_server, tcp_username, tcp_key)
        for line in tcp.filter_tcpdump(response):
            if str(unique_key) in line:
                filtered_response.append(line)

    def test_is_direct_is_true(self):
        self.assertTrue(utils.verify_is_direct(filtered_response),
                        msg="is direct logic should be true but is: %s" % str(
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
