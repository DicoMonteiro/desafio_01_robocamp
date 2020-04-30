*** Settings ***
Documentation       Cadastro de produtos
...         Sendo um administrador de catálogo
...         Quero cadastrar produtos
...         Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Test Setup      Open Session
Test Teardown   Close Session

*** Test Cases ***
Disponibilizar produto
    Dado que estou logado
    Quando eu faço o cadastro desse produto     dk.json
    Então devo ver este item no catálogo
