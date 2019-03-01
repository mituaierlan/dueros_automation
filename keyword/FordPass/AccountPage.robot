*** Settings ***
Variables   ../../source/FP_Page_source/DashBoardPage.yaml
Variables   ../../source/FP_Page_source/AccountPage.yaml
*** Keywords ***
Logout FP
    wait until page does not contain    加载中    90s
    Wait Until Page Contains Element     ${button_account}    30s
    click element    ${button_account}
    Swipe by percent     1    50    1   10
    sleep    2s      #wait for finishing the swipe
    click element    ${text_exit}
    click element    ${text_exit}
    wait until page does not contain    加载中    90s