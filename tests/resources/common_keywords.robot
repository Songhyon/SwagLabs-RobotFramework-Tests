*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/swaglabs_variables.robot

*** Keywords ***
Open Swag Labs
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login As Standard User
    Input Text        id:user-name      ${VALID_USER}
    Input Password    id:password       ${PASSWORD}
    Click Button      id:login-button
    Wait Until Page Contains Element    css:.inventory_list

Open Swag Labs And Login
    Open Swag Labs
    Login As Standard User