*** Settings ***
Documentation    Este arquivo implementa a abertura e fechamento do browser

*** Variables ***
${URL}    http://pixel-web:3000

*** Keywords ***
### Hooks
Open session
    Open Chrome
    Set Selenium Implicit Wait    5
    Set Window Size               1280    800

Close session
    Close Browser

After Test
    Capture Page Screenshot

After Test WCLS
    Capture Page Screenshot
    Execute Javascript        localStorage.clear();

Login session
    Open session
    Login with    didico@ninjapixel.com    pwd123

Open Chrome
    Open Browser    ${URL}/login    chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])