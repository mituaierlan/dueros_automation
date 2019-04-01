*** Settings ***
Variables   ../../source/FP_Page_source/AuthPage.yaml
Library  AppiumLibrary
*** Keywords ***
login and auth vehicle
    wait until page contains element     ${text_config_auth}    60s
    click element  ${text_config_auth}

check page contain login dueros
    run keyword and continue on failure  wait until page contains element     ${text_login_dueros}    1s