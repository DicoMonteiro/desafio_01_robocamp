*** Settings ***
Documentation        Pixel API na rota POST /products 

Resource             ../../resources/services.robot


*** Test Cases ***
Create New Product
    [tags]    success
    
    ${endpoint}=           New Session
 
    ${token}=         Get Auth Token    didico@ninjapixel.com    pwd123    ${endpoint}

    ${payload}=         Get Json        post.json

    ${resp}=            Post Product    ${payload}    ${token}    ${endpoint}

    Status Should Be    200            ${resp}

    Log                 ${resp.text}


Post Required Title
    [tags]    bad_request

    ${endpoint}=           New Session

    ${token}=         Get Auth Token    didico@ninjapixel.com    pwd123    ${endpoint}

    ${payload}=         Get Json        no_title.json 

    ${resp}=            Post Product    ${payload}    ${token}    ${endpoint}


    Status Should Be    400            ${resp}

    Log                 ${resp.text}

    Should Be Equal     ${resp.json()['msg']}        Oops! title cannot be empty

    Dictionary Should Contain Value  ${resp.json()}       Oops! title cannot be empty


Post Required Category
    [tags]    bad_request

    ${endpoint}=           New Session

    ${token}=         Get Auth Token    didico@ninjapixel.com    pwd123    ${endpoint}

    ${payload}=         Get Json        no_category.json 

    ${resp}=            Post Product    ${payload}    ${token}    ${endpoint}

    Status Should Be    400            ${resp}

    Log                 ${resp.text}

    Should Be Equal     ${resp.json()['msg']}        Oops! category cannot be empty

    Dictionary Should Contain Value  ${resp.json()}       Oops! category cannot be empty



Post Required Price
    [tags]    bad_request
    
    ${endpoint}=           New Session

    ${token}=         Get Auth Token    didico@ninjapixel.com    pwd123    ${endpoint}

    ${payload}=         Get Json        no_price.json 

    ${resp}=            Post Product    ${payload}    ${token}    ${endpoint}


    Status Should Be    400            ${resp}

    Log                 ${resp.text}

    Should Be Equal     ${resp.json()['msg']}        Oops! price cannot be empty

    Dictionary Should Contain Value  ${resp.json()}       Oops! price cannot be empty



Post Duplicated Product
    [tags]    conflict

    ${endpoint}=      New Session

    ${token}=         Get Auth Token    didico@ninjapixel.com    pwd123    ${endpoint}

    ${payload}=         Get Json        duplicated.json 

    ${resp}=            Post Product    ${payload}    ${token}    ${endpoint}

    ${resp}=            Product Duplicated    ${payload}   ${token}    ${endpoint}


    Status Should Be    409            ${resp}

    Log                 ${resp.text}

    Should Be Equal     ${resp.json()['msg']}        title must be unique

    Dictionary Should Contain Value  ${resp.json()}       title must be unique

