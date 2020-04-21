*** Settings ***
Library            SeleniumLibrary


*** Variables ***
${URL}            http://pixel-web:3000



*** Keywords ***
Nova sessão
    Open Browser        ${URL}        chrome

Encerrar sessão
    Capture Page Screenshot
    Close Browser

Login with
    [Arguments]              ${username}     ${password}
    Input Text               id:emailId                      ${username}
    Input Text               css:input[name='password']      ${password}
    Click Element            class:btn-round

Apresentar o nome do usuário
    [Arguments]                 ${nome}
    Wait Until Page Contains    ${nome}

Apresentar mensagem de alerta
    [Arguments]                   ${expect_message}
    Wait Until Page Contains      ${expect_message}
    ${message}=                   Get WebElement                  class:alert-info
    Should Contain                ${message.text}                 ${expect_message}

Apresentar mensagem de erro
    [Arguments]                   ${expect_message}
    Wait Until Page Contains      ${expect_message}
    ${message}=                   Get WebElement                  class:alert-danger
    Should Contain                ${message.text}                 ${expect_message}
