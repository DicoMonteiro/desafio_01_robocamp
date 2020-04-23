*** Settings ***
Documentation       Este arquivo implementa abertura e fechamento do navegador

*** Keywords ***
Open Session
    Open Browser    http://pixel-web:3000/login    chrome
    
    Set Selenium Implicit Wait  5

Close Session
    Close Browser