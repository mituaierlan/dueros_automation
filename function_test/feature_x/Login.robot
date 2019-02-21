*** Settings ***
Library    AppiumLibrary
Library    atx
Resource     ../../keyword/common_keyword.robot
Suite Setup    Launch_mobile_app
Suite Teardown    Close_app
*** Variables ***
#${remote_url}    http://localhost:4723/wd/hub
${platformName}    Android
${deviceName1}    7dbbe9bb
${deviceName2}    05081198538fcade
${udid1}    7dbbe9bb
${udid2}    192.168.0.101:5555
${appPackage1}    com.ford.oa.ap
${appPackage2}    com.baidu.xiaoduos.launcher
${appActivity1}    com.fordmps.mobileapp.shared.login.LauncherActivity
${appActivity2}    com.baidu.xiaoduos.launcher.ui.MainActivity
${automationName}    uiautomator2
${noReset}    true
*** Test Cases ***
Login
    [setup]    Login via FP
    [teardown]    Logout FP
    run keyword and continue on failure  scan QR CODE
    go back
    # click element    xpath=//*[@text='STAGING']
    # go back
    # Launch_app_without_reset
    
    # click element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.support.v7.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[3]

    
*** keyword ***
Launch_app
    log    open mobile app
    ${app1}=    Open Application    ${remote_url}   alias=FPAPP    platformName=${platformName}    deviceName=${deviceName1}    appPackage=${appPackage1}    appActivity=${appActivity1}    noReset=${noReset}    udid=${udid1}
    log    open xiaodu app
#    ${app2}=    Open Application    ${remote_url}    alias=xiaoduAPP    platformName=${platformName}    deviceName=${deviceName2}    appPackage=${appPackage2}    appActivity=${appActivity2}      udid=${udid2}
Launch_app_without_reset
    log    open mobile app
    ${app1}=    Open Application    ${remote_url}    platformName=${platformName}    deviceName=${deviceName1}    appPackage=${appPackage1}    appActivity=${appActivity1}    noReset=true
    
Close_app
    Close Application
Login via FP
#    register_keyword_to_run_on_failure    capture page screenshot
    switch application    FPAPP
    Wait Until Page Contains Element     id=com.ford.oa.ap:id/login_username_text    90s
    Input Text    id=com.ford.oa.ap:id/login_username_text    18168104351    
    Input Text    id=com.ford.oa.ap:id/login_password_text    Qwe123q
    click element    id=com.ford.oa.ap:id/login_button_login
    enter Pin
    wait until page does not contain    加载中    90s
Logout FP
    wait until page does not contain    加载中    90s
    Wait Until Page Contains Element     id=com.ford.oa.ap:id/account_button    30s
    click element    id=com.ford.oa.ap:id/account_button  
    Swipe by percent     1    50    1   10
    sleep    1s
    click element    xpath=//*[@text='退出']  
    click element    xpath=//*[@text='退出']  
    
scan QR CODE
    log   scan qr code
    click element    xpath=//*[@text='扫一扫']
    wait until page contains  '车辆已识别'    20s
enter Pin
    Wait Until Page Contains Element     id=com.ford.oa.ap:id/widget_pin_pad_button_one    20s
    click element    id=com.ford.oa.ap:id/widget_pin_pad_button_one
    click element    id=com.ford.oa.ap:id/widget_pin_pad_button_two
    click element    id=com.ford.oa.ap:id/widget_pin_pad_button_three
    click element    id=com.ford.oa.ap:id/widget_pin_pad_button_four
    Wait Until Page Contains      确认PIN码
    click element    id=com.ford.oa.ap:id/widget_pin_pad_button_one
    click element    id=com.ford.oa.ap:id/widget_pin_pad_button_two
    click element    id=com.ford.oa.ap:id/widget_pin_pad_button_three
    click element    id=com.ford.oa.ap:id/widget_pin_pad_button_four
    wait until page does not contain    加载中    90s
    
