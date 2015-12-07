*** Settings ***
Library           Selenium2Library
Library           OperatingSystem

*** Variables ***
${SERVER}         www.walmart.com
${BROWSER}        Chrome
${DELAY}          0.5
${VALID USER}     shiixiong.shen@gmail.com
${VALID PASSWORD}    assignment1
${LOGIN URL}      http://${SERVER}/account/login?returnUrl=%2Faccount%2F
${WELCOME URL}    https://${SERVER}/account/
${ERROR URL}      http://${SERVER}/error.html
${BIN_DIR}        C:\Python27\Scripts

*** Keywords ***	
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Walmart

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    login-username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    login-password    ${password}

Submit Credentials
    Click Button    xpath=//button[@class="btn login-sign-in-btn js-login-sign-in btn-block-max-s btn-block-max-s"]

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Walmart
