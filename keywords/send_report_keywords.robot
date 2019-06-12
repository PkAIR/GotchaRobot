*** Settings ***
Library     Selenium2Library

*** Keywords ***
Open report page
    Log     As I user I can open the report page
    open browser                            ${URL}   ${Browser}
    click element                           css:div.f-left.checkError > b > label
    click button                            css:div.f-right.u-form > button

Set region and department as
    [Arguments]     ${region}   ${department}
    Log     Selecting region and department
    select from list by label               xpath://select[@name="region_code"]   ${region}
    wait until element is visible           xpath://span[@title='Выберите']/following-sibling::span
    click element                           xpath://span[@title='Выберите']/following-sibling::span
    select from list by label               css:#subunit_check   ${department}

Set personal information as
    [Arguments]  ${name}    ${surname}  ${email}
    Log     Setting personal information
    input text                              css:#surname_check  ${surname}
    input text                              css:#firstname_check    ${name}
    input text                              css:#email_check    ${email}

Set region for accident as
    [Arguments]  ${regionForAcc}
    Log     Selecting region of an accident
    click element                           xpath://span[contains(@id, "select2-event_region")]
    input text                              xpath://input[@type="search"]   ${regionForAcc}
    press key                               xpath://input[@type="search"]   \\13

Set reason for accident
    [Arguments]  ${reason}
    Log     Setting reason for the report
    input text                              css:.textarea                   ${reason}

Upload file with name
    [Arguments]  ${fileNameToUpload}
    Log     Uploading file
    choose file                             css:input[type=file]:first-child    ${EXECDIR}//${fileNameToUpload}
    wait until element is visible           css:.half_link  90 seconds

Waiting for the captcha for
    [Arguments]  ${timeToWait}
    Log     Waiting for captcha and going to the next step
    wait until element is visible           css:#confirm_but:first-child  ${timeToWait}
    click element                           css:#confirm_but:first-child

Waiting for email confirmation for
    [Arguments]  ${timeToWait}
    log                                     Waiting for you to provide mail confirmation code
    wait until element is visible           xpath://span[text()="Почта подтверждена!"]  ${timeToWait}
    log                                     Mailbox was confirmed

Send the report
    click element                           css:#correct:first-child
    log                                     Checking correctness for the report
    click button                            xpath://span[text()="Отправить"]
    log                                     Report was successfully sent