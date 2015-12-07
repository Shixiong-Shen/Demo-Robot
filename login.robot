*** Settings ***
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    shiixiong.shen@gmail.com
    Input Password    assignment1
    Submit Credentials
    BuiltIn.Wait Until Keyword Succeeds    2    5    Welcome Page Should Be Open
    Input Search    tv
