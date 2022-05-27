*** Settings ***
Library           Selenium2Library
Library           Screenshot
Library           uuid
Test Teardown     Close Browser

*** Variables ***
${URL}                          http://the-internet.herokuapp.com/login
${browser}                      chrome
${LoginPage}                    //*[contains(text(),"Login Page")]
${valid_username}               tomsmith
${invalid_username}             tomholland
${valid_password}               SuperSecretPassword!
${Invalid_password}             Password!
${signinUsernameField}          //*[@id ="username"]
${signinPasswordField}          //*[@id ="password"]
${LoginBtn}                     //button[@type ="submit"]
${SuccessLoginMsg}              //*[contains(text(),"You logged into a secure area!")]
${LogoutBtn}                    //*[@class="button secondary radius"]//*[contains(text(),"Logout")]
${LogoutMsg}                    //*[contains(text(),"You logged out of the secure area!")]
${InvalidPassMsg}               //*[contains(text(),"Your password is invalid!")]
${UsernotFoundMsg}              //*[contains(text(),"Your username is invalid!")]


*** Test Cases ***
Login success
    When user Open Web Browser
    Then login page is shown
    When input username                ${valid_username}
    And input password                 ${valid_password}
    And Click 'Login' button
    Then Login success and the message secure area! is shown
    When Click the Logout button
    Then user Go back to the Login page and the message 'You logged out of the secure area!'is shown

Login failed - Password incorrect
    When user Open Web Browser
    Then login page is shown
    When input username                ${valid_username}
    And input password                 ${Invalid_password}
    And Click 'Login' button
    Then Login failed and the message 'Your password is invalid!' is shown

Login failed - Username not found
    When user Open Web Browser
    Then login page is shown
    When input username                ${invalid_username}
    And input password                 ${Invalid_password}
    And Click 'Login' button
    Then Login failed and the message 'Your username is invalid!' is shown

*** Keywords ***
user open Web Browser
    Open Browser	${URL}    ${browser}
    Set Window Size    1920    1080
    Capture Page Screenshot With Unique Name

login page is shown
    Wait Until Element Is Visible       ${LoginPage}      20
    Capture Page Screenshot With Unique Name

input username
    [Arguments]    ${username}
    Wait Until Element Is Visible       ${signinUsernameField}      20
    Input Text      ${signinUsernameField}      ${username}
    Capture Page Screenshot With Unique Name

input password
    [Arguments]    ${password}
    Wait Until Element Is Visible       ${signinPasswordField}      20
    Input Text      ${signinPasswordField}      ${password}
    Capture Page Screenshot With Unique Name

Click 'Login' button
    Wait Until Element Is Visible       ${LoginBtn}      20
    click element   ${LoginBtn}
    Capture Page Screenshot With Unique Name

Login success and the message secure area! is shown
    Sleep  3s
    Wait Until Element Is Visible       ${SuccessLoginMsg}         20
    Capture Page Screenshot With Unique Name

Click the Logout button
    Wait Until Element Is Visible       ${LogoutBtn}      20
    click element   ${LogoutBtn}
    Capture Page Screenshot With Unique Name

user Go back to the Login page and the message 'You logged out of the secure area!'is shown
    Wait Until Element Is Visible       ${LoginPage}      20
    Wait Until Element Is Visible       ${LogoutMsg}      20
    Capture Page Screenshot With Unique Name

Login failed and the message 'Your password is invalid!' is shown
    Wait Until Element Is Visible       ${InvalidPassMsg}      20
    Capture Page Screenshot With Unique Name

Login failed and the message 'Your username is invalid!' is shown
    Wait Until Element Is Visible       ${UsernotFoundMsg}      20
    Capture Page Screenshot With Unique Name

