*** Settings ***
Documentation
Resource            ../../Utils/api_keywords.robot
Default Tags        api    segment
Test Setup          run keywords
...                 open connection
...                 AND    create segment
Test Teardown       close connection and delete test data

*** Variables ***
${host}    http://${server}/apiccmd/services/rest

# segment variables
${xml_file}    ${EXECDIR}/Emails/API/Utils/Resources/ccmd_segment.xml

*** Test Cases ***
create_segment
    should not be empty    ${segment_id}

delete_segment
    # delete segment
    ${delete_segment}=    delete request    host    /segmentationservice/${token}/segment/${segment_id}
    run keyword if    ${delete_segment.status_code} != 200    fail    ${delete_segment.content}
    # get recent segments
    ${search_segment}    get request    host    /segmentationservice/${token}/segment/list/1/items/10
    run keyword if    ${search_segment.status_code} != 200    fail    ${search_segment.content}
    ${segment_id_list}=    get xml content list    ${search_segment.content}
    should not contain    ${segment_id_list}    ${message_id}

update_segment
    # update segment
    ${body}=    set variable    <?xml version="1.0" encoding="utf-8"?><segmentation><description>updated</description><name>Updated QA Automation Segment</name><sampleType>ALL</sampleType></segmentation>
    ${headers}=    create dictionary    content-type=text/xml    charset=UTF-8
    ${update_segment}=    post request    host    /segmentationservice/${token}/segment/${segment_id}    data=${body}    headers=${headers}
    run keyword if    ${update_segment.status_code} != 200    fail    ${update_segment.content}
    # get recent segments
    ${search_segment}    get request    host    /segmentationservice/${token}/segment/list/1/items/10
    run keyword if    ${search_segment.status_code} != 200    fail    ${search_segment.content}
    ${segment_id_list}=    get xml content list    ${search_segment.content}
    should contain    ${segment_id_list}    ${segment_id}
