*** Settings ***
Documentation   verifies working features on the mobile reports page
Resource        ../../Utils/email_keywords.robot
Default Tags    ui  email  report
Suite Setup     run keywords
...             login
...             AND  go to ${system_page["email"]}
Suite Teardown  close all browsers

*** Test Cases ***
mobile_reports_search
  open content  ${mobile_reports}  ${mobile_reports["button_add"]["add"]}
  input text  ${generics["search_input"]}  test
  click element  ${generics["search_button"]}
  ${first_row_text}=  get text  ${mobile_reports["button_add"]["first_row"]}
  should contain  ${first_row_text}  test  ignore_case=True
