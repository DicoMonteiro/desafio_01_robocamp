*** Settings ***
Documentation        Cadastro de Produtos no Catálogo
...                  Sendo um administrador de catálogo
...                  Quero cadastrar produtos
...                  Para que eu possa disponibiliza-los 
Resource             ../resources/actions.robot

Suite Setup           Login session
Suite Teardown        Close session

Test Teardown         After Test


*** Test Cases ***
Disponibilizar o produto
    [tags]    smoke
    Dado que eu tenho um novo produto    dk.json
    Quando eu faço o cadastro desse produto
    Então visualizo este item no catálogo

Produto duplicado
    [tags]    smoke
    Dado que eu tenho um novo produto    master.json
    Mas este produto já foi cadastrado
    Quando eu faço o cadastro desse produto
    Então devo ver a mensagem de error   Oops - Este produto já foi cadastrado!

Nome não informado
    [tags]    smoke
    Dado que eu tenho um novo produto   alexkid.json
    Quando eu faço o cadastro desse produto
    Então devo ver a mensagem de alerta     Oops - Informe o nome do produto!

Preço não informado
    [tags]    smoke
    Dado que eu tenho um novo produto   shimobi.json
    Quando eu faço o cadastro desse produto
    Então devo ver a mensagem de alerta     Oops - Informe o preço também!

Categoria não selecionada
    [tags]    smoke
    Dado que eu tenho um novo produto   kidchamelon.json
    Quando eu faço o cadastro desse produto
    Então devo ver a mensagem de alerta     Oops - Selecione uma categoria!
