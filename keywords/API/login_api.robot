*** Variables ***
${browser}               chrome
${officeMate_url}        https://www.officemate.co.th

*** Keywords ***
Send request to login api   
    [Arguments]    ${email}    ${password}
    ${headers}=    Create dictionary    Content-Type=application/json
    ${body}=    Create dictionary    email=${email} 
    ...    password=${password}
    log    ${body}
    Create session    session    ${officeMate_url}    disable_warnings=1
    ${response}=    Post Request    session    /api/login   data=${body}    headers=${headers} 
    Delete All Sessions 
    Set test variable    ${response}    ${response}

HTTP status should be '${expected_code}'
    [Documentation]    Verify response http ststus with expected code
    ${json_response}=    To Json    ${response.text}
    should be equal as integers    ${response.status_code}    ${expected_code}
    Set test variable    ${json_response}    ${json_response}

Verify response login success
    Should Not Be Empty    ${json_response['token']}

### template ###
OfficeMate login api success - email
    [Arguments]    ${email}    ${password}
    Send request to login api     ${email}    ${password}
    HTTP status should be '200'
    Verify response login success