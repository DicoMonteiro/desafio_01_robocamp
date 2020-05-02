*** Settings ***
Documentation       Este arquivo implementa abertura e fechamento do navegador

***Variables***
${base_url}     http://pixel-web:3000

*** Keywords ***
### Hooks
Open Session
    Open Chrome
    Set Selenium Implicit Wait  5
    Set Window Size     1280        800

Close Session
    Close Browser

After Test
    Capture Page Screenshot

After Test WCLS
    Capture Page Screenshot
    Execute Javascript      localStorage.clear();

Login Session
    Open Session
    Login With  papito@ninjapixel.com   pwd123
   
Open Chrome
    Open Browser    ${base_url}/login    chrome   options=add_experimental_option('excludeSwitches', ['enable-logging'])