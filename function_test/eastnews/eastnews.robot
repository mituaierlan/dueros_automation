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
Variables         ../../source/FP_Gray_Page_source/eastnewsPage.yaml

*** Variables ***

*** Test Cases ***
east news
    sleep    10s
    enter hot news page
    browse hot news
    enter video page
    browse video

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
    #log    reopen application
    #    switch application    FPAPP
    #    Logout FP
    #switch application    FPAPP
    #    Tap by coordinator    ${position}    ${deviceName2}
    Close_app

enter video page
    click element    ${text_video}

enter hot news page
    click element    ${text_news}
    ${status}=    run keyword and return status    wait until page contains element    ${text_hotnews}    5s
    run keyword if    '${status}'=='True'    click element    ${text_hotnews}

browse video
    : FOR    ${i}    IN RANGE    1    100
    \    ${status}    run keyword and return status    Page Should Not Contain Element    ${video_advertisement}
    \    run keyword if    '${status}'!='True'    Run Keywords    swipe smooth
    \    ...    AND    continue for loop
    \    click element    ${second_video}
    \    ${time}=    Evaluate    random.randint(60, 120)    random
    \    sleep    ${time}
    \    video back
    \    swipe smooth

browse hot news
    : FOR    ${i}    IN RANGE    1    100
    \    ${status}    run keyword and return status    Page Should Not Contain Element    ${hotnews_download}
    \    run keyword if    '${status}'!='True'    Run Keywords    swipe smooth
    \    ...    AND    continue for loop
    \    click element    ${first_hotnews}
    \    swipe for news
    \    click element    ${hotnews_back}
    \    click element    ${second_hotnews}
    \    swipe for news
    \    click element    ${hotnews_back}
    \    swipe smooth

swipe smooth
    : FOR    ${i}    IN RANGE    1    10
    \    ${duration_time}=    Evaluate    random.randint(500, 600)    random
    \    ${status}=    run keyword and return status    Swipe    500    1000    500
    \    ...    350    ${duration_time}
    \    exit for loop if    '${status}'=='True'

swipe for news
    : FOR    ${i}    IN RANGE    1    20
    \    swipe smooth
    \    ${sleep_time}=    Evaluate    random.randint(5, 10)    random
    \    sleep    ${sleep_time}

video back
    run keyword and ignore error    Tap by position    50    150    ${udid3}
