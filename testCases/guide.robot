*** Settings ***
Library     RequestsLibrary
Library     Collections
*** Variable ***

*** Keywords ***

*** Test Cases ***
TC1 Post
    Create Session       post_session       http://localhost:3000/
    ${header}=          Create Dictionary       Content-Type=application/json
    ${data}=            Create Dictionary       name=MyPost     location=Koh PIC
    Post ON Session     post_session        company     json=${data}        expected_status=anything
