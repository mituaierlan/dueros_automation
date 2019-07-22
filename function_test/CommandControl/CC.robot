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
Resource          ../../keyword/xiaodu/QRCodePage.robot
Resource          ../../keyword/xiaodu/RegisterFordPassPage.robot
Variables         ../../config/testdata_stage.yaml
Library           Collections
Library           AppiumLibrary    #Variables    ${my_sheet_index}    #Library    Excellibrary    #Library    ExcelLibrary

*** Variables ***
${my_sheet_index}    ${EMPTY}
${Excel_File_Path}    C:\\Users\\ESG\\dueros_automation\\
${banner_status}    ${EMPTY}

*** Test Cases ***
CommandControl
    [Tags]    @tcid=001.002.002    @Regression
    [Setup]
    command control

Lock Unlock
    [Tags]    @tcid=001.002.002    @Regression
    [Setup]
    Lock Unlock

remote start
    [Tags]    @tcid=001.002.002    @Regression
    [Setup]
    remote start
*** Keywords ***
TS Setup
    [Documentation]    setup for current cases
    switch application    FPAPP
    #Login via FP    ${username}    ${password}

TS Teardown
    [Documentation]    teardown for current cases
    log    reopen application
    switch application    FPAPP
    #    quit application
    #    launch application
    #    enter vehicle details
    #    delete vehicle
    Logout FP
    switch application    xiaoduAPP
    #    Tap by coordinator    ${position}    ${deviceName2}
    #    log out duerOS
