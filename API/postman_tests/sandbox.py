import json

import requests

user = "emvqae1_api_psummers"
password = "Standard1!"
apikey = "CdX7CrRD4EeekEUMb8M_sqWXawknQfiBuQKoBs9XKa-sH0-e2hqG8dVsgUw"

params = {"login": user, "password": password, "apiKey": apikey}

params = json.dumps(params)

url = "https://t1api-globalx.emv2.com/smartemail/v1/authorization"

response = requests.post(url, data=params)
print response.json()["token"]
