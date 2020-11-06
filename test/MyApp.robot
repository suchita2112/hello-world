*** Settings ***

Library                 SeleniumLibrary



*** Test Cases ***


TC1 Open Application And Check
    Open Browser     	   http://3.138.191.246:8080/webapp/	Chrome
    Sleep  2s
    Page Should Contain      Hello

