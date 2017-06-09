import os
import unittest
from datetime import timedelta, datetime
from random import randint

import requests

import advisor.is_direct_logic.utils as utils
import advisor.utils.api_calls as api
import advisor.utils.env_config as settings
import advisor.utils.tcpdump as tcp

# Globals
unique_key = randint(1000, 10000)
email = "TC14_%s@advisortest.com" % unique_key
cookie_id = "1414141414_%s" % unique_key
sku = "009431"
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
    engagement = ""
elif env == "PREPROD":
    engagement = ""


def send_requests():
    # time stamp format "2016/09/07" || "YYYY/MM/DD"
    timestamp_with_delta = datetime.now() - timedelta(3)  # deducts 3 days from timestamp
    timestamp3 = timestamp_with_delta.strftime("%Y-%m-%d")  # formats timestamp properly

    request_list = [
        api.offer_open(renderer, guid, engagement, email=email, timestamp=timestamp3),
        api.login(advisor, username, password, aid, cookie_id=cookie_id, email=email),
        api.browse(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.cart_add(advisor, username, password, aid, sku, cookie_id=cookie_id),
        api.buy(advisor, username, password, aid, sku, cookie_id=cookie_id)
    ]

    for request in request_list:
        requests.get(request)


@unittest.skip("timestamps aren't supported on personalisation content")
class TestOldOfferOpenAndNoOfferClick(unittest.TestCase):
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

    def test_suggest_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[0]),
                        msg="suggest event is missing this campaign information")

    def test_offer_open_contains_all_event_information(self):
        self.assertTrue(utils.verify_json_contains_events(filtered_response[1]),
                        msg="offer open event is missing this campaign information")

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
