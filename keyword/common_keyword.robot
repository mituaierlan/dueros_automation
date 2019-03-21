*** Settings ***
Documentation     Suite description
Variables         ../config/common.yaml
Library           AppiumLibrary
Library           OperatingSystem
Library           ExcelLibrary

*** Keywords ***
Launch_app
    [Arguments]    @{args}    &{kwargs}
    [Documentation]    Launch the app of duerOS and FP
    log    app
    : FOR    ${element}    IN    @{args}
    \    run keyword if    ${element}=='FPAPP'    Open Application    ${remote_url}    alias=FPAPP    platformName=${platformName}
    \    ...    deviceName=${deviceName1}    appPackage=${appPackage1}    appActivity=${appActivity1}    noReset=${noReset}    udid=${udid1}
    \    ...    automationName=${automationName}    newCommandTimeout=${newCommandTimeout}
    \    run keyword if    ${element}=='xiaoduAPP'    Open Application    ${remote_url}    alias=xiaoduAPP    platformName=${platformName}
    \    ...    deviceName=${deviceName2}    appPackage=${appPackage2}    appActivity=${appActivity2}    udid=${udid2}    automationName=${automationName}
    \    ...    newCommandTimeout=${newCommandTimeout}

Close_app
    run keyword and ignore error    close all applications

Tap by coordinator
    [Arguments]    ${position}    ${deviceName}
    log    ${deviceName} ${position}
    run    adb -s ${deviceName} shell input tap ${position}
