*** Variables ***
${browser}               chrome
${officeMate_url}        https://www.officemate.co.th

*** Keywords ***
Send request to search 
    ${headers}=    Create dictionary    Content-Type=application/json
    Create session    session    ${officeMate_url}    disable_warnings=1
    ${response}=       Get request    session    /api/search/products?sku[]=$in&sku[]=OFMM003212,OFM3001312,OFM8003823,OFMY011652,OFM9005365,OFM9001418,OFM0010037,OFMA010470,OFMA010213,OFM8003076,OFM0008989,OFMY006352,OFM0010450,MKP0549695,OFMY010539,OFM0009054,OFM4006314,OFMM002795,OFMA012816,OFMY011922,OFM0009721,OFM0301620,MKP0223320,OFM8031660,OFMM002106,OFM0000724,OFMY011658,OFM0020730,OFM5010111,OFMM002799&visibility=4&stock.is_in_stock=1   headers=${headers}
    Delete All Sessions
    Set test variable    ${response}    ${response}
    Log    ${response.text}

HTTP status should be '${expected_code}'
    [Documentation]    Verify response http ststus with expected code
    ${json_response}=    To Json    ${response.text}
    should be equal as integers    ${response.status_code}    ${expected_code}
    Set test variable    ${json_response}    ${json_response}

### template ###
OfficeMate search api
    Send request to search
    HTTP status should be '200'