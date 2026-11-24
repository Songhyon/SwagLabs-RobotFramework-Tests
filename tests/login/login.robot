*** Settings ***
Documentation       Testing different credentials and checking that logging in with incorrect credentials isn't possible, locked users can't login and that normal users can access the website with correct credentials.
Library             RPA.Browser.Selenium


*** Variables ***
${url}         https://www.saucedemo.com/
${standard_username}    standard_user
${incorrect_username}    incorrect_user
${locked_username}    locked_out_user
${password}    secret_sauce

*** Test cases ***
Successful login
    Open the intranet website
    Set Selenium Speed    1
    Use Credentials  ${standard_username}  ${password}


Unsuccessful login with incorrect credentials
    Open the intranet website
    Set Selenium Speed    1
    Use Credentials    ${incorrect_username}  ${password}


Unsuccessful login with locked account
    Open the intranet website
    Set Selenium Speed    1
    Use Credentials    ${locked_username}  ${password}


*** Comments ***

Test case 1: 
Expected outcome: User can login and is redirected to the Swag Labs front store front page.

Test case 2:     
Expected outcome: User isn’t redirected to the Swag Labs front store front page, instead they must retry.

Test case 3: 
Expected outcome: Locked user account can't access the Swag Labs website and will recieve an error message explaining that their account is locked.


*** Keywords ***
Open the intranet website
    Open Available Browser    ${url}

Use Credentials
    [Arguments]    ${user}    ${pass}
    Input Text    id:user-name    ${user}
    Input Password    id:password    ${pass}
    Click Button    id:login-button