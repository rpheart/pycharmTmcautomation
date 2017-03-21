*** Settings ***
Documentation       verifies that you can craete list growth reports
Resource            ../../Utils/keywords.robot
Default Tags        ui    email    report
Suite Setup         run keywords
...                 login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Test Cases ***
create_new_list_growth_report
    open content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    wait until element is visible    ${generics["create_new"]}
    click element    ${generics["create_new"]}
    input text    ${list_growth_reports["button_add"]["create_new"]["report_name"]}    Qa Auto Report
    click element    ${list_growth_reports["button_add"]["create_new"]["create_report"]}

    open content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    :for    ${n}    in range    10
    \    ${is_complete}=    run keyword and return status
    \    ...    element should contain    //*[@id='emvTab1-row-0']    Generated
    \    exit for loop if    ${is_complete}
    \    sleep    3
    \    click element    //*[@id="listReportUI-mainMenu-refreshButton"]
    element should contain    //*[@id='emvTab1-row-0']    Qa Auto Report

list_growth_reports_search
    open content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    wait until keyword succeeds    15x    1 sec    input text    ${generics["search_input"]}    Qa Auto Report
    sleep    0.5
    wait until keyword succeeds    15x    1 sec    click element    ${generics["search_button"]}
    element should contain    //*[@id='emvTab1-row-0']    Qa Auto Report

view_list_gowth_results
    open content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    mouse over    //*[@id='emvTab1-row-0']
    click element    //*[contains(@id, 'listReportUi-ArchiveView-resultView')]
    element should be visible    //div[contains(@class, 'ui-list-report-client-bundle-ListReportCSS-mainContent')]

delete_list_gowth_report
    open content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    mouse over    //*[@id='emvTab1-row-0']
    click element    //*[contains(@id, 'listReportUi-ArchiveView-deleteIcon')]
    click element    ${generics["yes_button"]}
    current frame contains    successfully deleted

list_growth_search_segments
    open content    ${list_growth_reports}    ${list_growth_reports["button_add"]["add"]}
    wait until element is visible    ${generics["create_new"]}
    click element    ${generics["create_new"]}
    click element    ${list_growth_reports["button_add"]["create_new"]["segments_radio"]}
    click element    ${list_growth_reports["button_add"]["create_new"]["segments_list"]}
    input text    ${list_growth_reports["button_add"]["create_new"]["segments_search_input"]}    QA TEAM
    sleep    0.5
    click element    ${list_growth_reports["button_add"]["create_new"]["segments_search_button"]}
    element contains    //*[@id="listReportUI-builderView-segmentsExplorer-nameColumn"]    QA TEAM
