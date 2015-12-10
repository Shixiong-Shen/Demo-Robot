*** Settings ***
Resource                               resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username                     shiixiong.shen@gmail.com
    Input Password                     assignment1
    Submit Credentials
    Wait Until Page Contains           Welcome to your Walmart account!
    Empty Cart
	
Perform Search
    Input Search                       ${SEARCH KEY}
    Click Button                       xpath=//button[@class="searchbar-submit js-searchbar-submit" and @type="submit"]
    Run keyword if                     '${SEARCH KEY}'!='toys'    Location Should Contain    ${SEARCH RES OTHERS}
    Run keyword if                     '${SEARCH KEY}'=='toys'    Location Should Contain    ${SEARCH RES TOYS}
	
Add To Card
    Run keyword if                     '${SEARCH KEY}'!='toys'    Click Image    xpath=//img[@class="product-image"][1]
    Run keyword if                     '${SEARCH KEY}'=='toys'    Click Image    xpath=//img[@class="product-image js-product-image tile-row img-hide-alt"][1]
    Run keyword if                     '${SEARCH KEY}'=='iphone'  Click Element  xpath=//span[@title="Silver"]
    Sleep                              1.5s
    Click Button                       xpath=//button[@id="WMItemAddToCartBtn"]
    Wait Until Page Contains Element   xpath=//a[@id="PACSubTtlItemLnk" and contains(text(),'(1 item)')]    10
    Empty Cart and Close