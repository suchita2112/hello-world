*** Settings ***

Library                 SeleniumLibrary



*** Test Cases ***
Tc2
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To      http://3.138.191.246:8080/webapp/

