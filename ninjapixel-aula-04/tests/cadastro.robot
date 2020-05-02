*** Settings ***
Documentation       Cadastro de produtos
...         Sendo um administrador de catálogo
...         Quero cadastrar produtos
...         Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Suite Setup     Login Session
Suite Teardown  Close Session

Test Teardown   After Test

*** Test Cases ***
Disponibilizar produto
    Dado que eu tenho um novo produto   dk.json
    Quando eu faço o cadastro desse produto
    Então devo ver este item no catálogo

Produto duplicado
    Dado que eu tenho um novo produto   master.json
    Mas este produto já foi cadastrado
    Quando eu faço o cadastro desse produto
    Então devo ver a mensagem de alerta     Oops - Este produto já foi cadastrado!

Nome não informado
    Dado que eu tenho um novo produto   alexkid.json
    Quando eu faço o cadastro desse produto
    Então devo ver a mensagem de alerta     Oops - Informe o nome do produto!

Categoria não selecionada
    Dado que eu tenho um novo produto   kidchamelon.json
    Quando eu faço o cadastro desse produto
    Então devo ver a mensagem de alerta     Oops - Selecione uma categoria!

Preço não informado
    Dado que eu tenho um novo produto   shimobi.json
    Quando eu faço o cadastro desse produto
    Então devo ver a mensagem de alerta     Oops - Informe o preço também!
