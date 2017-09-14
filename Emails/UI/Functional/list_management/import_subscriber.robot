*** Settings ***
Documentation       test importing member files and updating with email or custom keys and checking that the members have been added or updated after each import
Default Tags        ui    email    import
Resource            ../../Utils/email_keywords.robot
Resource            ../../Utils/subscriber.robot
Suite Setup         run keywords    login
...                 AND    go to ${system_page["email"]}
Suite Teardown      close all browsers

*** Variables ***
${failed_import}    ${EXECDIR}/Emails/UI/Utils/Resources/imports_fail.txt
${good_import}      ${EXECDIR}/Emails/UI/Utils/Resources/imports_good.txt
${update_import}    ${EXECDIR}/Emails/UI/Utils/Resources/imports_good_update.txt
${mixed_import}     ${EXECDIR}/Emails/UI/Utils/Resources/imports_mixed.txt

*** Test Cases ***
import_invalid_file
    upload member file    ${failed_import}
    open content    ${import_subscriber}    ${import_subscriber["button_add"]["add"]}
    refresh page until content visible    imports_fail.txt
    table column should contain    ${import_subscriber["button_add"]["fail_table"]}    5    imports_fail.txt

delete_failed_import
    open content    ${import_subscriber}    ${import_subscriber["button_add"]["add"]}
    find row in table containing content    ${import_subscriber["button_add"]["fail_table"]}    imports_fail.txt
    delete from row    ${row_index}

import_valid_file
    upload member file    ${good_import}
    open content    ${import_subscriber}    ${import_subscriber["button_add"]["add"]}
    refresh page until content visible    imports_good.txt
    table column should contain    ${import_subscriber["button_add"]["good_table"]}    5    imports_good.txt
    # grab import id and start the import process
    find row in table containing content    ${import_subscriber["button_add"]["good_table"]}    imports_good.txt
    ${row_index}=    evaluate    ${row_index} + 1
    ${cell_text}=    get table cell    css=table.list:nth-child(2)    ${row_index}    2
    click link    ${cell_text}
    select checkbox    id=TOREPLACE_FIRSTNAME
    select checkbox    id=TOREPLACE_LASTNAME
    select checkbox    id=TOREPLACE_EMAIL
    select checkbox    id=TOREPLACE_DATEOFBIRTH
    select checkbox    id=TOREPLACE_CODE
    click element    id=iconButtonNext
    verify import is complete    imports_good.txt    DONE

    # verify members have been imported
    search for member    EMAIL    contains    foo@bar.com
    table column should contain    css=div#content > form > table.list    4    foo@bar.com
    table column should contain    css=div#content > form > table.list    3    foo
    table column should contain    css=div#content > form > table.list    2    bar

import_update_file
    upload member file    ${update_import}
    open content    ${import_subscriber}    ${import_subscriber["button_add"]["add"]}
    refresh page until content visible    imports_good_update.txt
    table column should contain    ${import_subscriber["button_add"]["good_table"]}    5    imports_good_update.txt
    # grab import id and start the import process
    find row in table containing content    ${import_subscriber["button_add"]["good_table"]}    imports_good_update.txt
    ${row_index}=    evaluate    ${row_index} + 1
    ${cell_text}=    get table cell    css=table.list:nth-child(2)    ${row_index}    2
    click link    ${cell_text}
    click element    //*[@id="content"]/form/table[3]/tbody/tr[3]/td[2]/input
    input text    //*[@id="content"]/form/table[3]/tbody/tr[3]/td[2]/input    EMAIL, CODE
    select checkbox    id=TOREPLACE_FIRSTNAME
    select checkbox    id=TOREPLACE_LASTNAME
    select checkbox    id=TOREPLACE_EMAIL
    select checkbox    id=TOREPLACE_DATEOFBIRTH
    select checkbox    id=TOREPLACE_CODE
    click element    id=iconButtonNext
    verify import is complete    imports_good_update.txt    DONE

    # verify members have been imported
    search for member    EMAIL    contains    foo@bar.com
    table column should contain    css=div#content > form > table.list    4    foo@bar.com
    table column should contain    css=div#content > form > table.list    3    foo2
    table column should contain    css=div#content > form > table.list    2    bar2

import_mixed_file
    upload member file    ${mixed_import}
    open content    ${import_subscriber}    ${import_subscriber["button_add"]["add"]}
    refresh page until content visible    imports_mixed.txt
    table column should contain    ${import_subscriber["button_add"]["good_table"]}    5    imports_mixed.txt
    # grab import id and start the import process
    find row in table containing content    ${import_subscriber["button_add"]["good_table"]}    imports_mixed.txt
    ${row_index}=    evaluate    ${row_index} + 1
    ${cell_text}=    get table cell    css=table.list:nth-child(2)    ${row_index}    2
    click link    ${cell_text}
    select checkbox    id=TOREPLACE_FIRSTNAME
    select checkbox    id=TOREPLACE_LASTNAME
    select checkbox    id=TOREPLACE_EMAIL
    select checkbox    id=TOREPLACE_DATEOFBIRTH
    select checkbox    id=TOREPLACE_CODE
    select checkbox    id=TOREPLACE_EMVCELLPHONE
    click element    id=iconButtonNext
    verify import is complete    imports_mixed.txt    DONE WITH ERROR(S)

    # verify members have been imported
    search for member    EMAIL    contains    foo@bar.com
    table column should contain    css=div#content > form > table.list    4    foo@bar.com
    table column should contain    css=div#content > form > table.list    3    foo
    table column should contain    css=div#content > form > table.list    2    bar

*** Keywords ***
verify import is complete
    [Arguments]    ${file_name}    ${completion_type}
    refresh page until content visible    ${file_name}
    table column should contain    ${import_subscriber["button_add"]["import_table"]}    4    ${file_name}
    refresh page until import completes
    table row should contain    ${import_subscriber["button_add"]["import_table"]}    1    ${completion_type}

find row in table containing content
    [Arguments]    ${table_id}    ${content}
    :for    ${row_index}    in range    5
    \    ${is_visible}=    run keyword and return status    table row should contain    ${table_id}    ${row_index}    ${content}
    \    exit for loop if    ${is_visible}
    set suite variable    ${row_index}

delete from row
    [Arguments]    ${row_index}
    ${id}=    catenate    SEPARATOR=    css=#ccmd-import-processing-del    ${row_index}     > input[name="deleteUploadError"]
    select checkbox    ${id}
    click element    id=iconTrash
    click element    css=a.btn.blue

upload member file
    [Arguments]    ${member_file}
    open content    ${import_subscriber}    ${import_subscriber["button_add"]["add"]}
    click element    ${import_subscriber["button_add"]["import_button"]}
    select window    File Import
    choose file    name=uploadFile    ${member_file}
    select radio button    firstLineType    contains_mapping
    click element    id=iconUpload
    wait until element contains    id=content    File successfully imported.
    close window

refresh page until content visible
    [Arguments]    ${content}
    :for    ${index}    in range    20
    \    click element    css=div.applicationBarRefreshButtonIcon
    \    ${is_visible}=    run keyword and return status    current frame contains    ${content}
    \    exit for loop if    ${is_visible}

refresh page until import completes
    :for    ${index}    in range    100
    \    sleep    3
    \    click element    css=div.applicationBarRefreshButtonIcon
    \    ${status}=    run keyword and return status
    \    ...    table row should contain    ${import_subscriber["button_add"]["import_table"]}    1    DONE
    \    exit for loop if    ${status}
    \    ${status}=    run keyword and return status
    \    ...    table row should contain    ${import_subscriber["button_add"]["import_table"]}    1    DONE WITH ERROR(S)
    \    exit for loop if    ${status}
