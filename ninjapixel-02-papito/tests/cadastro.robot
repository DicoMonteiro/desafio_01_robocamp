*** Settings ***
Documentation       Cadastro de produtos
...         Sendo um administrador de catálogo
...         Quero cadastrar produtos
...         Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Library     OperatingSystem

Test Setup      Open Session
Test Teardown   Close Session

*** Test Cases ***
Disponibilizar produto
    Dado que estou logado
    Quando eu faço o cadastro desse produto     dk.json
    Devo ver este item no catálogo

*** Keywords ***
Dado que estou logado
    Login With      didico@ninjapixel.com   pwd123

Quando eu faço o cadastro desse produto
    [Arguments]     ${json_file}

    ${product_file}=     Get File    tests/fixtures/${json_file}
    ${product_json}=     Evaluate    json.loads($product_file)   json

    Click Element       class:product-add
    Input Text          css:input[name=title]      ${product_json['name']}

    Click Element       css:input[placeholder=Gategoria]
    Click Element       xpath://li/span[text()='${product_json['cat']}']

    Input Text          css:input[name=price]      ${product_json['price']}
    Sleep           5