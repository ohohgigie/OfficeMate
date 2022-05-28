*** Settings ***
Documentation   Test officeMate search api
Resource        ${CURDIR}/../resources/imports.robot
Resource        ${CURDIR}/../keywords/WebUI/search_ui.robot

*** Test Cases ***
user land into homepage and search with search name
    [Documentation]     To verify that after enter officemate url on web browser, user be able to search using search box
    [Tags]    success
    [Template]    OfficeMate search ui
    #searchkey
    Magic pen
    ไม้บรรทัด
    กระดาษ double A


