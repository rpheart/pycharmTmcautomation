*** Settings ***
Documentation
Resource            ../../Utils/api_keywords.robot
Default Tags        api    email
Test Setup          run keywords    open connection
...                 AND    create template
Test Teardown       close connection and delete test data

*** Variables ***
${host}             http://${server}/apitransactional/services/rest

# template variables
${xml_file}         ../../Utils/Resources/email_template.xml
${name}             TemplateName
${description}      Description
${subject}          Hello
${from}             John%20Smith
${fromEmail}        john.smith%40smartfocus.com
${to}               Jane%20Scott
${encoding}         UTF-8
${replyTo}          No%20Reply
${replyToEmail}     noreply%40smartfocus.com
${type}             TRANSACTIONAL

*** Test Cases ***
create_template_get
    should not be empty    ${template_id}

#create_template_post
#    # create template using post
#    ${template}=    get file    ${xml_file}
#    ${headers}=    create dictionary    content-type=application/x-www-form-urlencoded
#    ${create_template}=    post request    host    /template/create/${token}    data=${template}    headers=${headers}
#    run keyword unless    ${create_template.ok}    fail    ${create_template.content}
#    ${post_template_id}=    get xml content    ${create_template.content}
#    should not be empty    ${post_template_id}

delete_template
    # delete template
    ${delete_template}=    get request    host    /template/delete/${token}/${template_id}
    run keyword unless    ${delete_template.ok}    fail    ${delete_template.content}
    # get last templates
    ${search_template}    get request    host    /template/getLastTemplates/${token}/transactional/10
    run keyword unless    ${search_template.ok}    fail    ${search_template.content}
    ${template_id_list}=    get xml content list    ${search_template.content}
    should not contain    ${template_id_list}    ${template_id}

update_template
    # update template
    ${update_template}=    get request    host    /template/update/${token}/${template_id}/name/updatedtestname
    run keyword unless    ${update_template.ok}    fail    ${update_template.content}
    # get template
    ${get_template}=    get request    host    /template/get/${token}/${template_id}
    run keyword unless    ${get_template.ok}    fail    ${get_template.content}
    ${get_template_name}=    get xml content    ${get_template.content}    tag=*name
    should be equal as strings    ${get_template_name}    updatedtestname

clone_template
    # clone template
    ${clone_template}=    get request    host    /template/clone/${token}/${template_id}/templateclone
    run keyword unless    ${clone_template.ok}    fail    ${clone_template.content}
    ${clone_template_id}=    get xml content    ${clone_template.content}
    # get template
    ${get_clone_template}=    get request    host    /template/get/${token}/${clone_template_id}
    run keyword unless    ${get_clone_template.ok}    fail    ${get_clone_template.content}
    ${get_clone_template_name}=    get xml content    ${get_clone_template.content}    tag=*name
    should be equal as strings    ${get_clone_template_name}    templateclone
    # delete clone template
    ${delete_template}=    get request    host    /template/delete/${token}/${clone_template_id}
    run keyword unless    ${delete_template.ok}    fail    ${delete_template.content}
