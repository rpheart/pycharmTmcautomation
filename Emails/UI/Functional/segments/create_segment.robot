*** Settings ***
Documentation       uses an api to create a segment with only qa team emails
Default Tags        api    email    segment
Resource            ../../Utils/email_keywords.robot

*** Variables ***
${host}    http://${${env}["api_server"]}/apiccmd/services/rest

*** Test Cases ***
create_segment
    create a segment
