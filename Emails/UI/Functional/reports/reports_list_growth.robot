*** Settings ***
Documentation   verifies features on the list growth reports page
Resource        ../../Utils/email_keywords.robot
Default Tags    ui  email  report
Suite Setup     run keywords
...             login
...             AND  go to ${system_page["email"]}
Suite Teardown  close all browsers

*** Test Cases ***
create_new_list_growth_report
  open content  ${list_growth_reports}  ${list_growth_reports["button_add"]["add"]}
  wait until element is visible  ${generics["create_new"]}
  click element  ${generics["create_new"]}
  input text  ${list_growth_reports["button_add"]["create_new"]["report_name"]}  Qa Auto Report
  click element  ${list_growth_reports["button_add"]["create_new"]["create_report"]}
  refresh page until report status  Generated
  element should contain  ${list_growth_reports["button_list"]["first_row"]}  Qa Auto Report

list_growth_reports_search
  open content  ${list_growth_reports}  ${list_growth_reports["button_add"]["add"]}
  wait until keyword succeeds  5x  1 sec  input text  ${generics["search_input"]}  Qa Auto Report
  click element  ${generics["search_button"]}
  element should contain  ${list_growth_reports["button_list"]["first_row"]}  Qa Auto Report

view_list_gowth_results
  open content  ${list_growth_reports}  ${list_growth_reports["button_add"]["add"]}
  mouse over  ${list_growth_reports["button_list"]["first_row"]}
  click element  ${list_growth_reports["button_list"]["results_button"]}
  element should be visible  ${list_growth_reports["button_add"]["report_chart_window"]}

delete_list_gowth_report
  open content  ${list_growth_reports}  ${list_growth_reports["button_add"]["add"]}
  mouse over  ${list_growth_reports["button_list"]["first_row"]}
  click element  ${list_growth_reports["button_list"]["delete_button"]}
  click element  ${generics["yes_button"]}
  current frame contains  successfully deleted

list_growth_search_segments
  open content  ${list_growth_reports}  ${list_growth_reports["button_add"]["add"]}
  wait until element is visible  ${generics["create_new"]}
  click element  ${generics["create_new"]}
  click element  ${list_growth_reports["button_add"]["create_new"]["segments_radio"]}
  click element  ${list_growth_reports["button_add"]["create_new"]["segments_list"]}
  input text  ${list_growth_reports["button_add"]["create_new"]["segments_search_input"]}  QA TEAM
  click element  ${list_growth_reports["button_add"]["create_new"]["segments_search_button"]}
  element should contain  ${list_growth_reports["button_add"]["create_new"]["segmentss_row"]}  QA TEAM

*** Keywords ***
refresh page until report status
  [Documentation]  refreshes the list growth report page until the expected report status is found
  [Arguments]  ${status}
  open content  ${list_growth_reports}  ${list_growth_reports["button_add"]["add"]}
  :for  ${n}  in range  10
  \  ${is_complete}=  run keyword and return status
  \  ...  element should contain  ${list_growth_reports["button_list"]["first_row"]}  ${status}
  \  exit for loop if  ${is_complete}
  \  sleep  3
  \  click element  ${list_growth_reports["button_list"]["refresh_button"]}
