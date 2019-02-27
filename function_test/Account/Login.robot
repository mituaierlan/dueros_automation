*** Settings ***
Suite Setup    TS Setup
Suite Teardown    TS Teardown
Force Tags    @feature=Account
Resource  ../../keyword/common_keyword.robot
Resource  ../../keyword/FordPass/LoginPage.robot
Resource  ../../keyword/FordPass/DashBoardPage.robot
Resource  ../../keyword/FordPass/AccountPage.robot
Variables  ../../config/testdata_stage.yaml
*** Test Cases ***
Login
    [Tags]    @tcid=1-1    @happypath
    run keyword and continue on failure   scan QR CODE
*** Keywords ***
TS Setup
    [documentation]  setup for current cases
    switch application  FPAPP
    Login via FP  ${username}    ${password}
TS Teardown
    [documentation]  teardown for current cases
    log    reopen application
    quit application
    launch application
    Logout FP
