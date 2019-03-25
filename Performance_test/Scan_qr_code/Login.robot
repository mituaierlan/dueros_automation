*** Settings ***
Suite Setup       TS Setup
Suite Teardown    TS Teardown
Force Tags        @peformance
Resource          ../../keyword/common_keyword.robot
Resource          ../../keyword/FordPass/LoginPage.robot
Resource          ../../keyword/FordPass/DashBoardPage.robot
Resource          ../../keyword/FordPass/AccountPage.robot
Resource          ../../keyword/FordPass/AddVehiclePage.robot
Resource          ../../keyword/FordPass/VehicleDetailsPage.robot
Resource          ../../keyword/xiaodu/LoginPage.robot
Resource          ../../keyword/xiaodu/PersonalSetting.robot
Variables         ../../config/testdata_stage.yaml

*** Variables ***
${init_time}      ${EMPTY}

*** Test Cases ***
Login
    [Tags]    @tcid=1-1    @happypath
    ${init_time}=    get time     epoch
    save excel    ../../${init_time}.xls
#    open excel    ../../${init_time}.xls
    : FOR    ${i}    IN RANGE    1    ${PerformanceCount}
    \    switch application    xiaoduAPP
    \    enter qr code
    \    switch application    FPAPP
    \    put string to cell    performance    0    ${i}    login
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    put string to cell    performance    1    ${i}    ${start_time}
    \    ${status}=    run keyword and return status    scan QR CODE
    \    run keyword if    ${status}    put string to cell    performance    3    ${i}
    \    ...    success
    \    ...    ELSE    put string to cell    performance    3    ${i}
    \    ...    failed
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    put string to cell    performance    2    ${i}    ${end_time}
    \    log    ${init_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    log    ${duration_time}
    \    put string to cell    performance    4    ${i}    ${duration_time}
    \    save excel    ../../${init_time}.xls
    \    run keyword and ignore error     Close RNR
    \    go back
    \    ${j} =     set variable  ${i}
    \    put string to cell    performance    5    ${j}    Auth
    \    enter vehicle details
    \    wait until page contains element     ${text_auth_vehicle}    30s
    \    click element    ${text_auth_vehicle}
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    put string to cell    performance    6    ${j}    ${start_time}
    \    wait until page contains element     ${text_config_auth}    30s
    \    click element    ${text_config_auth}
    \    ${middle_time_secs}=    get time    epoch
    \    ${middle_time}=    get time
    \    put string to cell    performance    7    ${j}    ${middle_time}
    \    switch application     xiaoduAPP
    \    ${status}=    run keyword and return status    Check login status
    \    run keyword if    ${status}    put string to cell    performance    9    ${j}
    \    ...    success
    \    ...    ELSE    put string to cell    performance    9    ${j}
    \    ...    failed
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    put string to cell    performance    8    ${j}    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    log    ${duration_time}
    \    put string to cell    performance    10    ${j}    ${duration_time}
    \    save excel    ../../${init_time}.xls
    \    sleep    3s
    \    run keyword and ignore error    delete vehicle and restart app

*** Keywords ***
TS Setup
    [Documentation]    setup for current cases
    ${start_time}=    get time
    create excel workbook    performance
    #    Login via FP    ${username}    ${password}

TS Teardown
    [Documentation]    teardown for current cases
    log    ${init_time}
    save excel    ../../${init_time}.xls
    log    reopen application
    #    switch application    FPAPP
    #    Logout FP
    switch application    FPAPP
    #    Tap by coordinator    ${position}    ${deviceName2}

delete vehicle and restart app
    switch application    FPAPP
    quit application
    launch application
    enter vehicle details
    delete vehicle
    sleep    3s
    switch application    xiaoduAPP
    quit application
    run keyword and continue on failure   launch application
    switch application    FPAPP
