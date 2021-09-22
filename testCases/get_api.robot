*** Settings ***
Resource    ../keywords/keyword.robot
Resource    ../resources/import.robot
*** Test Cases ***
TC1 Get Request 
    Create Session    mysesion    http://localhost:3000/
    ${resp}=        GET On Session    mysesion    company    
    Log To Console    ${resp}   
    Log To Console    ${resp.content}
TC2 Get Request
    Get API Request
TC3 Get API staff
    Get Staff API Request