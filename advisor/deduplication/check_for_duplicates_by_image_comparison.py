import itertools
import os
import shutil

import cv2
import numpy as np
import requests

import advisor.utils.api_settings as settings

# Globals
email = "deduplication@renderer.com"
product_list = []

# Build Specific Variables
if os.environ["BUILD_ENV"] == "QA":
    renderer = settings.api_settings["QA"]["renderer"]
    guid = settings.client_settings["QA"]["SIDEV01"]["guid"]
    engagement = "12843"
elif os.environ["BUILD_ENV"] == "PREPROD":
    renderer = settings.api_settings["PREPROD"]["renderer"]
    guid = settings.client_settings["PREPROD"]["PREPRODTMC"]["guid"]
    engagement = "6727"
else:
    quit()


def mean_squared_error(image_a, image_b):
    """the 'Mean Squared Error' between the two images is the
    sum of the squared difference between the two images.
    NOTE: the two images must have the same dimension"""

    image_a = cv2.imread(image_a, -1)
    image_b = cv2.imread(image_b, -1)

    err = np.sum((image_a.astype("float") - image_b.astype("float")) ** 2)
    err /= float(image_a.shape[0] * image_a.shape[1])

    return err  # return the MSE, the lower the error, the more "similar" the two images are


def get_image(renderer_url, guid_link, user_email, engagement_id, position_value):
    """sends a request to the renderer for an image and writes
    that image to a file with the name position_n where n is
    the position of the link that is sent"""

    image_name = "position_%s.png" % position_value
    request_url = "http://%s/api-public/3.0/personaliseemail?a=%s&ue=%s&e=%s&f=png&l=en&h=400&w=400&pos=%s" % (
        renderer_url, guid_link, user_email, engagement_id, position_value)
    image_handler = requests.get(request_url)  # ge the specified url and store the content as a variable

    with open(image_name, 'wb') as outfile:
        outfile.write(image_handler.content)  # write the content of the response to an image file


def write_out_error(test_loop_number, image_a, image_b):
    """takes the loop number of the test that is running and
    creates a directory of this name if it does not exist. Tests
    that have been found as duplicates wil be copied to this
    new directory"""

    image_a_name = image_a[:-4]
    image_b_name = image_b[:-4]
    root_directory = os.path.join(os.getcwd(), "test_%s" % test_loop_number,
                                  "pair_%s_%s" % (image_a_name, image_b_name))

    if not os.path.exists(root_directory):  # check if directory exists
        os.makedirs(root_directory)

    shutil.copy(image_a, root_directory)  # copy duplicate files to newly created directory
    shutil.copy(image_b, root_directory)


def remove_files():
    for image in os.listdir(os.path.dirname(os.path.realpath(__file__))):
        if os.path.isfile(
                os.path.join(os.path.dirname(os.path.realpath(__file__)), image)) and ".png" in image:
            os.remove(image)


for test_run in range(50):  # range is the number of times you want to run the test
    print "Test run: %s" % test_run
    product_list = []
    for position in range(6):  # range is the number of images you want to generate for comparison
        get_image(renderer, guid, email, engagement, position + 1)  # range starts at 0 so we add 1 to avoid 'pos=0'
    for result_file in os.listdir(
            os.path.dirname(os.path.realpath(__file__))):  # generate list of files in current directory
        if os.path.isfile(
                os.path.join(os.path.dirname(os.path.realpath(__file__)), result_file)) and ".png" in result_file:
            product_list.append(result_file)  # appends all .png files in the current directory to a list
    for a, b in itertools.combinations(product_list, 2):  # compares all elements in a list
        if mean_squared_error(a, b) == 0.0:
            print "images %s, %s are duplicates!" % (a[-14:], b[-14:])
            write_out_error(test_run, a, b)
        else:
            pass
    remove_files()
