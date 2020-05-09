*** Settings ***
Documentation    Aqui nós vamos encapsular algumas chamadas de serviços

Library          libs/db.py
Library          RequestsLibrary
Library          Collections
Library          OperatingSystem


*** Keywords ***
### Helpers
Get Json
    [Arguments]        ${json_file}

    ${file}=         Get File             ${EXECDIR}/resources/fixtures/${json_file}
    ${json}=         evaluate             json.loads($file)    json
    
    [return]        ${json}
    
### Specifications Actions
New Session
    Create Session      pixel           http://pixel-api:3333
    [return]        pixel

Get Auth Token
    [Arguments]        ${email}    ${pass}    ${endpoint}

    ${resp}=            Post Token    ${email}    ${pass}    ${endpoint}

    ${token}            Convert To String    ${resp.json()['token']}

    [return]        ${token}


Post Token
    [Arguments]        ${email}    ${pass}     ${endpoint}

    &{payload}=         Create Dictionary    email=${email}   password=${pass}
    &{headers}=         Create Dictionary    Content-Type=application/json

    ${resp}=            Post Request     ${endpoint}        /auth    data=${payload}    headers=${headers}

    [return]        ${resp}


Post Product
    [Arguments]        ${payload}    ${token}    ${endpoint}

    Remove Product By Title        ${payload['title']}

    &{headers}=         Create Dictionary    Content-Type=application/json    Authorization=JWT ${token}

    ${resp}=            Post Request    ${endpoint}        /products    data=${payload}    headers=${headers}
    
    [Return]        ${resp}

Product Duplicated
    [Arguments]    ${payload}    ${token}    ${endpoint}

    &{headers}=         Create Dictionary    Content-Type=application/json    Authorization=JWT ${token}

    ${resp}=            Post Request    ${endpoint}        /products    data=${payload}    headers=${headers}
    
    [Return]        ${resp}


List All Products
    [Arguments]        ${token}    ${endpoint}

    &{headers}=        Create Dictionary    Content-Type=application/json    Authorization=JWT ${token}

    ${resp}=           Get Request    ${endpoint}    /products    headers=${headers}
    
    [Return]        ${resp}



Get Product By Id
    [Arguments]        ${id_product}    ${token}    ${endpoint}

    &{headers}=        Create Dictionary    Content-Type=application/json    Authorization=JWT ${token}

    ${resp}=           Get Request    ${endpoint}    /products/${id_product}    headers=${headers}
    
    [Return]        ${resp}


Delete Product
    [Arguments]        ${id_product}    ${token}    ${endpoint}

    &{headers}=        Create Dictionary    Content-Type=application/json    Authorization=JWT ${token}

    ${resp}=           Delete Request    ${endpoint}    /products/${id_product}    headers=${headers}
    
    [Return]        ${resp}



Update Product
    [Arguments]        ${id_product}    ${payload}    ${token}    ${endpoint}

    &{headers}=         Create Dictionary    Content-Type=application/json    Authorization=JWT ${token}

    ${resp}=            Put Request    ${endpoint}        /products/${id_product}    data=${payload}    headers=${headers}

    Remove Product By Title        ${payload['title']}
    
    [Return]        ${resp}


Update Product Duplicated
    [Arguments]        ${id_product}    ${payload}    ${token}    ${endpoint}

    &{headers}=         Create Dictionary    Content-Type=application/json    Authorization=JWT ${token}

    ${resp}=            Put Request    ${endpoint}        /products/${id_product}    data=${payload}    headers=${headers}
    
    [Return]        ${resp}