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
Resource          ../../keyword/FordPass/AuthPage.robot
Resource          ../../keyword/xiaodu/QRCodePage.robot
Variables         ../../config/testdata_stage.yaml

*** Variables ***
${init_time}      ${EMPTY}

*** Test Cases ***
Login
    [Tags]    @tcid=1-1    @performance
    ${init_time}=    get time    epoch
    ${status1}=    set variable    True
    #    open excel    ../../${init_time}.xls
    : FOR    ${i}    IN RANGE    1    ${PerformanceCount}
    \    save excel    ../../${init_time}.xls
    \    switch application    xiaoduAPP
    \    quit application
    \    launch application
    \    run keyword and ignore error    enter qr code
    \    ${status}=    run keyword and return status    check page contain QR code
    \    run keyword if    ${status}    run keyword and ignore error    refresh QR code
    \    switch application    FPAPP
    \    quit application
    \    launch application
    \    run keyword if    '${status1}'!='True'    run keyword and ignore error    delete vehicle and restart app
    \    #    run keyword and ignore error    delete vehicle and restart app
    \    put string to cell    performance    0    ${i}    login
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    put string to cell    performance    1    ${i}    ${start_time}
    \    ${status1}=    run keyword and return status    scan QR CODE
    \    run keyword if    ${status1}    put string to cell    performance    3    ${i}
    \    ...    success
    \    ...    ELSE    put string to cell    performance    3    ${i}
    \    ...    failed
    \    run keyword if    '${status1}'!='True'    continue for loop
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    put string to cell    performance    2    ${i}    ${end_time}
    \    log    ${init_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    log    ${duration_time}
    \    put string to cell    performance    4    ${i}    ${duration_time}
    \    save excel    ../../${init_time}.xls
    \    run keyword and ignore error    Close RNR
    \    go back
    \    ${j} =    set variable    ${i}
    \    put string to cell    performance    5    ${j}    Auth
    \    sleep    5s
    \    enter index page
    \    run keyword and ignore error    wait until page contains element    ${scan_qr_code}    5s
    \    run keyword and ignore error    click element    ${scan_qr_code}
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    put string to cell    performance    6    ${j}    ${start_time}
    \    ${status1}=    run keyword and return status    login and auth vehicle
#    \    run keyword if    '${status1}'!='True'    run keyword and ignore error    delete vehicle and restart app
    \    run keyword if    '${status1}'!='True'    continue for loop
    \    ${status1}=    run keyword and return status   check page contain login dueros
    \    run keyword if    '${status1}'=='True'    run keyword and ignore error    put string to cell    performance    11    ${j}    need to login dueros
    \    run keyword if    '${status1}'=='True'    run keyword and ignore error    delete vehicle and restart app
    \    run keyword if    '${status1}'=='True'    continue for loop
    \    ${status1}=    run keyword and return status    login and auth vehicle
#    \    run keyword if    '${status1}'!='True'    run keyword and ignore error    delete vehicle and restart app
    \    run keyword if    '${status1}'!='True'    continue for loop
    \    ${middle_time_secs}=    get time    epoch
    \    ${middle_time}=    get time
    \    put string to cell    performance    7    ${j}    ${middle_time}
    \    switch application    xiaoduAPP
    \    ${status1}=    run keyword and return status    Check login status
    \    run keyword if    ${status1}    put string to cell    performance    9    ${j}
    \    ...    success
    \    ...    ELSE    put string to cell    performance    9    ${j}
    \    ...    failed
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    put string to cell    performance    8    ${j}    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}-1
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
    #    log    ${init_time}
    #    save excel    ../../${init_time}.xls
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
    run keyword and continue on failure    launch application
    switch application    FPAPP


