*** Settings ***
Resource    ../commands/commands.robot
Resource    ../resources/url.robot
Resource    ../resources/path_url.robot
*** Keywords ***
Get API Request
    ${headers}=     Create Dictionary
    ...     Accept=application/json
    ...     Content-Type=application/json
    ${response}=      GET Request           ${base_url}      ${path}      ${headers}
    
Get Staff API Request
    ${headers}=     Create Dictionary
    ...     Accept=application/json
    ...     Content-Type=application/json
    ${response}=      GET Request           ${base_url}      ${staff}      ${headers}

