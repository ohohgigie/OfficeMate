*** Settings ***
Documentation   Test officeMate search api
Resource        ${CURDIR}/../resources/imports.robot
Resource        ${CURDIR}/../keywords/API/search_api.robot

*** Test Cases ***
user land into homepage and search success
    [Documentation]     To verify that after enter officemate url on web browser, user be able to land into homepae 
    ...    and login success using email
    [Tags]    success
    OfficeMate search api