*** Settings ***
Documentation  Send report test
Library     Selenium2Library

*** Variables ***
${Browser}      chrome
${URL}          https://xn--90adear.xn--p1ai/request_main

*** Test Cases ***
The user can send a new report with given data
    Log     As I user I can open the report page
    open browser                            ${URL}   ${Browser}
    #wait until page contains    Google
    click element                           css:div.f-left.checkError > b > label
    click button                            css:div.f-right.u-form > button

    Log     Selecting region and department
    select from list by label               xpath://select[@name="region_code"]   78 г. Санкт-Петербург
    #select from list by label       css:#subunit_check   УГИБДД ГУ МВД России по г. Санкт-Петербургу и Ленинградской области

    Log     Setting personal information
    input text                              css:#surname_check  Калюгин
    input text                              css:#firstname_check    Павел
    input text                              css:#email_check    kalyugin.pavel@gmail.com

    Log     Selecting region of an accident
    click element                           xpath://span[contains(@id, "select2-event_region")]
    input text                              xpath://input[@type="search"]   г. Санкт-Петербург
    press key                               xpath://input[@type="search"]   \\13

    Log     Setting reason for the report
    input text                              css:.textarea                   temp reason

    Log     Uploading file
    choose file                             css:input[type=file]:first-child    ${CURDIR}//requirements.txt
    wait until element is visible           css:.half_link  90 seconds


    Log     Waiting for captcha and going to the next step
    wait until element is visible           css:#confirm_but:first-child  2 minutes
    click element                           css:#confirm_but:first-child
    log                                     Waiting for you to provide mail confirmation code

    wait until element is visible           xpath://span[text()="Почта подтверждена!"]  2 minutes
    log                                     Mailbox was confirmed
    click element                           css:#correct:first-child
    log                                     Checking correctness for the report
    click button                            xpath://span[text()="Отправить"]
    log                                     Report was successfully sent

*** Keywords ***
