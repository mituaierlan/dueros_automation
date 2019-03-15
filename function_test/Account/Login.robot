*** Settings ***
Suite Setup       TS Setup
Suite Teardown    TS Teardown
Force Tags        @feature=Account
Resource          ../../keyword/common_keyword.robot
Resource          ../../keyword/FordPass/LoginPage.robot
Resource          ../../keyword/FordPass/DashBoardPage.robot
Resource          ../../keyword/FordPass/AccountPage.robot
Resource          ../../keyword/FordPass/AddVehiclePage.robot
Resource          ../../keyword/FordPass/VehicleDetailsPage.robot
Resource          ../../keyword/xiaodu/LoginPage.robot
Resource          ../../keyword/xiaodu/PersonalSetting.robot
Variables         ../../config/testdata_stage.yaml

*** Test Cases ***
Login
    [Tags]    @tcid=1-1    @happypath
    scan QR CODE
    Close RNR
    go back

Auth
    [Tags]    @tcid=1-2    @happyPath
    enter vehicle details
    auth vehicle
    switch application    xiaoduAPP
    WAIT UNTIL KEYWORD SUCCEEDS    90s    5s    Check login status

*** Keywords ***
TS Setup
    [Documentation]    setup for current cases
    switch application    FPAPP
    Login via FP    ${username}    ${password}

TS Teardown
    [Documentation]    teardown for current cases
    log    reopen application
    switch application    FPAPP
    quit application
    launch application
    enter vehicle details
    delete vehicle
    Logout FP
    switch application    xiaoduAPP
    Tap by coordinator    ${position}    ${deviceName2}
    log out duerOS

