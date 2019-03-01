*** Settings ***
Variables   ../../source/FP_Page_source/VehicleDetailsPage.yaml
*** Keywords ***
Auth vehicle
    wait until page contains element     ${text_auth_vehicle}    30s
    click element    ${text_auth_vehicle}
    wait until page contains element     ${text_config_auth}    30s
    click element    ${text_config_auth}
    wait until page does not contain    加载中    90s

