*** Settings ***
Documentation   Test officeMate login api
Resource        ${CURDIR}/../resources/imports.robot
Resource        ${CURDIR}/../keywords/API/login_api.robot 

*** Test Cases ***
user land into homepage and login success with email
    [Documentation]     To verify that user beablt to send request to search api
    [Tags]    success
    OfficeMate login api 