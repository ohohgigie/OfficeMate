*** Variables ***
${browser}                   chrome
${officeMate_url}            https://www.officemate.co.th/en
${officeMate_urlNopopup}     https://www.officemate.co.th/en/shop/back-to-office-1-31may22
${officeMate_logo}           //*[@data-testid="lnk-viewMainHeader-OFMHeaderLogo"]
${searchbar}                 //*[@data-testid="txt-SearchBar"]
${HeroBaner}                 //*[@data-testid="img-viewPanelBannerListItem-HeroBannerImage9900"]
${Home_login_btn}            //*[@data-testid="btn-viewMainHeader-GuestLogin"]
${login_btn}                 //*[@id="lnk-RegisterPage-Login"]
${cart_btn}                  //*[@data-testid="btn-MiniCart"]
${email_inputText}           //*[@id="txt-loginForm-email"]
${password_inputText}        //*[@id="txt-loginForm-password"]
${submit_btn}                //*[@id="btn-LoginFormSection-submitButton"]
${userSignedIn}              //*[@id="app"]/div/div[1]/div/div[1]/div[3]/div[1]/div[1]

*** Keywords ***
Open Web Browser OfficeMate
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --dns-prefetch-disable
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    ${prefs}    Create Dictionary   credentials_enable_service=${false}  
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Open Browser	${officeMate_url}    ${browser}    options=${chrome_options} 
    Set Window Size    1920    1080
    Go to    ${officeMate_urlNopopup}
    Capture Page Screenshot With Unique Name

User login success
    [Arguments]    ${email}    ${password}
    Click Element   ${Home_login_btn}
    Wait Until Element Is Visible    ${login_btn}
    Click Element   ${login_btn}
    Wait Until Element Is Visible    ${email_inputText}
    Input Text      ${email_inputText}          ${email}
    Input Text      ${password_inputText}       ${password}
    Capture Page Screenshot With Unique Name
    Click Element   ${submit_btn}
    Capture Page Screenshot With Unique Name

Verify user login successfully
    Go to    ${officeMate_urlNopopup}
    Wait Until Element Is Visible     ${userSignedIn}
    Capture Page Screenshot With Unique Name

### Template ####
OfficeMate login success - email
    [Arguments]    ${email}    ${password}
    Open Web Browser OfficeMate
    User login success    ${email}    ${password}
    Verify user login successfully

