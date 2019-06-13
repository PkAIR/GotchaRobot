*** Settings ***
Documentation  Send report test
Resource    ../keywords/send_report_keywords.robot
Library     HttpLibrary.HTTP

*** Variables ***
${Browser}      opera
${URL}          https://xn--90adear.xn--p1ai/request_main

*** Test Cases ***
The user can send a new report with given data
    Open report page
    Set region and department as            78 г. Санкт-Петербург     УГИБДД ГУ МВД России по г. Санкт-Петербургу и Ленинградской области
    Set personal information as             Калюгин     Павел      test.test@gmail.com
    Set region for accident as              г. Санкт-Петербург
    Set reason for accident                 TempReason

    Upload file with name                   requirements.txt

    Waiting for the captcha for             2 minutes
    Waiting for email confirmation for      2 minutes

    Send the report