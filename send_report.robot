*** Settings ***
Documentation  Send report test
Library     Selenium2Library

*** Variables ***
${Browser}      chrome
${URL}          https://xn--90adear.xn--p1ai/request_main

*** Test Cases ***
The user can send a new report with given data
    [Documentation]     As I user I can open the home page
    open browser                    ${URL}   ${Browser}
    #wait until page contains    Google
    click element                           css:div.f-left.checkError > b > label
    click button                          css:div.f-right.u-form > button

    select from list by label       xpath://select[@name="region_code"]   78 г. Санкт-Петербург
    #select from list by label       css:#subunit_check   УГИБДД ГУ МВД России по г. Санкт-Петербургу и Ленинградской области

    input text                      css:#surname_check  Калюгин
    input text                      css:#firstname_check    Павел
    input text                      css:#email_check    test.test@gmail.com

    click element                   xpath://span[contains(@id, "select2-event_region")]
    input text                      xpath://input[@type="search"]   г. Санкт-Петербург
    press key                       xpath://input[@type="search"]   \\13


*** Keywords ***
