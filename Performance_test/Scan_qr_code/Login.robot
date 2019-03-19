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
${init_time}

*** Test Cases ***
Login
    [Tags]    @tcid=1-1    @happypath
    create excel workbook    performance
    ${init_time}=    get time    epoch
    save excel   ../../${init_time}.xls
#    open excel   ../../${init_time}.xls
    FOR    ${i}    IN RANGE    1    ${PerformanceCount}
    \   put string to cell  performance    0    ${i}    login
    \   ${start_time_secs}=    get time    epoch
    \   ${start_time}=    get time
    \   put string to cell   performance    1    ${i}   ${start_time}
    \   ${status}=    run keyword and return status    scan QR CODE
    \   run keyword if  ${status}    put string to cell   performance   3     ${i}   success
         ...    ELSE     put string to cell   performance    3    ${i}    failed
    \   ${end_time_secs}=    get time    epoch
    \   ${end_time}=     get time
    \   put string to cell   performance    2    ${i}     ${end_time}
    \   log    ${init_time}
    \   ${duration_time}=     evaluate     ${end_time_secs}-${start_time_secs}
    \   log    ${duration_time}
    \   put string to cell   performance    4    ${i}     ${duration_time}
    \   save excel   ../../${init_time}.xls
    \   run keyword and ignore error    delete vehicle and restart app


*** Keywords ***
TS Setup
    [Documentation]    setup for current cases
    switch application    FPAPP
#    Login via FP    ${username}    ${password}

TS Teardown
    [Documentation]    teardown for current cases
    log    reopen application
#    switch application    FPAPP
#    Logout FP
#    switch application    xiaoduAPP
#    Tap by coordinator    ${position}    ${deviceName2}

delete vehicle and restart app
    quit application
    launch application
    enter vehicle details
    delete vehicle