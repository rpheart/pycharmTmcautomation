import base64
import xml.etree.ElementTree as ET

import requests


def get_xml_content(response, tag="result"):
    """If the response is successful it returns the text held within
    the 'tag' element. If not the response status is returned"""

    tree = ET.fromstring(response)
    # tag = "*" + tag

    if tree.attrib["responseStatus"] == "success":
        return tree.findtext(tag)
    else:
        return tree.findtext("description")


def get_xml_content_list(response):
    """If the response is successful it returns a list of the text held
    within all of the elements. If not the response status is returned"""

    tree = ET.fromstring(response)
    tag_list = []

    if tree.attrib["responseStatus"] == "success":
        for iD in tree.itertext():
            iD = iD.strip()
            if iD:
                tag_list.append(iD)
        return tag_list
    else:
        return tree.attrib["responseStatus"]


def close_smart_email_connection(session, token, message_id="", segment_id="", template_id=""):
    """if any of the ID's have a value a GET request to delete them based on
    this ID. After the connection to the smart email API is closed."""

    if message_id:
        url = "%s/message/deleteMessage/%s/%s" % (session, token, message_id)
        requests.get(url)
    if segment_id:
        url = "%s/message/deleteMessage/%s/%s" % (session, token, message_id)
        requests.get(url)
    if template_id:
        url = "%s/template/delete/%s/%s" % (session, token, message_id)
        requests.get(url)

    url = "%s/connect/close/%s" % (session, token)
    requests.get(url)


def base_64_encode(string, prefix=""):
    """"""
    if prefix:
        return "%s %s" % (prefix, base64.b64encode(string))
    else:
        return base64.b64encode(string)
