*** Settings ***
Resource    ../resources/import.robot
*** Keywords ***
GET Request 
    [Arguments]    ${url}        ${url_path}       ${headers}
     Create Session    mysession         ${url}
     ${response}=       GET On Session    mysession        ${url_path}       headers=${headers}     expected_status=anything
     [Return]    ${response}
#    Log To Console   ${response}
    # Log To Console   ${response.content} 
Post Requests
    [Arguments]          ${url}        ${url_path}        ${body}      ${headers}
    Create Session      Post        ${url}
    ${response}=        Post On Session      Post       ${url_path}     data=${body}            headers=${headers}       expected_status=anything
    [Return]    ${response}
#    Log To Console     ${response.content}
Delete Requests
    [Arguments]    ${url}        ${url_path}       ${headers}
    Create Session      delete       ${url}
    ${response}=        Delete On Session   delete      ${url_path}         expected_status=anything
    [Return]    ${response}
#    Log To Console      ${response}
Update Requests
    [Arguments]         ${url}        ${url_path}        ${body}      ${headers}
    Create Session      update          ${url}
    ${response}=        PUT On Session      update       ${url_path}     data=${body}            headers=${headers}       expected_status=anything
    [Return]    ${response}
#    Log To Console      ${response.content}
