*** Settings ***
Documentation   uses an api to create a segment with only qa team emails
Default Tags    performance
Resource        ../Utils/api_keywords.robot

*** Variables ***
${host}  http://${${env}["api_server"]}/apiccmd/services/rest
${total_segments}  1000

*** Test Cases ***
create_many_segments
  :for  ${n}  in range  ${total_segments}
  \  log to console  ${n}
  \  open connection
  \  create segment