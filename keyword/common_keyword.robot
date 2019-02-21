*** Settings ***
Documentation    Container of common KeyWords used by all cases
#Variables    ../config/testdata_stage.yaml

*** Test Cases ***
TC1
    Test    ${FP_CN_003.VehicleName}


*** Keywords ***
Test
    [Arguments]  ${appName}
    log    ${appName}