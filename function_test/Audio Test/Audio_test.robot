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
Variables         ../../source/FP_Gray_Page_source/AudiotestPage.yaml

*** Variables ***
${Excel_File_Path}    C:\\Users\\ESG\\dueros_automation\\

*** Test Cases ***
audio test
    choose audio app
    enter music page
    Open Excel    ${Excel_File_Path}Audiotest.xlsx
    ${last_row}    Get Row Count    TestSheet1
    : FOR    ${i}    IN RANGE    1    200
    \    log    ${i}
    \    save excel    ${Excel_File_Path}Audiotest.xlsx
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    1    ${i}
    \    ${start_time}=    get time
    \    ${start_time_secs}=    get time    epoch
    \    Write Data By Coordinates    TestSheet1    ${now_row}    2    ${start_time}
    \    sleep    5s
    \    #    ${a}    evaluate    int(${i})
    \    #    click element    ${text_search_banner}
    \    #    Input Text    ${text_search_banner}    ${a}
    \    #    Tap by position    976    1650    ${udid2}
    \    #    ${status}=    run keyword and return status    wait until page contains element    ${text_song1}    2s
    \    #    run keyword if    '${status}'=='True'    click element    ${text_song1}
    \    ${status2}=    check song button
    \    run keyword if    '${status2}'=='True'    Run Keywords    click next song
    \    ...    AND    Write Data By Coordinates    TestSheet1    ${now_row}    3
    \    ...    无需重进
    \    ...    ELSE    Run Keywords    reenter music page
    \    ...    AND    Write Data By Coordinates    TestSheet1    ${now_row}    3
    \    ...    需要重进
    \    ...    AND    continue for loop
    \    ${songname}=    get text    ${text_songname}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    4    ${songname}
    \    ${song_duration}=    check duration time circulation
    \    Write Data By Coordinates    TestSheet1    ${now_row}    5    ${song_duration}
    save excel    ${Excel_File_Path}Audiotest.xlsx

*** Keywords ***
TS Setup
    [Documentation]    setup for current cases
    ${start_time}=    get time
    #    create excel workbook    performance
    #    Login via FP    ${username}    ${password}

TS Teardown
    [Documentation]    teardown for current cases
    #    log    ${init_time}
    #    save excel    ../../${init_time}.xls
    log    reopen application
    #    switch application    FPAPP
    #    Logout FP
    #switch application    xiaoduAPP
    #    Tap by coordinator    ${position}    ${deviceName2}

variable assignment
    [Arguments]    ${value}
    ${value_return}=    evaluate    ${value}
    Return From Keyword    ${value_return}

seek audio page
    : FOR    ${i}    IN RANGE    1    4
    \    ${status}=    run keyword and return status    wait until page contains element    ${text_audio_app}    2s
    \    exit for loop if    '${status}'=='True'
    \    run keyword and ignore error    Swipe    950    1450    350    1450
    \    ...    500
    click element    ${text_audio_app}

tap audio app
    Tap by position    500    1500    ${udid2}

choose audio app
    #    switch application    xiaoduAPP
    #    launch application
    #    Tap by position    100    80    ${udid2}
    #    ${status1}=    run keyword and return status    run keyword and ignore error    wait until page contains element    ${icon_car}    2s
    #    run keyword if    '${status1}'=='True'    Swipe    200    1450    950
    # 1450
    #    ...    200
    #    ${status2}=    run keyword and return status    run keyword and ignore error    wait until page contains element    ${text_baidumap}    2s
    #    run keyword if    '${status2}'=='True'    seek audio page
    #Tap by position    100    80    ${udid2}
    Go Back
    Swipe    200    1450    950    1450    200
    tap audio app

enter music page
    ${status1}=    run keyword and return status    wait until page contains element    ${text_music}    10s
    run keyword if    '${status1}'=='True'    click element    ${text_music}
    ...    ELSE    Return From Keyword    False
    ${status2}=    run keyword and return status    wait until page contains    ${text_mylike}    10s
    run keyword if    '${status2}'=='True'    click text    ${text_mylike}
    ...    ELSE    Return From Keyword    False
    Return From Keyword    True

reenter music page
    ${status1}=    run keyword and return status    wait until page contains element    ${text_back}    10s
    run keyword if    '${status1}'=='True'    click element    ${text_back}
    ${status2}=    run keyword and return status    wait until page contains    ${text_fashion}    10s
    run keyword if    '${status2}'=='True'    click element    ${text_audio}
    enter music page

check song button
    ${status}=    run keyword and return status    wait until page contains element    ${text_nextmusic}    10s
    run keyword if    '${status}'=='True'    Return From Keyword    True
    ...    ELSE    Return From Keyword    False

click pre song
    click element    ${text_premusic}

click next song
    click element    ${text_nextmusic}

check duration time circulation
    sleep    3s
    : FOR    ${i}    IN RANGE    1    100
    \    ${text}=    get text    ${text_duration}
    \    run keyword if    '${text}'=='00:00'    capture page screenshot
    \    ...    AND    exit for loop
    Return From Keyword    ${text}
