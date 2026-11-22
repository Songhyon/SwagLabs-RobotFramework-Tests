*** Settings ***
Documentation     shopping cart tests (ts-05, ts-06). Author:Anthony Ha
Resource    ../resources/common_keywords.robot
Test Setup    Open Swag Labs And Login
Test teardown    Close Browser

*** Test Cases ***
TS-05 add product to cart
    [Documentation]    Positive: the product is added and the cart icon shows 1
    [Tags]    cart    positive
    Add backpack to cart
    Element Text Should Be       css:.shopping_cart_badge    1
    Element Should Be Visible    id:remove-sauce-labs-backpack
    Open cart
    Element Text Should Be       css:.inventory_item_name    ${PRODUCT_NAME}

TS-06 Remove Product From Cart
    [Documentation]    Positive: the product disappears from the cart and the number disappears
    [Tags]    cart    positive
    Add Backpack To Cart
    Open Cart
    Click Button    id:remove-sauce-labs-backpack
    Page Should Not Contain Element    css:.cart_item
    Page Should Not Contain Element    css:.shopping_cart_badge

Empty Cart Shows No Products
    [Documentation]    Negative: nothing was added, so the cart has no number and no products
    [Tags]    cart    negative
    Page Should Not Contain Element    css:.shopping_cart_badge
    Open Cart
    Page Should Not Contain Element    css:.cart_item

*** Keywords ***
Add Backpack To Cart
    Click Button    id:add-to-cart-sauce-labs-backpack

Open Cart
    Click Element    css:.shopping_cart_link