
*** Settings ***
Documentation    TS-07: Successful checkout with valid information.
Library          RPA.Browser.Selenium

*** Variables ***
${URL}            https://www.saucedemo.com 
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${FIRST_NAME}     Test
${LAST_NAME}      User
${POSTAL_CODE}    00100

*** Tasks ***
TS-07: Successful checkout with valid information
    Open the Swag Labs website
    Log in
    Add product to cart
    Open shopping cart
    Start checkout
    Enter checkout information
    Review and finish order
    Verify order confirmation

*** Keywords ***


Open the Swag Labs website
    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    profile.password_manager_leak_detection=${False}
    Open Available Browser    ${URL}    browser_selection=chrome    preferences=${prefs}


Log in
    Input Text        id:user-name       ${USERNAME}
    Input Password    id:password        ${PASSWORD}
    Click Button      id:login-button

Add product to cart
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-backpack


Open shopping cart
    Click Element    class:shopping_cart_link
    Wait Until Element Is Visible    id:checkout


Start checkout
    Click Button    id:checkout
    Wait Until Location Contains    checkout-step-one.html

Enter checkout information
    Wait Until Element Is Visible    id:first-name
    Input Text    id:first-name    ${FIRST_NAME}
    Input Text    id:last-name     ${LAST_NAME}
    Input Text    id:postal-code   ${POSTAL_CODE}
    Click Button    id:continue


Review and finish order
    Wait Until Element Is Visible    id:finish
    Page Should Contain    Sauce Labs Backpack
    Click Button    id:finish

Verify order confirmation
    Wait Until Page Contains    Thank you for your order!
    Page Should Contain    Thank you for your order!
    Close Browser
