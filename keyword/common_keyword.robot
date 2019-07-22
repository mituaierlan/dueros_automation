*** Settings ***
Documentation     Suite description
Variables         ../config/common.yaml
Library           AppiumLibrary
Library           OperatingSystem    #Library    ExcelLibrary
Library           openpyxllibrary
Library           ICanLibrary

*** Keywords ***
Launch_app
    [Arguments]    @{args}
    [Documentation]    Launch the app of duerOS and FP
    log    app
    : FOR    ${element}    IN    @{args}
    \    run keyword if    ${element}=='FPAPP'    Open Application    ${remote_url1}    alias=FPAPP    platformName=${platformName1}
    \    ...    deviceName=${deviceName1}    appPackage=${appPackage1}    appActivity=${appActivity1}    noReset=${noReset}    udid=${udid1}
    \    ...    appWaitDuration=${appWaitDuration}    newCommandTimeout=${newCommandTimeout}
    \    run keyword if    ${element}=='xiaoduAPP'    Open Application    ${remote_url2}    alias=xiaoduAPP    platformName=${platformName2}
    \    ...    deviceName=${deviceName2}    appPackage=${appPackage2}    appActivity=${appActivity2}    udid=${udid2}    newCommandTimeout=${newCommandTimeout}
    \    ...    appWaitDuration=${appWaitDuration}    noReset=${noReset}
    \    run keyword if    ${element}=='eastnewsAPP'    Open Application    ${remote_url3}    alias=eastnewsAPP    platformName=${platformName3}
    \    ...    deviceName=${deviceName3}    appPackage=${appPackage3}    appActivity=${appActivity3}    udid=${udid3}    newCommandTimeout=${newCommandTimeout}
    \    ...    appWaitDuration=${appWaitDuration}    noReset=${noReset}
    \    run keyword if    ${element}=='FPAudio'    Open Application    ${remote_url4}    alias=FPAudio    platformName=${platformName4}
    \    ...    deviceName=${deviceName4}    appPackage=${appPackage4}    appActivity=${appActivity4}    udid=${udid4}    newCommandTimeout=${newCommandTimeout}
    \    ...    appWaitDuration=${appWaitDuration}    noReset=${noReset}

Close_app
    run keyword and ignore error    close all applications

Tap by coordinator
    [Arguments]    ${position}    ${deviceName}
    log    ${deviceName} ${position}
    run    adb -s ${deviceName} shell input tap ${position}

Tap by position
    [Arguments]    ${position_x}    ${position_y}    ${deviceName}
    run    adb -s ${deviceName} shell input tap ${position_x} ${position_y}

modify CAQ via adb
    [Arguments]    ${deviceName}    ${caq_value}
    ${result}=    run    adb -s ${deviceName} shell am broadcast -a com.xiaoduos.action.ACTION_DATA_AVAILABLE --ei EXTRA_DATA ${caq_value}
    log    ${result}
