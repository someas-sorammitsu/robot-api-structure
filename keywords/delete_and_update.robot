*** Settings ***
Resource    ../commands/commands.robot
Resource    ../resources/url.robot
Resource    ../resources/path_url.robot
*** Keywords ***
Test Delete
    [Arguments]
    ...    ${id}
    ${headers}=       Create Dictionary    
    ...    Content-Type=application/json; charset=utf-8
   
    ${resp}=    Delete Requests        ${base_url}          ${staff}/${id}        ${headers}

Update Data
    [Arguments]
    ...    ${id}
    ...    ${name}
    ...    ${location}
    ${headers}=    Create Dictionary    
    ...    Content-Type=application/json; charset=utf-8
    ${json}      Catenate 
    ...    {
    ...    "name": "${name}",
    ...    "location": "${location}"
    ...    }
    ${resp}=        Update Requests        ${base_url}          ${path}/${id}        ${json}         ${headers}
    [Return]    ${resp}
    Log To Console    ${resp}
    Log To Console    ${resp.content}
*** Test Case ***
Delete Data
    Test Delete       2
    KTY Update
Update Data Test
    Update Data    12    Cambodia    Phon Penh
    Update Data    13    Thailand     Bank Kork