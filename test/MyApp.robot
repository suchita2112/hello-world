*** Settings ***

Library                 SeleniumLibrary



*** Test Cases ***
Tc2
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Call Method                         ${capabilities}   add_argument  headless
    Call Method                         ${capabilities}   add_argument  disable-gpu
    Call Method                         ${capabilities}   add_argument  window-size\=1920x1080
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To      http://3.138.191.246:8080/webapp/

