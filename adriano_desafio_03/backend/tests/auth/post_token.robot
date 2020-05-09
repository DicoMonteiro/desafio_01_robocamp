*** Settings ***
Documentation        Testes da rota /auth da Pixel API

Resource             ../../resources/services.robot


*** Test Cases ***
Request Token

    ${endpoint}=           New Session

    ${resp}=            Post Token    didico@ninjapixel.com    pwd123    ${endpoint}

    Status Should Be    200            ${resp}

    Log                 ${resp.text}


Incorrect password

    ${endpoint}=           New Session

    ${resp}=            Post Token    didico@ninjapixel.com    abc123    ${endpoint}

    Status Should Be    401            ${resp}

    Log                 ${resp.text}


Incorrect email

    ${endpoint}=           New Session

    ${resp}=            Post Token    test@ninjapixel.com    pwd123    ${endpoint}

    Status Should Be    401            ${resp}

    Log                 ${resp.text}