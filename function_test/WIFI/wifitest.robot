*** Settings ***
Suite Setup       TS Setup
Suite Teardown    TS Teardown
Force Tags        @peformance
Resource          ../../keyword/common_keyword.robot
Resource          ../../keyword/FordPass_Gray/LoginPage.robot
Resource          ../../keyword/FordPass_Gray/DashBoardPage.robot
Resource          ../../keyword/FordPass_Gray/AccountPage.robot
Resource          ../../keyword/FordPass_Gray/AddVehiclePage.robot
Resource          ../../keyword/FordPass_Gray/MyVehiclePage.robot    #Resource    ../../keyword/FordPass_Gray/VehicleDetailsPage.robot
Resource          ../../keyword/xiaodu/LoginPage.robot
Resource          ../../keyword/xiaodu/PersonalSetting.robot
Resource          ../../keyword/FordPass_Gray/AuthPage.robot
Resource          ../../keyword/xiaodu/AuthPage.robot
Resource          ../../keyword/xiaodu/QRCodePage.robot
Variables         ../../config/testdata_stage.yaml
Variables         ../../source/FP_Gray_Page_source/WifiPage.yaml

*** Variables ***
${init_time}      ${EMPTY}
${Excel_File_Path}    C:\\Users\\ESG\\dueros_automation\\
${now_row}        ${EMPTY}
${text_num}       ${EMPTY}
${text_string1}    xpath =/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.widget.RelativeLayout[
${text_string2}    ]/android.support.v7.widget.LinearLayoutCompat
${text_string3}    ]/android.support.v7.widget.LinearLayoutCompat/android.widget.LinearLayout/android.widget.RelativeLayout[1]/android.widget.TextView[1]

*** Test Cases ***
test
    Tap by position    100    80    ${udid2}
    Swipe    200    1450    950    1450    200
    sleep    5s
    Swipe    900    1450    200    1450    800
    sleep    5s
    Swipe    950    1450    200    1450    750
    sleep    2s
    click element    ${text_take}
    sleep    2s
    Swipe    750    1250    750    850    750
    ${text_num}=    evaluate    3
    ${text_index}=    Catenate    SEPARATOR=    ${text_string1}    ${text_num}    ${text_string2}
    ${text_name}=    Catenate    SEPARATOR=    ${text_string1}    ${text_num}    ${text_string3}
    ${text}=    get text    ${text_name}
    click element    ${text_name}
    click element    ${text_name}

wifi test
    Open Excel    ${Excel_File_Path}11.xlsx
    : FOR    ${i}    IN RANGE    1    ${PerformanceCount}
    \    save excel    ${Excel_File_Path}11.xlsx
    \    Write Data By Coordinates    performance    ${i}    1    1
    \    Write Data By Coordinates    performance    ${i}    2    1
    \    Write Data By Coordinates    performance    ${i}    3    1
    \    Write Data By Coordinates    performance    ${i}    4    1
    \    Write Data By Coordinates    performance    ${i}    5    1
    \    Write Data By Coordinates    performance    ${i}    6    1
    \    Write Data By Coordinates    performance    ${i}    7    1
    \    Write Data By Coordinates    performance    ${i}    8    1
    \    Write Data By Coordinates    performance    ${i}    9    1
    \    Write Data By Coordinates    performance    ${i}    10    1

Wifi
    [Tags]    @tcid=1-1    @performance
    ${status1}=    set variable    True
    Open Excel    ${Excel_File_Path}wifitest.xlsx
    ${last_row}    Get Row Count    performance
    : FOR    ${i}    IN RANGE    1    ${PerformanceCount}
    \    save excel    ${Excel_File_Path}wifitest.xlsx
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    performance    ${now_row}    1    ${i}
    \    switch application    xiaoduAPP
    \    Tap by position    0    1730    ${udid2}
    \    wait until page contains element    ${text_SysConf}    10s
    \    click element    ${text_SysConf}
    \    wait until page contains element    ${text_WFHS}    10s
    \    click element    ${text_WFHS}
    \    ${status1}=    run keyword and return status    wait until page contains element    ${text_wfhs_switch}    10s
    \    run keyword if    ${status1}    Write Data By Coordinates    performance    ${now_row}    2
    \    ...    environment_success
    \    ...    ELSE    Write Data By Coordinates    performance    ${now_row}    2
    \    ...    environment_fail
    \    run keyword if    '${status1}'!='True'    continue for loop
    \    sleep    2s
    \    ${result1}=    run keyword and return status    page should not contain element    ${text_device_manage}
    \    run keyword and ignore error    click element    ${button_wfhs_switch}
    \    run keyword if    '${result1}'!='True'    run keyword and ignore error    wait until page does not contain element    ${text_device_manage}    10s
    \    run keyword if    '${result1}'!='True'    continue for loop
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    performance    ${now_row}    3    ${start_time}
    \    ${status2}=    run keyword and return status    wait until page contains element    ${text_device_manage}    10s
    \    run keyword if    ${status2}    Write Data By Coordinates    performance    ${now_row}    5
    \    ...    create_success
    \    ...    ELSE    Write Data By Coordinates    performance    ${now_row}    5
    \    ...    create_fail
    \    ${end_time_secs}=    get time    epoch
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    performance    ${now_row}    4    ${duration_time}
    \    run keyword if    '${status2}'!='True'    continue for loop
    \    ${result2}=    run keyword and return status    wait until page contains element    ${text_wfhs_switch}    10s
    \    run keyword if    '${result2}'!='True'    continue for loop
    \    sleep    5s
    \    run keyword and ignore error    click element    ${button_wfhs_switch}
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    performance    ${now_row}    6    ${start_time}
    \    ${status3}=    run keyword and return status    wait until page does not contain element    ${text_device_manage}    10s
    \    run keyword if    ${status3}    Write Data By Coordinates    performance    ${now_row}    8
    \    ...    cancel_success
    \    ...    ELSE    Write Data By Coordinates    performance    ${now_row}    8
    \    ...    cancel_fail
    \    run keyword if    '${status3}'!='True'    continue for loop
    \    ${end_time_secs}=    get time    epoch
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    performance    ${now_row}    7    ${duration_time}

wifi hostpot test after tcu prevision
    Open Excel    ${Excel_File_Path}wifitest.xlsx
    ${last_row}    Get Row Count    prevision
    : FOR    ${i}    IN RANGE    1    ${PerformanceCount}
    \    save excel    ${Excel_File_Path}wifitest.xlsx
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    prevision    ${now_row}    1    ${i}
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    prevision    ${now_row}    2    ${start_time}
    \    Write Data By Coordinates    prevision    ${now_row}    3    tcu provision start
    \    run keyword and ignore error    TCU PROVISION
    \    sleep    20s
    \    enter sysconf page
    \    ${return_status}=      check wfhs repeat
    \    run keyword if    '${return_status}'=='True'    Write Data By Coordinates    prevision    ${now_row}    4    wifihostpot is available
    \    ...    ELSE   Write Data By Coordinates    prevision    ${now_row}    4    wifihostpot is unavailable
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    prevision    ${now_row}    5    ${end_time}
    \    Write Data By Coordinates    prevision    ${now_row}    6    ${duration_time}
    save excel    ${Excel_File_Path}wifitest.xlsx

*** Keywords ***
TS Setup
    [Documentation]    setup for current cases
    ${start_time}=    get time
    #create excel workbook    performance
    #    Login via FP    ${username}    ${password}

TS Teardown
    [Documentation]    teardown for current cases
    #    log    ${init_time}
    #    save excel    ../../${init_time}.xls
    log    reopen application
    #    switch application    FPAPP
    #    Logout FP
    switch application    FPAPP
    #    Tap by coordinator    ${position}    ${deviceName2}

delete vehicle and restart app
    switch application    FPAPP
    quit application
    launch application
    enter personal info
    run keyword and ignore error    delete vehicle

enter sysconf page
    quit application
    launch application
    Tap by position    0    1730    ${udid2}
    wait until page contains element    ${text_SysConf}    10s
    click element    ${text_SysConf}

check wfhs repeat
    : FOR    ${i}    IN RANGE    1    51  #差不多5分钟
    \    ${status1}=    run keyword and return status    wait until page contains element    ${text_WFHS}    2s
    \    run keyword if    '${status1}'=='True'    click element    ${text_WFHS}
    \    ...    ELSE    Run Keywords    enter sysconf page
    \    ...    AND    continue for loop
    \    ${status2}=    run keyword and return status    page should contain element    ${button_wfhs_switch}    2s
    \    run keyword if    '${status2}'!='True'    Run Keywords    click element    ${wfhs_page_back}
    \    ...    AND    continue for loop
    \    ...    ELSE    Run Keywords    capture page screenshot
    \    ...    AND    Return From Keyword    True
    Return From Keyword    False
