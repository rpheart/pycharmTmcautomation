*** Settings ***
Documentation   verifies that abandon cart is working and that no visitors are missed when the process runs
Library         RequestsLibrary
Library         Selenium2Library    15    15    run_on_failure=custom fail
Suite Setup     login
Suite Teardown  close all browsers

*** Variables ***
${URL}              http://console-eu1.advisor.smartfocus.com/console/login.htm
${BROWSER}          chrome
${USERNAME}         u368xb1mBluA
${PASSWORD}         jfJfEZHaHnwtcRWd
${ADVISOR_ID}       665
${ADVISOR_HOST}     http://api-eu1.advisor.smartfocus.com
${DATA}             009431
${runs}             1000
${EMAIL}            ${EMPTY}
@{email_string_list}    one    two    three    four    five    six    seven    eight    nine    ten

*** Test Cases ***
run_abandon_cart_process
    [Documentation]    force runs abandon cart and then records the time of the next scheduled run
    set selenium speed    0.1
    click element    xpath=//*[@id="navigation"]//a[./text()='Services']
    click element    xpath=//*[@id="navigation"]//a[normalize-space(.//text())='Processes']
    click element    xpath=//*[@id="processCommand"]//a[@href="javascript:forceRun('Abandon Cart');"]
    sleep    10
    reload page
    sleep    5
    ${run_after_time}=    get text    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[7]
    set global variable    ${run_after_time}

send_cart_add_apis
    [Documentation]    sends 1000 cart add apis with unique emails
    set selenium speed    0.0
    ${count}=    set variable    ${0}
    ${EMAIL}=    set variable    ${email_string_list[0]}@bar.com
    :for    ${item}    in range    1    ${Runs}
    \    create session    host    ${ADVISOR_HOST}
    \    ${email_response}    get request    host    /ips/cred/${USERNAME}/${PASSWORD}/3.0/notify/${ADVISOR_ID}/cart-add?email=${count}${EMAIL}&data=${DATA}
    \    run keyword unless    ${email_response.ok}    fail    ${email_response.content}
    \    ${count}=    set variable    ${count+1}
    \    ${count}=    set variable if    ${count} == 100    ${0}    ${count}
    \    ${EMAIL}=    set variable if    ${item} == 100    ${email_string_list[1]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 200    ${email_string_list[2]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 300    ${email_string_list[3]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 400    ${email_string_list[4]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 500    ${email_string_list[5]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 600    ${email_string_list[6]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 700    ${email_string_list[7]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 800    ${email_string_list[8]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 900    ${email_string_list[9]}@bar.com    ${EMAIL}

verify_process_didnt_run_while_apis_were_sent
    [Documentation]    ensures that the abandon cart process didn't run while apis were sent
    set selenium speed    0.1
    click element    xpath=//*[@id="navigation"]//a[./text()='Services']
    click element    xpath=//*[@id="navigation"]//a[normalize-space(.//text())='Processes']
    ${current_run_after_time}=    get text    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[7]
    should be equal as strings    ${run_after_time}    ${current_run_after_time}

wait_until_process_runs
    [Documentation]    waits for the abandon cart process to run at the next scheduled time
    set selenium speed    0.1
    :for    ${attempt}    in range    1    20
    \    click element    xpath=//*[@id="navigation"]//a[./text()='Services']
    \    click element    xpath=//*[@id="navigation"]//a[normalize-space(.//text())='Processes']
    \    ${current_run_after_time}=    get text    xpath=//*[@id="processCommand"]/table/tbody/tr[1]/td[7]
    \    ${status}=    run keyword and return status    should not be equal as strings
    \    ...    ${run_after_time}    ${current_run_after_time}
    \    exit for loop if    ${status}
    \    sleep    60

verify_all_users_have_abandon_cart_behaviours
    [Documentation]    counts the users that do not have abandon cart behaviours and fails if > 0
    set selenium speed    0.1
    ${count}=    set variable    ${0}
    ${EMAIL}=    set variable    ${email_string_list[0]}@bar.com
    ${success_count}=    set variable    ${0}
    # verify that every user has an abandon cart in their behaviours tab
    :for    ${item}    in range    1    ${runs}
    \    search for visitors    ${count}${EMAIL}
    \    click element    xpath=//*[@id="content"]//a[normalize-space(.//text())='${count}${EMAIL}']
    \    click element    xpath=//*[@id="navigation"]//a[./text()='Behaviours']
    \    ${is_abandon_cart}=    run keyword and return status
    \    ...    element should contain    //div[@class='fbody_g']/table[@class='boxlist']//td[2]    Abandon Cart
    \    ${success_count}=    set variable if    ${is_abandon_cart}    ${success_count+1}    ${success_count}
    \    ${count}=    set variable    ${count+1}
    \    ${count}=    set variable if    ${count} == 100    ${0}    ${count}
    \    ${EMAIL}=    set variable if    ${item} == 100    ${email_string_list[1]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 200    ${email_string_list[2]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 300    ${email_string_list[3]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 400    ${email_string_list[4]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 500    ${email_string_list[5]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 600    ${email_string_list[6]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 700    ${email_string_list[7]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 800    ${email_string_list[8]}@bar.com    ${EMAIL}
    \    ${EMAIL}=    set variable if    ${item} == 900    ${email_string_list[9]}@bar.com    ${EMAIL}
    ${runs}=    convert to integer    ${runs}
    run keyword unless    ${success_count} == ${runs-1}    fail

*** Keywords ***
login
    [Documentation]    logs into the advisor console directly for a client
    open browser    ${URL}    ${BROWSER}
    maximize browser window
    input text    id=accountID    ${ADVISOR_ID}
    input text    id=userName    ${USERNAME}
    input password    id=userPassword    ${PASSWORD}
    click element    xpath=//*[@id="authenticationBean"]//a[@class="login"]

custom fail
    [Documentation]    keyword to run on failure
    log source
    capture page screenshot

search for visitors
    [Documentation]    search for visitors by email using the search term specified
    [Arguments]    ${search_term}
    click element    xpath=//*[@id="navigation"]//a[./text()='Visitors']
    select from list by label    xpath=//select[@id="representationType"]    Email
    input text    id=searchCriteria    ${search_term}
    click element    xpath=//*[@id="content"]//a[@href="javascript:search();"]
    wait until element is visible    xpath=//*[@id="visitors1"]