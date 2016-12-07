# Testing API responses

import os
import sys

import requests


def find_response_id_or_token(response_handler):
    """takes response handler for requests.get(url) and returns the id if found. Otherwise it returns None"""
    text = response_handler.text
    if 'instance">' in text:  # searches for string that precedes message id or connection token
        nonsense, id_container = text.split('instance">')  # removes everything up to beginning of id/token
        response_id, nonsense = id_container.split('</result>')  # removes everything after id/token
        return response_id
    else:
        return None  # if no id/token found None is returned


def open_connection(url, response_code):
    """opens connection. Returns response code,
    successful string from message body and connection
    token for following tests to use as ${token} in RIDE"""
    try:

        open_connection_handler = requests.get(url)

        response_text = open_connection_handler.text
        actual_response_code = open_connection_handler.status_code

        if int(actual_response_code) == int(response_code) and response_text.find('success'):
            return "total response is {}".format(actual_response_code), "{}".format('success'), "{}".format(
                find_response_id_or_token(open_connection_handler))  # i.e. total response is 200, success, Gs2d323faf57
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


def create_sms_request(url, response_code):
    """create_sms_message. Returns message id to be used as
    ${id} for future tests in RIDE along with response code
    and successful string from message body"""
    try:

        headers = {'Content-Type': 'text/xml; charset=UTF-8'}  # headers to supply with html request
        dir_path = os.path.dirname(os.path.abspath(__file__))  # path to current file
        file_name = 'api_ccmd_sms.xml'  # name of .xml containing body of message
        xml_file = os.path.join(dir_path, file_name)  # absolute path to .xml file
        with open(xml_file, 'r') as f:  # opens, reads content to 'xml_content' and closes file
            xml_content = f.read()

        create_sms_handler = requests.post(url, data=xml_content, headers=headers)

        sms_response_text = create_sms_handler.text
        actual_response_code = create_sms_handler.status_code

        if int(actual_response_code) == int(response_code) and sms_response_text.find('success'):
            return "total response is {}".format(actual_response_code), "{}".format('success'), "{}".format(
                find_response_id_or_token(create_sms_handler))
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:

        print 'Error: %s' % e.strerror


def update_sms_request(url, response_code):
    """updates sms name. Returns response code,
        successful string from message body"""
    try:

        update_sms_handler = requests.get(url)

        response_text = update_sms_handler.text
        actual_response_code = update_sms_handler.status_code

        if int(actual_response_code) == int(response_code) and response_text.find('success'):
            return "total response is {}".format(actual_response_code), "{}".format('success')
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


def clone_sms_request(url, response_code):
    """clones sms message. Returns response code,
        successful string from message body and
        message id of newly cloned message"""
    try:

        clone_sms_handler = requests.get(url)

        response_text = clone_sms_handler.text
        actual_response_code = clone_sms_handler.status_code

        if int(actual_response_code) == int(response_code) and response_text.find('success'):
            return "total response is {}".format(actual_response_code), "{}".format('success'), "{}".format(
                find_response_id_or_token(clone_sms_handler))
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


def get_last_sms_request(url, response_code):
    """gets last sms messages. Returns response code,
        successful string from message body of get messages response"""
    try:

        get_last_sms_handler = requests.get(url)

        response_text = get_last_sms_handler.text
        actual_response_code = get_last_sms_handler.status_code

        if int(actual_response_code) == int(response_code) and response_text.find('success'):
            return "total response is {}".format(actual_response_code), "{}".format('success')
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


def get_sms_field_request(url, response_code):
    """gets last sms messages. Returns response code,
        successful string from message body of get messages response"""
    try:

        get_sms_field_handler = requests.get(url)

        response_text = get_sms_field_handler.text
        actual_response_code = get_sms_field_handler.status_code

        if int(actual_response_code) == int(response_code) and response_text.find('success'):
            return "total response is {}".format(actual_response_code), "{}".format('success')
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


def get_sms_preview_request(url, response_code):
    """gets last sms messages. Returns response code,
        successful string from message body of get messages response"""
    try:

        get_sms_preview_handler = requests.get(url)

        response_text = get_sms_preview_handler.text
        actual_response_code = get_sms_preview_handler.status_code

        if int(actual_response_code) == int(response_code) and response_text.find('success'):
            return "total response is {}".format(actual_response_code), "{}".format('success')
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


def delete_sms_request(url, response_code):
    """deletes message given id of message. Returns response code,
        successful string from message body of response"""
    try:

        get_sms_preview_handler = requests.get(url)

        response_text = get_sms_preview_handler.text
        actual_response_code = get_sms_preview_handler.status_code

        if int(actual_response_code) == int(response_code) and response_text.find('success'):
            return "total response is {}".format(actual_response_code), "{}".format('success')
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


def close_connection(url):
    try:

        close_connection_response_handler = requests.get(url)
        actual_response_code = close_connection_response_handler.status_code

        if close_connection_response_handler.status_code != 0:
            return "{}".format(find_response_id_or_token(close_connection_response_handler))
        else:
            return "error return is {}".format(actual_response_code)

    except IOError as e:
        print('Error: %s' % e.strerror)


if __name__ == "__main__":
    open_connection(sys.argv[0], sys.argv[1])
