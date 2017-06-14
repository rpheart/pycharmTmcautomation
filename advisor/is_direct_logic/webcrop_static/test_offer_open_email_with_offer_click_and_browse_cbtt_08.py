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
email = "TC08_%s@advisortest.com" % unique_key
cookie_id = "88888_%s" % unique_key
cbtt = None
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
    engagement = "6910"
    lid = "5e58c980-c086-46ee-8a71-026ced096fd5"
    idx = "0"


def send_requests():
    request_list = [
        api.offer_open(renderer, guid, engagement, email=email),
        api.offer_click(click, guid, engagement, email=email, lid=lid, idx=idx, position="")
    ]

    for request in request_list:
        response = requests.get(request)
        if not response.raise_for_status():
            if "cbtt=" in response.url:
                nonsense, cbtt = response.url.split("cbtt=")

    request_list_cbtt = [
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id, cbtt=cbtt),
        api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.buy(advisor, username, password, aid, sku, cookie_id=cookie_id)
    ]

    for request in request_list_cbtt:
        requests.get(request).raise_for_status()


class TestOfferOpenEmailWithOfferClickAndBrowseCbtt(unittest.TestCase):
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

    def test_cart_add_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[3]),
                        msg="cart add event is missing this campaign information")

    def test_buy_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[4]),
                        msg="buy event is missing this campaign information")


if __name__ == "__main__":
    unittest.main()
