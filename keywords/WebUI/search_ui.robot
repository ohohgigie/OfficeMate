*** Variables ***
${browser}                   chrome
${officeMate_url}            https://www.officemate.co.th/en
${officeMate_urlNopopup}     https://www.officemate.co.th/en/shop/back-to-office-1-31may22
${searchbox}                 //*[@data-testid="txt-SearchBar"]

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

Type search and enter
    [Arguments]    ${searchKey}
    Wait Until Element Is Visible    ${searchbox} 
    Input Text      ${searchbox}         ${searchKey}
    Capture Page Screenshot With Unique Name
    press keys      None     ENTER

verify searchbox success
    [Arguments]     ${searchKey}
    Wait Until Element Is Visible      //*[contains(text(),'product results found for "${searchKey}"')]
    Capture Page Screenshot With Unique Name

### Template ####
OfficeMate search ui
    [Arguments]   ${searchKey}
    Open Web Browser OfficeMate
    Type search and enter    ${searchKey}
    verify searchbox success    ${searchKey}
    [Teardown]    Close Browser
