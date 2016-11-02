# Testing API responses

import os
import requests
import sys


# ----------open----------------------

def open_connection(https, response_status):
    try:

        response = requests.get(https)

        if response.status_code == int(response_status):
            token_string = response.text
            left_string = token_string.find('<response responseStatus="success">')
            right_string = token_string.find('</result></response>')

            return ("total response is {}".format(response.status_code),
                    "{}".format(token_string[left_string * 4 - 3:right_string]))
        else:

            return "error return is {}".format(response.status_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


# ------------email------------------

def send_email_request(https, email_status):
    try:
        headers = {'Content-Type': 'text/xml; charset=UTF-8'}
        dir_path = os.path.dirname(os.path.abspath(__file__))
        file_name = os.path.splitext(dir_path)[0] + '\\api_ccmd_email.xml'
        xml_file = os.path.join(dir_path, file_name)
        XML_STRING = open(xml_file).read()

        message = requests.post(https, data=XML_STRING, headers=headers)

        check_message_string = message.text

        if message.status_code == int(email_status) and check_message_string.find('success') != -1:
            id = check_message_string
            id_left = id.find('<response responseStatus="success">')
            id_right = id.find('</result></response>')
            return ("{}".format(id[id_left * 4 - 5:id_right]), "total response is {}".format(message.status_code),
                    "{}".format('success'))

        else:

            return "{}".format("error id"), "total response is {}".format(message.status_code), "{}".format('error')

    except IOError as e:
        print('Error: %s' % e.strerror)


# -----------scm-----------------

def send_scm_request(https, sms_status):
    try:

        headers = {'Content-Type': 'text/xml; charset=UTF-8'}
        dir_path = os.path.dirname(os.path.abspath(__file__))
        file_name = os.path.splitext(dir_path)[0] + '\\api_ccmd_sms.xml'
        xml_file = os.path.join(dir_path, file_name)
        XML_STRING = open(xml_file).read()

        sms = requests.post(https, data=XML_STRING, headers=headers)
        check_sms_sting = sms.text
        return return_status(sms.status_code, sms_status, check_sms_sting)

    except IOError as e:
        print('Error: %s' % e.strerror)


# ------------Clone------------------

def clone_message(https, clone_status):
    try:

        clone_response = requests.get(https)
        clone_string = clone_response.text
        return return_status(clone_response.status_code, clone_status, clone_string)

    except IOError as e:
        print('Error: %s' % e.strerror)


# -------Get Last Three Messages ------------------

def get_last_email_messages(https, last_message_status):
    try:

        last_response = requests.get(https)
        last_string = last_response.text
        return return_status(last_response.status_code, last_message_status, last_string)

    except IOError as e:
        print('Error: %s' % e.strerror)


# ------------delete-----------------

def delete_message(https, delete_status):
    try:

        delete_response = requests.get(https)
        delete_string = delete_response.text
        return return_status(delete_response.status_code, delete_status, delete_string)

    except IOError as e:
        print('Error: %s' % e.strerror)


# ----------message preview----------
def get_email_message_preview(https, preview_status):
    try:

        preview_response = requests.get(https)
        preview_string = preview_response.text
        return return_status(preview_response.status_code, preview_status, preview_string)

    except IOError as e:
        print('Error: %s' % e.strerror)


# -----------return expected status-------------------

def return_status(actual_status, expected_status, success):
    try:

        if actual_status == int(expected_status) and success.find('success') != -1:

            return "total response is {}".format(actual_status), "{}".format('success')

        else:

            return "error code is {}".format(actual_status), "{}".format('error')

    except IOError as e:
        print('Error: %s' % e.strerror)


# -----------close-------------------

def close_connection(https):
    try:

        response = requests.get(https)

        if response.status_code != 0:
            token_string = response.text
            left_string = token_string.find('<response responseStatus="success">')
            right_string = token_string.find('</result></response>')

            return "{}".format(token_string[left_string * 4 - 3:right_string])
        else:

            return "error return is {}".format(response.status_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


if __name__ == "__main__":
    post_call(sys.argv[0], sys.argv[1])
