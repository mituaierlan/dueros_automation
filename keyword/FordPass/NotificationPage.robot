*** Settings ***
Variables   ../../source/FP_Page_source/NotificationPage.yaml
*** Keywords ***
Open Notification Bar
    [Documentation]    open notification bar by swiping down from top
    swipe by percent    50    1    50    95
    sleep    1s
    swipe by percent    50    1    50    95
    sleep    1
    Open Wifi Setting

Open Wifi Setting
    long_press    ${button_wifi}

Open Bluetooth Setting
    long_press    ${button_bluetooth}