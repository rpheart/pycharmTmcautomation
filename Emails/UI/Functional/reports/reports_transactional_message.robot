*** Settings ***
Documentation   verifies working features on the transactional message reports page
Resource        ../../Utils/keywords.robot
Default Tags    ui  email  report
Suite Setup     run keywords
...             login
...             AND  go to ${system_page["email"]}
Suite Teardown  close all browsers

*** Test Cases ***
transactional_message_reports_date_range_report
  open content  ${transactional_reports}  ${transactional_reports["button_add"]["add"]}
  click element  ${transactional_reports["button_add"]["date_range_report"]}
  click element  ${generics["ok_button"]}
  element should be visible  //*[@id="daterange"]//img[@alt='Chart Image']

transactional_message_reports_custom_search
  open content  ${transactional_reports}  ${transactional_reports["button_add"]["add"]}
  click element  ${transactional_reports["button_add"]["custom_search"]}
  input text  ${transactional_reports["button_add"]["email"]}  qa.auto@smartfocus.com
  click element  ${generics["ok_button"]}
  element should be visible  //*[@id="custom"]/table[@class='list']
