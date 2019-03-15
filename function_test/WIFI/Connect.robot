*** Settings ***
Force Tags        @feature=WIFI
Resource          ../../keyword/common_keyword.robot
Resource          ../../keyword/FordPass/LoginPage.robot
Resource          ../../keyword/FordPass/DashBoardPage.robot
Resource          ../../keyword/FordPass/AccountPage.robot
Resource          ../../keyword/FordPass/AddVehiclePage.robot
Resource          ../../keyword/FordPass/VehicleDetailsPage.robot
Resource          ../../keyword/xiaodu/LoginPage.robot
Resource          ../../keyword/FordPass/AddVehiclePage.robot
Resource          ../../keyword/FordPass/NotificationPage.robot
Variables         ../../config/testdata_stage.yaml

*** Variables ***


*** Test Cases ***
Check Network Status
    [Tags]    @tcid=1-1    @happypath
    Get Network Status
    Open Notification Bar

*** Keywords ***
Get Network Status
    [Documentation]    check current network status
    ${network_status} =    get network connection status
    log    ${network_status}


