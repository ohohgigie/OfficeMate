*** Settings ***
Documentation   Test officeMate login api
Resource        ${CURDIR}/../resources/imports.robot
Resource        ${CURDIR}/../keywords/API/login_api.robot 

*** Test Cases ***
user land into homepage and login success with email
    [Documentation]     To verify that after enter officemate url on web browser, user be able to land into homepae 
    ...    and login success using email
    [Tags]    success
    OfficeMate login api success - email    vipavee.jijiejung@gmail.com    piggy789