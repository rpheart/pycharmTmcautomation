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
        "click_personaliser": "ldp-qa-tmc-mesosslavepublic-1.emv2.com/personalization/clickback/click?"
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
        "account name": "SIDEV01",
        "pod": "E2",
        "guid": "e44f26b0-12c7-4c29-aabf-9d11197c9c02",
        "aid": "20003",
        "username": "qaTest1",
        "password": "testPass1"
    },
    "PREPROD": {
        "account name": "PREPRODTMC",
        "pod": "E0",
        "guid": "f04323d7-4224-41b9-8906-17327182c866",
        "aid": "50004",
        "username": "u50004Z1EmS9rs",
        "password": "gHHaHrUYo9SgXuzq"
    }
}
