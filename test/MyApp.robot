*** Settings ***

Library                 SeleniumLibrary
Library                                OperatingSystem


*** Test Cases ***
TC1:
    Chrome Headless Start

*** keywords ***

Tc2
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method                         ${chrome_options}    add_argument    test-type
    Call Method                         ${chrome_options}    add_argument    --disable-extensions
    Call Method                         ${chrome_options}    add_argument    --headless
    Call Method                         ${chrome_options}    add_argument    --disable-gpu
    Call Method                         ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Open Browser      http://3.138.191.246:8080/webapp/     headlesschrome





Chrome Capabilities
    ${capabilities}                    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${prefs}=                          Chrome Preferences
    Call Method                        ${capabilities}   add_experimental_option  prefs   ${prefs}
    [return]                           ${capabilities}

Chrome Preferences
    ${downloadDir}                     Create Download Directory
    ${prefs}                           Create Dictionary
    ...                                download.default_directory=${downloadDir}
    ...                                profile.default_content_settings.popups=0
    ...                                browser.setDownloadBehavior=allow
    [return]                           ${prefs}

Create Download Directory
    ${download directory}              Download Directory
    Create Directory                   ${download directory}
    [return]                           ${download directory}

Chrome Headless Start
    ${capabilities}                     Chrome Capabilities
    Call Method                         ${capabilities}   add_argument  headless
    Call Method                         ${capabilities}   add_argument  disable-gpu
    Call Method                         ${capabilities}   add_argument  window-size\=1920x1080
    Create Webdriver                    Chrome  chrome_options=${capabilities}
    Go To                               http://3.138.191.246:8080/webapp/
    ${downloadDir}                      Download Directory


    ${webdriver}                              get library instance  SeleniumLibrary
 #  ${webdriver}                        Call Method  ${S2L}  _current_browser
    Enable Download In Headless Chrome  ${webdriver}  ${downloadDir}

Download Directory
    ${download directory}              Join Path    ${OUTPUT DIR}    downloads
    [return]                           ${download directory}

