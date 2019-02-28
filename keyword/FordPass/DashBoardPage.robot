*** Settings ***
Variables         ../../source/FP_Page_source/DashBoardPage.yaml

*** Keywords ***
scan qr code
    log    scan qr code
    click element    ${scan_qr_code}
    wait until page contains    ${text_recognized}    20s
