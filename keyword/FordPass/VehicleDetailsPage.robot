*** Settings ***
Variables   ../../source/FP_Page_source/VehicleDetailsPage.yaml
*** Keywords ***
Auth vehicle
    click element    ${text_auth_vehicle}

    wait until page does not contain    加载中    90s

