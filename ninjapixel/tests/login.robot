*** Settings ***
Documentation       Login
...     Sendo um administrador de catálogo
...     Quero me autenticar no sistema
...     Para que eu possa gerenciar o catálogo de produtos

Library     SeleniumLibrary

# Lego (peças e vc usa a criativade para montar o que vc quiser)

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "papito@ninjapixel.com" e "pwd123"
    Entao devo ser autenticado

Senha incorreta
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais com senha incorreta
    Entao devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

*** Keywords ***
Dado que eu acesso a página de login
    Open Browser    http://pixel-web:3000/login     chrome

Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Element   class:btn

Entao devo ser autenticado
    Wait Until Page Contains    Papito
    Close Browser

Quando eu submeto minhas credenciais com senha incorreta
    Input Text      id:emailId      papito@ninjapixel.com
    Input Text      id:passId       teste123
    Click Element   class:btn

Entao devo ver uma mensagem de alerta "${mensagem}"
    Wait Until Page Contains      ${mensagem}
    ${message}=                   Get WebElement                  class:alert-danger
    Should Contain                ${message.text}                 ${mensagem}
    Close Browser