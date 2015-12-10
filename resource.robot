*** Settings ***
Library           BuiltIn
Library           Selenium2Library

*** Variables ***
${SEARCH KEY}          tv
${SERVER}              www.walmart.com
${BROWSER}             Chrome
${DELAY}               0
${LOGIN URL}           http://${SERVER}/account/login?returnUrl=%2Faccount%2F
${WELCOME URL}         https://${SERVER}/account/
${SEARCH RES TOYS}     http://${SERVER}/cp/
${SEARCH RES OTHERS}   http://${SERVER}/search/

*** Keywords ***	
Open Browser To Login Page
    Open Browser                    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed              ${DELAY}
    Wait Until Page Contains        Sign in to your account

Input Username
    [Arguments]    ${username}
    Input Text    login-username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    login-password    ${password}

Input Search
    [Arguments]    ${search}
    Input Text    search    ${search}

Submit Credentials
    Click Button    xpath=//button[@class="btn login-sign-in-btn js-login-sign-in btn-block-max-s btn-block-max-s"]
	
Empty Cart
    Click Element    xpath=//i[@class="wmicon wmicon-cart"]
	Wait Until Page Contains    Your cart:
	:FOR    ${i}    IN RANGE    9999
	\    ${var}    Run Keyword And Return Status    Page Should Not Contain Button    xpath=//button[@id="CartRemItemBtn"]
    \    Exit For Loop If    ${var}
	\    Click Button    xpath=//button[@id="CartRemItemBtn"]
	
Empty Cart and Close
    Click Link                  xpath=//a[@id="PACSubTtlItemLnk"]
	Wait Until Page Contains    Your cart:
	Click Button                xpath=//button[@id="CartRemItemBtn"]
	Sleep                       1s
	Close Browser