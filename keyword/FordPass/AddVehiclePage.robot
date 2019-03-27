*** Settings ***
Variables   ../../source/FP_Page_source/AddVehiclePage.yaml
Library  AppiumLibrary
*** Keywords ***
Get started
    click element    ${button_start}
    wait until page does not contain    加载中    90s
    Catenate

Close RNR
    wait until page contains element  ${button_close}     10s
    click element    ${button_close}