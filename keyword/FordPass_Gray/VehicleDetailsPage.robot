*** Settings ***
Variables   ../../source/FP_Page_source/VehicleDetailsPage.yaml
Variables   ../../source/FP_Page_source/AuthPage.yaml
Library     AppiumLibrary
*** Keywords ***
Auth vehicle
    wait until page contains element     ${text_auth_vehicle}    30s
    click element    ${text_auth_vehicle}
    wait until page contains element     ${text_config_auth}    30s
    click element    ${text_config_auth}
    wait until page does not contain    加载中    90s

delete vehicle
    sleep    5s
    Swipe by percent     1    50    1   10
    Swipe by percent     1    50    1   10
    click element    ${text_delete_vehicle}
    click element    ${text_confirm_delete_vehicle}
    wait until page does not contain    加载中    90s