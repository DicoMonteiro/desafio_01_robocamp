*** Settings ***
Documentation        Cadastro de Produtos no Catálogo
...                  Sendo um administrador de catálogo
...                  Quero cadastrar produtos
...                  Para que eu possa disponibiliza-los 
Resource             ../resources/actions.robot
# Resource             ../resource/pages/LoginPage.robot

# Library              OperatingSystem  

Test Setup           Open session
Test Teardown        Close session


# *** Variables ***
# &{dk}    name=Donkey Kong    category=Super Nintendo    price=49.99    desc=Um jogo muito divertido



*** Test Cases ***
Disponibilizar o produto
    [tags]    smoke
    Dado que eu estou logado
    # E que eu tenha um novo produto ${dk}
    # ...    Donkey Kong    Super Nintendo    49.99    Um jogo muito divertido
    # Quando eu faço o cadastro desse produto    ${dk}
    Quando eu faço o cadastro desse produto      dk.json
    Então visualizo este item no catálogo


# *** Keywords ***
# Dado que eu estou logado
#     # LoginPage.Login with    didico@ninjapixel.com    pwd123
#     Login with    didico@ninjapixel.com    pwd123

# E que eu tenha um novo produto
#     [Arguments]    ${name}    ${category}    ${price}    ${desc}
#     Set Test Variable    ${name}
#     Set Test Variable    ${category}
#     Set Test Variable    ${price}
#     Set Test Variable    ${desc}

# Quando eu faço o cadastro desse produto
#     # [Arguments]        ${product}
#     [Arguments]        ${json_file}
    
#     # O cógdigo abaixo vai pegar o arquivo json, contendo as massas de testes
#     ${product_file}=    Get File    tests/fixtures/${json_file}
#     # O código abaixo vai fazer a conversão em arquivo json
#     ${product_json}=    Evaluate    json.loads($product_file)    json

#     # Wait Until Element Is Visible    class:product-add
#     Click Element                      class:product-add
    # Wait Until Element Is Visible    css:input[name=title]
    # Input Text                       css:input[name=title]        ${product['name']}
    # Click Element                    css:input[placeholder=Gategoria]
    # Log To Console                   product['category']
    # Click Element                    xpath://li//span[text()='${product['category']}']
    # Input Text                       css:input[name=price]        ${product['price']}
    # # Input Text                       css:input[placeholder="Adicione aqui..."]    ${product.}
    # Input Text                       css:textarea[name=description]    ${product['desc']}
    # Input Text                         css:input[name=title]        ${product_json['name']}
    # Click Element                      css:input[placeholder=Gategoria]
    # # Log To Console                   product_json['cat']
    # # Click Element                      xpath://span[text()='${product_json['cat']}']
    # # Sleep        1
    # # Wait Until Element Contains        xpath://li/span      product_json['cat']  
    # # Wait Until Page Contains           product_json['cat']

    # # Usando o Set Selenium Speed para poder controlar o tempo de iteração com os elementos, e ter tempo hábil de preencher
    # # Set Selenium Speed    1
    # Wait Until Element Is Visible      class:el-select-dropdown__list
    # Click Element                      xpath://li/span[contains(text(), '${product_json['cat']}')]
    # # Set Selenium Speed    0
    # # Sleep        1
    # Input Text                         css:input[name=price]        ${product_json['price']}

    # Implementado o FOREACH para pegar do Array os elementos e inserir no campo um de cada vez
    # : FOR    ${item}    IN    @{product_json['producers']}

    # # \    Log To Console    ${item}
    # \    Log                  ${item}
    # \    Input Text        class:producers    ${item}
    # \    Press Keys        class:producers    TAB

    # # Input Text                       css:input[placeholder="Adicione aqui..."]    ${product.desc}
    # Input Text                         css:textarea[name=description]    ${product_json['desc']}
    # Sleep        5
    # Click Element                      id:create-product

    # # Permitindo que outros steps utilizem a variavel instanciada dentro desse step
    # Set Test Variable    ${product_json}

# Então visualizo este item no catálogo

#     Wait Until Element Is Visible        class:table
#     Wait Until Element Contains          class:table        ${product_json['name']}
#     Table Should Contain                 class:table        ${product_json['name']}    