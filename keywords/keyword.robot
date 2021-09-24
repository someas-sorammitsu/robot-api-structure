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

Update Data
    [Arguments]
    ...     ${id}
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
    ${res}=     Update Requests       ${base_url}          ${path}/${id}        ${json}         ${headers}
#    Log         ${res.json()}
    [Return]        ${res}
Delete Data
    [Arguments]
    ...     ${id}
    ${headers}=     Create Dictionary
     ...     Content-Type=application/json
     ${response}=   Delete Requests           ${base_url}      ${path}/${id}     ${headers}


Login Mountbank
    [Arguments]
    ...     ${username}
    ...     ${password}
    ${headers}=     Create Dictionary
     ...      Content-Type=application/json
     ...      charset=utf-8
     ${json}      Catenate
     ...    {
     ...      "data":{
     ...        "username": "${username}",
     ...        "password": "${password}",
     ...        "gender": "male",
     ...        "phone": "phone",
     ...        "amount": 1,
     ...        "mb":"Hello MB Bank"
     ...      }
     ...    }
     Log    ${json}
    ${response}=     Post Requests      ${mountbank}          ${mb_test}        ${json}         ${headers}
    Should Be Equal As Integers     ${response.status_code}       200       Message code that response [${response.status_code}]
    Check Response      ${response.json()}
Check Response
    [Arguments]     ${resp}
    Log To Console      ${resp}
    ${status}    Get From Dictionary         ${resp}        status
    ${code}      Get From Dictionary         ${status}       code
    ${message}      Get From Dictionary         ${status}      message
    ${Username}      Get From Dictionary         ${status}      Username
    ${Password}      Get From Dictionary         ${status}      Password
    Should Be Equal As Strings        ${code}           success
    Should Be Equal As Strings        ${message}        success
    Should Be Equal As Strings        ${Username}       someas
    Should Be Equal As Strings        ${Password}       password
