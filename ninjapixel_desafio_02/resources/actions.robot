*** Settings ***
Documentation    Resource é o arquivo para ter o controle das interações e validações
...              Semelhante ao Page Object para estruturar a base de utilização dos
...              keywords do Robot Framework

Library    libs/db.py
Library    SeleniumLibrary

Library    OperatingSystem

Resource    pages/LoginPage.robot
Resource    pages/BasePage.robot
Resource    pages/Sidebar.robot
Resource    pages/ProductPage.robot
Resource    pages/GetProductPage.robot


*** Keywords ***
## Login ###

Dado que eu acesso a página de login
    Go To    ${URL}/login

Quando solicito submeto minhas credenciais de login "${email}" e senha "${senha}"
    Login with    ${email}    ${senha}

Então visualizo o nome do usuário "${nome}" no dashboard
    Wait Until Element Is Visible    ${LOGGED_USER}
    Wait Until Element Contains      ${LOGGED_USER}    ${nome}
    Element Text Should Be           ${LOGGED_USER}    ${nome}

Então visulizo uma mensagem de alerta "${mensagem}"
    Wait Until Element Contains    class:alert    ${mensagem}


## Product ##

Dado que eu tenho um novo produto
    [Arguments]    ${file_name}

    ${product_json}=      Get Product Json        ${file_name}      

    Remove Product By Name    ${product_json['name']}
    Set Test Variable     ${product_json}

Mas este produto já foi cadastrado
    Create New Product    ${product_json}

Quando eu faço o cadastro desse produto
    Create New Product    ${product_json}

Então visualizo este item no catálogo
    Table Should Contain    class:table    ${product_json['name']}

Então devo ver a mensagem de error
    [Arguments]        ${expect_message}
    Wait Until Element Contains      class:alert-danger    ${expect_message}
    Element Text Should Be           class:alert-danger    ${expect_message}
    Click Element                    ${CREATE}
    
Então devo ver a mensagem de alerta
    [Arguments]        ${expect_message}
    Wait Until Element Contains      class:alert-info    ${expect_message}
    Element Text Should Be           class:alert-info    ${expect_message}
    Click Element                    ${CREATE}


## Remover ##

Dado que eu tenho o produto "${file_name}" no catálogo
    ${product_json}=      Get Product Json        ${file_name}      

    Remove Product By Name    ${product_json['name']}
    
    Create New Product    ${product_json}

    Set Test Variable     ${product_json}

Quando solicito a exclusão
    Click Element                    xpath://tr[td//text()[contains(., '${product_json['name']}')]]//button
    Wait Until Element Is Visible    class:swal2-modal    

E confirmo a solicitação
    Click Element        class:swal2-confirm

Então não devo ver este item no catálogo
    Wait Until Element Does Not Contain    class:table    ${product_json['name']}

Mas cancelo a solicitação
    Click Element        class:swal2-cancel