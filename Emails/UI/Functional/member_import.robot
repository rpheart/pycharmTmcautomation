*** Settings ***
Documentation       test importing member files and updating with email or custom keys and checking that the members have been added or updated after each import
Resource            Emails/UI/Utils/keywords.robot
Library             ImageHorizonLibrary
Default Tags        ui    email    production

*** Variables ***
${fail_table}       table.list
${good_table}       table.list:nth-child(2) > tbody:nth-child(2)
${import_table}     table.list
${search_table}     div#content > form > table.list
${failed_import}    C:\\build\\SmartFocus-TMC-Automation\\member_import\\imports_fail.txt
${good_import}      C:\\build\\SmartFocus-TMC-Automation\\member_import\\imports_good.txt
${member_email}     foo@bar.com
${member_name}      foo
${member_surname}      bar

*** Test Cases ***
login and go to email
    login
    go to ${system_page["email"]}

import invalid file
    open content    ${import_subscriber}    ${import_subscriber["button_add"]}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible    id=ccmd-import-btn    timeout=30
    upload ${failed_import}
    select window    ${document_title}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    refresh page until imports_fail.txt visible
    table column should contain    css=${fail_table}    5    imports_fail.txt

delete failed import
    open content    ${import_subscriber}    ${import_subscriber["button_add"]}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible    id=ccmd-import-btn    timeout=30
    find row in ${fail_table} containing imports_fail.txt
    delete from row ${row_index}

import valid file
    open content    ${import_subscriber}    ${import_subscriber["button_add"]}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible    id=ccmd-import-btn    timeout=30
    upload ${good_import}
    select window    ${document_title}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    refresh page until imports_good.txt visible
    table column should contain    css=${good_table}    5    imports_good.txt
    find row in ${good_table} containing imports_good.txt
    ${row_index}=    evaluate    ${row_index} + 1
    ${cell_text}=    get table cell    css=table.list:nth-child(2)    ${row_index}    2
    click element    link=${cell_text}
    select checkbox    id=TOREPLACE_FIRSTNAME
    select checkbox    id=TOREPLACE_LASTNAME
    select checkbox    id=TOREPLACE_EMAIL
    select checkbox    id=TOREPLACE_DATEOFBIRTH
    select checkbox    id=TOREPLACE_CODE
    click element    id=iconButtonNext
    refresh page until imports_good.txt visible
    table column should contain    css=${import_list}    4    imports_good.txt
    refresh page until import completes
    table row should contain    css=${import_list}    1    DONE

verify members have been imported
    search for ${member_email}
    find row in ${search_table} containing ${member_email}
    table row should contain    css=${search_table}    ${row_index}    ${member_email}
    table row should contain    css=${search_table}    ${row_index}    ${member_name}
    table row should contain    css=${search_table}    ${row_index}    ${member_surname}


*** Keywords ***
find row in ${table} containing ${identifier}
    :for    ${row_index}    in range    1    5
    \    ${status}=    run keyword and return status
    \    ...    table row should contain    css=${table}    ${row_index}    ${identifier}
    \    exit for loop if    '${status}' == 'True'
    set suite variable    ${row_index}

delete from row ${row_index}
    ${id}=    catenate    SEPARATOR=    css=#ccmd-import-processing-del    ${row_index}     > input[name="deleteUploadError"]
    select checkbox    ${id}
    click element    id=iconTrash
    wait until element is visible    css=a.btn.blue    timeout=30
    click element    css=a.btn.blue

upload ${member_file}
    click element    id=ccmd-import-btn
    sleep    2
    select window    title=File Import
    click element    name=uploadFile
    sleep    1
    type    ${member_file}    Key.ENTER
    select radio button    firstLineType    contains_mapping
    click element    id=iconUpload
    wait until element contains    id=content    File successfully imported.        timeout=30
    click element    id=iconCancel

refresh page until ${identifier} visible
    :for    ${index}    in range    20
    \    sleep    3
    \    click element    css=div.applicationBarRefreshButtonIcon
    \    ${status}=    run keyword and return status
    \    ...    current frame contains    ${identifier}
    \    exit for loop if    '${status}' == 'True'

refresh page until import completes
    :for    ${index}    in range    100
    \    sleep    3
    \    click element    css=div.applicationBarRefreshButtonIcon
    \    ${status}=    run keyword and return status
    \    ...    table row should contain    css=${import_table}    1    DONE
    \    exit for loop if    '${status}' == 'True'
    \    ${status}=    run keyword and return status
    \    ...    table row should contain    css=${import_table}    1    DONE WITH ERROR(S)
    \    exit for loop if    '${status}' == 'True'

search for ${member}
    open content    ${search_subscriber}    ${search_subscriber["button_add"]}
    select frame    ${iframes["top"]}
    select frame    ${iframes["ccmd"]}
    wait until element is visible    name=textFieldCombo    timeout=30
    select from list    name=textFieldCombo    EMAIL
    select from list    name=textFieldOperator    equals
    input text    name=textFieldValue    ${member}
    click element    id=iconAddCriteria
    wait until element is visible    id=iconSearch    timeout=30
    click element    id=iconSearch
    sleep    5