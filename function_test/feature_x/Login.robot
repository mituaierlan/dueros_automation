*** Settings ***
Suite Setup    Login via FP    ${username}    ${password}
Suite Teardown    Logout FP
Force Tags    @feature=Account
Resource  ../../keyword/common_keyword.robot
Resource  ../../keyword/LoginPage.robot
Variables  ../../config/testdata_stage.yaml
*** Test Cases ***
Login
    [tags]    @tcid=1-1
    run keyword and continue on failure  scan QR CODE
    go back