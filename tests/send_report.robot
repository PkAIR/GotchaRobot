*** Settings ***
Documentation  Send report test
Resource    ../keywords/send_report_keywords.robot
Resource    ../keywords/test_data_retrive_keywords.robot

*** Variables ***
${Browser}                  opera
${URL}                      https://xn--90adear.xn--p1ai/request_main
${pathToJson}               ${EXECDIR}/data/data.json
${pathToEvidenceFile}       ${EXECDIR}/data/data.json

*** Test Cases ***
The user can send a new report with given data
    Open report page in                     ${Browser}
    ${data}=    Get data from file          ${pathToJson}
    Set region and department as            ${data['region']}       ${data['department']}
    Set personal information as             ${data['surname']}      ${data['name']}         ${data['email']}
    Set region for accident as              ${data['placeOfAcc']}
    Set reason for accident                 ${data['reason']}

    Upload file with name                   ${pathToEvidenceFile}

    Waiting for the captcha for             2 minutes
    Waiting for email confirmation for      2 minutes

    Send the report
