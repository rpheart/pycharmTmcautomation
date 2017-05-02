import os

# QA URL Settings
qa_advisor = "qa-eu1-advisor1-v3.advisor.smartfocus.com"
qa_renderer = "qa-eu1-p3-renderer.advisor.smartfocus.com"
qa_click = "qa-eu1-p3-api-public.advisor.smartfocus.com"
qa_guid = "e44f26b0-12c7-4c29-aabf-9d11197c9c02"
qa_aid = "20003"
qa_username = "qaTest1"
qa_password = "testPass1"

# QA eventbox Kafka settings
qa_tcp_server = "10.20.187.97"
qa_tcp_username = "ubuntu"
qa_tcp_key = os.path.join("C:/keys/qa-eu-master")

# PreProd URL Settings
preprod_advisor = "preprod-eu1-api-ext-lb-580332958.eu-west-1.elb.amazonaws.com"
preprod_renderer = "preprod-eu1-p3-renderer.advisor.smartfocus.com"
preprod_click = "preprod-eu1-p3-api-public.advisor.smartfocus.com"
preprod_guid = "f04323d7-4224-41b9-8906-17327182c866"
preprod_aid = "50004"
preprod_username = "u50004Z1EmS9rs"
preprod_password = "gHHaHrUYo9SgXuzq"

# PreProd eventbox Kafka settings
preprod_tcp_server = "10.20.91.101"
preprod_tcp_username = "psummers"
preprod_tcp_key = os.path.join("C:/keys/preprod-eu-master")

kafka_settings = {
    "QA": {
        "tcp_server": "10.20.187.97",
        "tcp_username": "ubuntu",
        "tcp_key": "C:/keys/qa-eu-master"
    },
    "PREPROD": {
        "tcp_server": "10.20.91.101",
        "tcp_username": "psummers",
        "tcp_key": "C:/keys/preprod-eu-master"
    }

}

api_settings = {
    "QA": {
        "advisor": "qa-eu1-advisor1-v3.advisor.smartfocus.com",
        "renderer": "ldp-qa-tmc-mesosslavepublic-1.emv2.com/renderer/web",
        "click_advisor": "qa-eu1-p3-api-public.advisor.smartfocus.com/api-public/3.0/click/1?",
        "click_personaliser": "qa-eu1-p3-api-public.advisor.smartfocus.com/personalization/clickback/click?"
    },
    "PREPROD": {
        "advisor": "preprod-eu1-api-ext-lb-580332958.eu-west-1.elb.amazonaws.com",
        "renderer": "preprod-eu1-p3-renderer.advisor.smartfocus.com",
        "click_advisor": "preprod-eu1-p3-api-public.advisor.smartfocus.com/api-public/3.0/click/1?",
        "click_personaliser": "preprod-eu1-ext.advisor.smartfocus.com/personalization/clickback/click?"
    }
}

client_settings = {
    "QA": {
        "SIDEV01": {
            "account name": "SIDEV01",
            "pod": "E2",
            "guid": "e44f26b0-12c7-4c29-aabf-9d11197c9c02",
            "aid": "20003",
            "username": "qaTest1",
            "password": "testPass1"
        },
        "EMVQA_E1": {
            "account name": "EMVQA_E1",
            "pod": "E1",
            "guid": "35b21e25-6d94-4bd9-a390-6a07c8a6c845",
            "aid": "20138",
            "username": "u20135PErkXV8I",
            "password": "AAA7BxDdA9JYnlyr"
        }
    },
    "PREPROD": {
        "PREPRODTMC": {
            "account name": "PREPRODTMC",
            "pod": "E0",
            "guid": "f04323d7-4224-41b9-8906-17327182c866",
            "aid": "50004",
            "username": "u50004Z1EmS9rs",
            "password": "gHHaHrUYo9SgXuzq"
        },
        "QAPREPROD": {
            "account name": "QAPREPROD",
            "pod": "E0",
            "guid": "c9d07eea-3006-4bc0-aa8f-db490aefd400",
            "aid": "50010",
            "username": "u50011KayXn3uW",
            "password": "VpU1mjvjVN57lxJw"
        }

    }
}
