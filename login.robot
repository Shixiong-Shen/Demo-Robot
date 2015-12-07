*** Settings ***
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    shiixiong.shen@gmail.com
    Input Password    assignment1
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
