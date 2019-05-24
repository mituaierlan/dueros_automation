*** Settings ***
Variables         ../../source/FP_Gray_Page_source/DashBoardPage.yaml

*** Keywords ***
scan qr code
    enter index page
    click element   ${button_action_more}
    wait until page contains element    ${scan_qr_code}   60s
    log    scan qr code
    click element    ${scan_qr_code}
    run keyword and continue on failure      wait until page contains    ${text_recognized}    60s

auth vehicle
    enter index page
    wait until page contains element    ${button_auth_vehicle}   60s
    log    auth vehicle
    click element    ${button_auth_vehicle}
    run keyword and continue on failure      wait until page contains    ${text_config_auth}    60s
    click element    ${text_config_auth}

enter vehicle details
    run keyword and ignore error   choose vehicle
    wait until page contains element    ${vehicle_details}    5s
    click element    ${vehicle_details}
    wait until page does not contain    加载中    90s

choose vehicle
    wait until page contains element    ${text_vehicle}    20s
    sleep    2s
    click element    ${text_vehicle}
    wait until page does not contain    加载中    90s

enter index page
    wait until page contains element    ${text_index_page}    20s
    click element    ${text_index_page}


enter personal info
    click element    ${button_person_info}