*** Settings ***
Documentation       Keywords to retrieve test data
Library             HttpLibrary.HTTP
Library             OperatingSystem

*** Keywords ***
Get data from file
    ${jsonfile}    Get File             ${EXECDIR}//data//data.json
    ${username}    Get Json Value       ${jsonfile}    /name
    Log    ${username}