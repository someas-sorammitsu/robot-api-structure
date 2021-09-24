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

Post Data
    [Arguments]
    ...     ${name}
    ...     ${location}
    ${headers}=     Create Dictionary
     ...      Content-Type=application/json
     ${json}      Catenate
     ...	{
     ...		"name":"${name}",
     ...        "location":"${location}"
     ...		}
     Log    ${json}
    ${res}=     Post Requests       ${base_url}          ${path}        ${json}         ${headers}
#    Log         ${res.json()}
    [Return]        ${res}



