# GotchaRobot

**GotchaRobot** is a simple robot framework based solution for sending 
report on [GIBDD's site](https://гибдд.рф/request_main)

### Data used

Script is using two source of data: *JSON file* and an *evidence file*.

#### JSON file

By default script uses *data.json* file located under *data* subfolder.

It has a following structure:

{
    "region": "string", 
    "department": "string",
    "surname": "string",
    "name": "string",
    "email": "string",
    "placeOfAcc": "string",
    "reason": "string"
}

The provided info will be used for filling a report form on *GIBDD's site*.

#### Evidence file

Optionally a report can contain an evidence file of any type. Commonly used 
formats are **jpg**, **png** or any video format (**mp4**, **avi**). 

A provided evidence file will be attached to a sent report.

### Configuration

In robot file **send_report.robot** there is a **Variables** section:

```
*** Variables ***

${BROWSER}                                  opera
${URL}                                      https://xn--90adear.xn--p1ai/request_main
${PATH_TO_JSON_DATA_FILE}                   ${EXECDIR}/data/data.json
${PATH_TO_EVIDENCE_FILE}                    ${EXECDIR}/data/data.json
${TIMEOUT}                                  2 minutes
```

Overall it has **5** parameters:

1. **BROWSER** stands for which browser will be used for sending report 
        (see available values from **selenium2library**);
1. **URL** is the main GIBDD's report site URL; 
1. **PATH_TO_JSON_DATA_FILE** is an absolute path to the JSON file of a certain structure 
        (see **JSON file** section above) withh necessary info;
1. **PATH_TO_EVIDENCE_FILE** similar to **pathToJson** file but is used 
        for an evidence file;
1. **TIMEOUT** - tells how much time script will wait for user's input 
        (captcha input - mentioned below) 
        
### How to send a report

Simply in command line execute command:

```
robot -d results tests/send_report.robot
```

where *-d results* telling where report for an execution will be stored 
    (for ex. *-d results* - results will be stored under the results folder
    as a subfolder of a **GotchaRobot** folder)
    
### Note

*GIBDD site* has a captcha feature enabled. The script will notify and wait 
for a user's input for a given amount of time (configurable in **send_report.robot**
file)