*** Settings ***
Documentation     Suite description
Variables         ../config/common.yaml
Library           AppiumLibrary

*** Keywords ***
Launch_app
    [Arguments]    @{args}    &{kwargs}
    [Documentation]    Launch the app of duerOS and FP
    FOR   ${element}    IN    @{args}
     \   run keyword if   ${element}=='FPAPP'
        ...    Open Application    ${remote_url}    alias=FPAPP    platformName=${platformName}    deviceName=${deviceName1}    appPackage=${appPackage1}
        ...    appActivity=${appActivity1}    noReset=${noReset}    udid=${udid1}    automationName=${automationName}    newCommandTimeout=${newCommandTimeout}
     \  run keyword if   ${element}=='xiaoduAPP'
        ...    Open Application    ${remote_url}    alias=xiaoduAPP    platformName=${platformName}    deviceName=${deviceName2}    appPackage=${appPackage2}
        ...    appActivity=${appActivity2}    udid=${udid2}    automationName=${automationName}    newCommandTimeout=${newCommandTimeout}

Close_app
    run keyword and ignore error    close all applications
