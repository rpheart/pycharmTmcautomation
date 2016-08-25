from selenium import webdriver
import time, sys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
driver = webdriver.Chrome()
def create_emails(username, password, http):
	try:
		driver.get(http)
		username = driver.find_element_by_id("IDToken1").send_keys(username)
		password = driver.find_element_by_id("IDToken2").send_keys(password)
		driver.find_element_by_id("loginButton").click()
		time.sleep(10)
		driver.maximize_window()
		time.sleep(10)
		email = driver.find_element_by_xpath("//li[@class='logo_button engage_button']")
		email.click()
		time.sleep(50)
		return 'engage button'
	except IOError as e:
	   print('Error: %s' % e.strerror)
	   
def click_create():
	try:
		create = driver.find_element_by_id("engage-create")
		hover = ActionChains(driver).move_to_element(create)
		hover.perform()
		time.sleep(10)
		message_builder = driver.find_element_by_xpath("//ul[@class='dropdown-modules' and @title='Message Builder']/li[@class='dropdown-module']").click()
		return 'message builder'
	except IOError as e:
	   print('Error: %s' % e.strerror)

if __name__ == "__main__":
    create_emails(sys.argv[0], sys.argv[1], sys.argv[2])