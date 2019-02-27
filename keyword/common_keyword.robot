*** Settings ***
Documentation    Container of common KeyWords used by all cases
Variables    ../config/common_data.yaml


*** Keywords ***
Launch_mobile_app
    log    open mobile app
    log    ${Common.remote_url}
    log    ${test}
    ${app1}=    Open Application    ${Common.remote_url}   alias=FPAPP    platformName=${platformName}    deviceName=${deviceName1}    appPackage=${appPackage1}    appActivity=${appActivity1}    noReset=${noReset}    udid=${udid1}
    log    openech xiaodu app