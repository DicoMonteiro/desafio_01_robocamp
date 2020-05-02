
*** Settings ***
Documentation       Suite de testes para validar o login do sistema Pixel
...                 Sendo um administrador de catálogo
...                 Quero me autenticar no sistema
...                 Para que eu possa gerenciar o catálogo de produtos

Resource            ../resources/actions.robot

Suite Setup           Open session
Suite Teardown        Close session

Test Teardown         After Test

*** Test Cases ***
Login com sucesso
    [tags]    smoke
    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "didico@ninjapixel.com" e senha "pwd123"
    Então visualizo o nome do usuário "Adriano" no dashboard

    [Teardown]        After Test WCLS

Login com senha inválida
    [tags]    smoke
    [Template]    Tentativa de login
    didico@ninjapixel.com    teste123    Usuário e/ou senha inválidos

Login com email inválido
    [tags]    smoke
    [Template]    Tentativa de login
    teste@ninjapixel.com    pwd123    Usuário e/ou senha inválidos

Login com senha branco
    [tags]    smoke
    [Template]    Tentativa de login
    didico@ninjapixel.com    ${EMPTY}    Opps. Informe a sua senha!

Login com email branco
    [tags]    smoke
    [Template]    Tentativa de login
    ${EMPTY}     pwd123    Opps. Informe o seu email!


*** Keywords ***
Tentativa de login
    [Arguments]      ${email}    ${senha}    ${mensagem}

    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "${email}" e senha "${senha}"
    Então visulizo uma mensagem de alerta "${mensagem}"
