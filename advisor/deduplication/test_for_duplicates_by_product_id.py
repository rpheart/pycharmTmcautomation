import itertools
import os
import unittest

import requests

import advisor.utils.api_calls as api
import advisor.utils.api_settings as settings

# Globals
email = "deduplication@renderer.com"
product_list = []

# Build Specific Variables
if os.environ["BUILD_ENV"] == "QA":
    renderer = settings.qa_renderer
    guid = settings.qa_guid
    engagement = "12843"
elif os.environ["BUILD_ENV"] == "PREPROD":
    renderer = settings.preprod_renderer
    guid = settings.preprod_guid
    engagement = "6727"
else:
    quit()


def verify_products_differ(product_id_list):
    """iterate through all product ID's in list and verify
     that no ID matches any other ID in the list"""

    for a, b in itertools.combinations(product_id_list, 2):
        if a is None or b is None or a == b:
            print "%s and %s are duplicate products" % (a, b)
            return False

    return True


def extract_product_id(json_response):
    """pulls sku if it exists as 'itemCode' from response
    and returns it else returns None"""

    if 'itemCode' in json_response:
        nonsense, sku_and_data = json_response.split('"itemCode":"', 1)
        sku, nonsense = sku_and_data.split('"', 1)
    else:
        print "No 'itemCode' found!"
        return None

    return sku


def get_response(renderer_url, guid_link, user_email, engagement_id, position_value):
    """sends a request to the renderer for a json response and
    returns the content of the response"""

    request_url = api.offer_open(renderer_url, guid_link, engagement_id, email=user_email, position=position_value,
                                 height=400, width=400, format="raw")
    json_handler = requests.get(request_url)  # get the specified url and store the content as a variable

    return json_handler.content


class TestForDuplication(unittest.TestCase):
    def setUp(self):
        """sends the offer open api 6 times and builds a list of
        6 product IDs. You can change the length of the list by
        changing the range value. The duplication checking is dynamic."""

        global product_list

        for position in range(6):  # range is the number of images you want to generate for comparison
            product_list.append(
                extract_product_id(get_response(renderer, guid, email, engagement, position + 1)))

    def tearDown(self):
        """clears the product list after each run so that the next test
        only contains products from a single multi-position offer open"""

        global product_list
        product_list = []

    def test_if_loop_one_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_two_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_three_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_four_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_five_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_six_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_seven_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_eight_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_nine_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")

    def test_if_loop_ten_campaign_snippet_contains_duplicate(self):
        global product_list

        self.assertTrue(verify_products_differ(product_list), msg="Duplicates Found")


if __name__ == '__main__':
    unittest.main()