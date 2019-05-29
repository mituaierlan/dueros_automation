*** Settings ***
Variables  ../../source/du_Page_source/AuthPage.yaml

*** Keywords ***
confirm to auth vehicle
    [Documentation]  confirm to auth vehicle
    run keyword and continue on failure  wait until page contains element    ${button_auth_vehicle_xiaodu}    20s
    run keyword and continue on failure    click element    ${button_auth_vehicle_xiaodu}

cancel auth
    [Documentation]  cancel auth vehicle
    wait until page contains element    ${button_cancel_auth}    90s
    click element    ${button_auth_vehicle}

