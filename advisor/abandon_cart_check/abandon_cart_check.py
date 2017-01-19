# Testing API responses

import requests,sys, re, os

#----------open----------------------

def send_email_to_tmc(http):
	try:
		
		response = requests.get(http)
        
		return str(response)

	except IOError as e:
	   print('Error: %s' % e.strerror)
	   
#------------email------------------
		
if __name__ == "__main__":
    send_email_to_tmc(sys.argv[0])