*** Settings ***
Documentation   Test officeMate login webui
Resource        ${CURDIR}/../resources/imports.robot
Resource        ${CURDIR}/../keywords/WebUI/login_kw.robot   
Test Teardown   Close Browser

*** Test Cases ***
user land into homepage and login success with email
    [Documentation]     To verify that after enter officemate url on web browser, user be able to land into homepae 
    ...    and login success using email
    [Tags]    success
    OfficeMate login success - email    vipavee.jijiejung@gmail.com    piggy789
