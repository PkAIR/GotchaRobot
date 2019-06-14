*** Settings ***
Documentation       Keywords to retrieve test data
Library             OperatingSystem

*** Keywords ***
Get data from file
    [Arguments]  ${filePath}
    ${jsonfile}=        Get File        ${filePath}
    ${sourceData}=      Evaluate        json.loads("""${jsonfile}""")    json

    [return]  ${sourceData}
