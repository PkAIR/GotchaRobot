*** Settings ***
Documentation  Send report test
Resource    ../keywords/send_report_keywords.robot
Resource    ../keywords/test_data_retrive_keywords.robot

*** Variables ***
${BROWSER}                                  opera
${URL}                                      https://xn--90adear.xn--p1ai/request_main
${PATH_TO_JSON_DATA_FILE}                   ${EXECDIR}/data/data.json
${PATH_TO_EVIDENCE_FILE}                    ${EXECDIR}/data/data.json
${TIMEOUT}                                  2 minutes

*** Test Cases ***
The user can send a new report with given data
    Open report page in                     ${BROWSER}
    ${data}=    Get data from file          ${PATH_TO_JSON_DATA_FILE}
    Set region and department as            ${data['region']}       ${data['department']}
    Set personal information as             ${data['surname']}      ${data['name']}         ${data['email']}
    Set region for accident as              ${data['placeOfAcc']}
    Set reason for accident                 ${data['reason']}

    Upload file with name                   ${PATH_TO_EVIDENCE_FILE}

    Waiting for the captcha for             ${TIMEOUT}
    Waiting for email confirmation for      ${TIMEOUT}

    Send the report
