*** Settings ***

Library                 SeleniumLibrary



*** Test Cases ***
Tc2
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method                         ${chrome_options}    add_argument    test-type
    Call Method                         ${chrome_options}    add_argument    --disable-extensions
    Call Method                         ${chrome_options}    add_argument    --headless
    Call Method                         ${chrome_options}    add_argument    --disable-gpu
    Call Method                         ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Open Browser      http://3.138.191.246:8080/webapp/     headlesschrome