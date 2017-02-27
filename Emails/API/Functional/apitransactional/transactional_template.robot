*** Settings ***
Documentation
Resource            Emails/API/Utils/api_keywords.robot
Default Tags        api    email
Test Setup          Run Keywords    Open Connection
...                 AND    Create Template
Test Teardown       Close Connection And Delete Test Data

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
Create Template Get
    Should Not Be Empty    ${template_id}

#Create Template Post
#    # Create template using POST
#    ${template}=    Get File    ${xml_file}
#    ${headers}=    Create Dictionary    content-type=application/x-www-form-urlencoded
#    ${create_template}=    Post Request    host    /template/create/${token}    data=${template}    headers=${headers}
#    run keyword unless    ${create_template.ok}    fail    ${create_template.content}
#    ${post_template_id}=    Get XML Content    ${create_template.content}
#    Should Not Be Empty    ${post_template_id}

Delete Template
    # Delete Template
    ${delete_template}=    Get Request    host    /template/delete/${token}/${template_id}
    run keyword unless    ${delete_template.ok}    fail    ${delete_template.content}
    # Get Last Templates
    ${search_template}    Get Request    host    /template/getLastTemplates/${token}/TRANSACTIONAL/10
    run keyword unless    ${search_template.ok}    fail    ${search_template.content}
    ${template_id_list}=    Get XML Content List    ${search_template.content}
    Should Not Contain    ${template_id_list}    ${template_id}

Update Template
    # Update Template
    ${update_template}=    Get Request    host    /template/update/${token}/${template_id}/name/UpdatedTestName
    run keyword unless    ${update_template.ok}    fail    ${update_template.content}
    # Get Template
    ${get_template}=    Get Request    host    /template/get/${token}/${template_id}
    run keyword unless    ${get_template.ok}    fail    ${get_template.content}
    ${get_template_name}=    Get Xml Content    ${get_template.content}    tag=*name
    Should Be Equal As Strings    ${get_template_name}    UpdatedTestName

Clone Template
    # Clone Template
    ${clone_template}=    Get Request    host    /template/clone/${token}/${template_id}/TemplateClone
    run keyword unless    ${clone_template.ok}    fail    ${clone_template.content}
    ${clone_template_id}=    Get XML Content    ${clone_template.content}
    # Get Template
    ${get_clone_template}=    Get Request    host    /template/get/${token}/${clone_template_id}
    run keyword unless    ${get_clone_template.ok}    fail    ${get_clone_template.content}
    ${get_clone_template_name}=    Get XML Content    ${get_clone_template.content}    tag=*name
    Should Be Equal As Strings    ${get_clone_template_name}    TemplateClone
    # Delete Clone Template
    ${delete_template}=    Get Request    host    /template/delete/${token}/${clone_template_id}
    run keyword unless    ${delete_template.ok}    fail    ${delete_template.content}
