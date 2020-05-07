
*** Settings ***
Documentation       Login
...     Sendo um administrador de catálogo
...     Quero me autenticar no sistema
...     Para que eu possa gerenciar o catálogo de produtos

Resource            ../resource/resource.robot
Test Setup          Nova sessão
Test Teardown       Encerrar sessão 


*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "papito@ninjapixel.com" e senha "pwd123"
    Entao devo ser autenticado

Login com senha inválida
    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "papito@ninjapixel.com" e senha "teste123"
    Então visulizo uma mensagem de erro "Usuário e/ou senha inválidos"

Login com email inválido
    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "teste@ninjapixel.com" e senha "pwd123"
    Então visulizo uma mensagem de erro "Usuário e/ou senha inválidos"

Login com senha branco
    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "papito@ninjapixel.com" e senha ""
    Então visulizo uma mensagem de alerta "Opps. Informe a sua senha!"

Login com email branco
    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "" e senha "pwd123"
    Então visulizo uma mensagem de alerta "Opps. Informe o seu email!"


*** Keywords ***
Dado que eu acesso a página de login
    Go To                             ${URL}/login

Quando solicito submeto minhas credenciais de login "${email}" e senha "${senha}"
    Login with                        ${email}    ${senha}

Entao devo ser autenticado
    Apresentar o nome do usuário        Papito

Então visulizo uma mensagem de alerta "${mensagem}"
    Apresentar mensagem de alerta        ${mensagem}

Então visulizo uma mensagem de erro "${mensagem}"
    Apresentar mensagem de erro        ${mensagem}