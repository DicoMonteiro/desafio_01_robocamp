*** Settings ***
Documentation       Este arquivo implementa abertura e fechamento do navegador

***Variables***
${base_url}     http://pixel-web:3000

*** Keywords ***
Open Session
    Open Chrome
    Set Selenium Implicit Wait  5
    Set Window Size     1280        800

Close Session
    Capture Page Screenshot
    Close Browser
   
Open Chrome
    Open Browser    ${base_url}/login    chrome   options=add_experimental_option('excludeSwitches', ['enable-logging'])