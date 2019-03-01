*** Settings ***
Variables         ../../source/FP_Page_source/DashBoardPage.yaml

*** Keywords ***
scan qr code
    log    scan qr code
    click element    ${scan_qr_code}
    wait until page contains    ${text_recognized}    20s

enter vehicle details
    wait until page contains element    ${vehicle_details}    20s
    click element    ${vehicle_details}
    wait until page does not contain    加载中    90s

choose vehicle
    wait until page contains element    ${text_vehicle}    20s
    click element    ${text_vehicle}
    wait until page does not contain    加载中    90s