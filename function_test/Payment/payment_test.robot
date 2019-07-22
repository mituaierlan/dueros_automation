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
Variables         ../../source/FP_Gray_Page_source/PaymentPage.yaml

*** Variables ***
${init_time}      ${EMPTY}
${Excel_File_Path}    C:\\Users\\ESG\\dueros_automation\\
${now_row}        ${EMPTY}
${path_string1}    点第
${path_string2}    个^我要吃第
${path_string3}    个^帮我点第
${path_string4}    个
${text_last}      ${EMPTY}

*** Test Cases ***
Payment case1
    enter take out page
    order food

Payment case2
    enter take out page
    order flower

Payment case3
    enter take out page
    order cake

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
    switch application    FPAPP
    #    Tap by coordinator    ${position}    ${deviceName2}

path catenate
    [Arguments]    ${value}
    ${text}=    Catenate    SEPARATOR=    ${path_string1}    ${value}    ${path_string2}    ${value}
    ...    ${path_string3}    ${value}    ${path_string4}
    Return From Keyword    ${text}

swipe to success smooth
    : FOR    ${i}    IN RANGE    1    10
    \    ${status}=    run keyword and return status    Swipe    750    1250    750
    \    ...    850    550
    \    exit for loop if    '${status}'=='True'

swipe to success fast
    : FOR    ${i}    IN RANGE    1    10
    \    ${status}=    run keyword and return status    Swipe    750    1250    750
    \    ...    650    350
    \    exit for loop if    '${status}'=='True'

seek take out page
    : FOR    ${i}    IN RANGE    1    4
    \    run keyword and ignore error    Swipe    950    1450    350    1450    500
    \    ${status}=    run keyword and return status    wait until page contains element    ${text_take}    2s
    \    exit for loop if    '${status}'=='True'

freeze in interface page
    : FOR    ${i}    IN RANGE    1    10
    \    run keyword and ignore error    click element    ${text_take}
    \    ${status1}=    run keyword and return status    wait until page contains element    ${interface_back}    5s
    \    run keyword if    '${status1}'=='True'    back to interface page
    \    exit for loop if    '${status1}'=='True'
    \    ${status2}=    run keyword and return status    wait until page contains element    ${my_order}    5s
    \    exit for loop if    '${status2}'=='True'

enter take out page
    Tap by position    100    80    ${udid2}
    ${status1}=    run keyword and return status    run keyword and ignore error    wait until page contains element    ${icon_car}    2s
    run keyword if    '${status1}'=='True'     Swipe    200    1450    950    1450    200
    ${status2}=    run keyword and return status    run keyword and ignore error    wait until page contains element    ${text_baidumap}    2s
    run keyword if    '${status2}'=='True'     Run Keywords    seek take out page
    \   ...   AND    freeze in interface page

enter order page
    [Arguments]    ${text}
    : FOR    ${i}    IN RANGE    1    10
    \    run keyword and ignore error    click element    ${text}
    \    ${status}=    run keyword and return status    wait until page contains element    ${shopping_car}    5s
    \    ${return}=    Set Variable If    '${status}'=='True'    1    0
    \    exit for loop if    ${return}!=0
    Return From Keyword    ${return}

popup to shop list page
    : FOR    ${i}    IN RANGE    1    10
    \    run keyword and ignore error    Tap by position    500    200    ${udid2}
    \    run keyword and ignore error    Tap by position    100    200    ${udid2}
    \    ${status}=    run keyword and return status    wait until page contains element    ${text_title}    5s
    \    exit for loop if    '${status}'=='True'
    run keyword and ignore error    swipe to success smooth

back to interface page
    : FOR    ${i}    IN RANGE    1    10
    \    run keyword and ignore error    click element    ${interface_back}
    \    ${status}=    run keyword and return status    wait until page contains element    ${my_order}    5s
    \    exit for loop if    '${status}'=='True'

back to shop list page
    : FOR    ${i}    IN RANGE    1    10
    \    run keyword and ignore error    click element    ${shop_back}
    \    ${status}=    run keyword and return status    wait until page contains element    ${text_title}    5s
    \    exit for loop if    '${status}'=='True'
    run keyword and ignore error    swipe to success smooth

back to confirm order page
    : FOR    ${i}    IN RANGE    1    10
    \    run keyword and ignore error    click element    ${pay_back}
    \    ${status}=    run keyword and return status    wait until page contains element    ${shopping_car}    5s
    \    exit for loop if    '${status}'=='True'

pay wait page back to shop list page
    : FOR    ${i}    IN RANGE    1    10
    \    run keyword and ignore error    click element    ${order_back}
    \    ${status}=    run keyword and return status    wait until page contains element    ${shopping_car}    5s
    \    exit for loop if    '${status}'=='True'
    : FOR    ${i}    IN RANGE    1    10
    \    run keyword and ignore error    click element    ${shop_back}
    \    ${status}=    run keyword and return status    wait until page contains element    ${text_title}    5s
    \    exit for loop if    '${status}'=='True'
    run keyword and ignore error    swipe to success smooth

element contain specification
    ${status}    run keyword and return status    Page Should Not Contain Element    ${elementspecification}
    run keyword if    '${status}'!='True'    click element    ${elementspecification}
    ...    ELSE    Return From Keyword    False
    : FOR    ${i}    IN RANGE    1    5
    \    ${status1}=    run keyword and return status    wait until page contains element    ${add_to_shopcar}    5s
    \    run keyword if    '${status1}'=='True'    click element    ${add_to_shopcar}
    \    exit for loop if    '${status1}'=='True'
    \    ${status2}=    run keyword and return status    wait until page contains element    ${add_to_shopcarincrease}    5s
    \    run keyword if    '${status2}'=='True'    click element    ${add_to_shopcarincrease}
    \    exit for loop if    '${status2}'=='True'
    #    click element    ${add_to_shopcar_dismiss}
    run keyword and ignore error    Tap by position    100    190    ${udid2}
    Return From Keyword    True

order page should contain randomfoodnum
    : FOR    ${i}    IN RANGE    1    20
    \    ${status}=    run keyword and return status    wait until page contains element    ${randomfoodnum}    10s
    \    run keyword if    '${status}'=='True'    exit for loop
    \    ...    ELSE    run keyword and ignore error   swipe to success smooth

food index num
    [Arguments]    ${randomfoodnum}
    order page should contain randomfoodnum
    ${num}=    get text    ${randomfoodnum}
    ${food_index}=    path catenate    ${num}
    ${status}=    run keyword and return status    wait until page contains element    ${food_index}    5s
    run keyword if    '${status}'=='True'    click element    ${food_index}

add food
    : FOR    ${i}    IN RANGE    1    20
    \    ${status}=    element contain specification
    \    run keyword if    '${status}'!='True'    food index num    ${randomfoodnum}
    \    run keyword and ignore error   swipe to success smooth
    \    ${order_status}=    run keyword and return status    wait until page contains element    ${text_order_ok}    2s
    \    run keyword and ignore error    exit for loop if    '${order_status}'=='True'
    click element    ${text_order_ok}    #    ${pay_status}=    run keyword and return status    wait until page contains element    ${ok_to_pay}
    ...    # 2s    #    run keyword if    '${pay_status}'=='True'    click element    ${ok_to_pay}
    ...    #    ${status}=    run keyword and return status    Page Should Not Contain Element    ${popup}    #
    ...    # run keyword if    '${status}'!='True'    enter shop car page    #    run keyword if    '${status}'!='True'
    ...    # Return From Keyword    弹窗提示    #    run keyword if    '${pay_status}'!='True'    back to shop list page
    ...    #    run keyword if    '${pay_status}'!='True'    Return From Keyword    无法付款    #
    ...    # ${return_status}=    run keyword and return status    wait until page contains element    ${pay_qrcode}    20s    #
    ...    # run keyword if    '${pay_status}'=='True'    Return From Keyword    二维码成功    #    ...
    ...    # ELSE    Return From Keyword    二维码失败

order food
    Open Excel    ${Excel_File_Path}payment.xlsx
    ${last_row}    Get Row Count    orderfood
    : FOR    ${i}    IN RANGE    1    100
    \    log    ${i}
    \    save excel    ${Excel_File_Path}payment.xlsx
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    orderfood    ${now_row}    1    ${i}
    \    ${start_time}=    get time
    \    Write Data By Coordinates    orderfood    ${now_row}    2    ${start_time}
    \    wait until page contains element    ${randomfood_text}    10s
    \    ${text}=    get text    ${randomfood_text}
    \    Write Data By Coordinates    orderfood    ${now_row}    3    ${text}
    \    ${value}=    enter order page    ${randomfood_text}
    \    run keyword if    ${value}==0    Run Keywords    Write Data By Coordinates    orderfood    ${now_row}    4
    \    ...    网络问题
    \    ...    AND     continue for loop
    \    ${add_status}=    add food
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    orderfood    ${now_row}    5    ${start_time}
    \    ${status1}=    run keyword and return status    wait until page contains element    ${ok_to_pay}    20s
    \    ${status2}=    run keyword and return status    Page Should Not Contain Element    ${popup}
    \    run keyword if    '${status2}'!='True'    Run Keywords    popup to shop list page
    \    ...    AND     Write Data By Coordinates    orderfood    ${now_row}    8    弹窗提示
    \    ...    AND     continue for loop
    \    run keyword if    '${status1}'=='True'    Run Keywords    click element    ${ok_to_pay}
    \    ...    AND     Write Data By Coordinates    orderfood    ${now_row}    8    无法付款
    \    ...    AND     continue for loop
    \    ...    ELSE    pay wait page back to shop list page
    \    ${status3}=    run keyword and return status    wait until page contains element    ${pay_qrcode}    20s
    \    ${end_time}=    get time
    \    ${end_time_secs}=    get time    epoch
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    orderfood    ${now_row}    6    ${end_time}
    \    Write Data By Coordinates    orderfood    ${now_row}    7    ${duration_time}
    \    run keyword if    '${status3}'=='True'    Write Data By Coordinates    orderfood    ${now_row}    8
    \    ...    二维码成功
    \    ...    ELSE    Write Data By Coordinates    orderfood    ${now_row}    8
    \    ...    二维码失败
    \    back to confirm order page
    \    back to shop list page
    save excel    ${Excel_File_Path}payment.xlsx

order flower
    click element    ${flower_order}
    Open Excel    ${Excel_File_Path}payment.xlsx
    ${last_row}    Get Row Count    orderflower
    : FOR    ${i}    IN RANGE    1    100
    \    log    ${i}
    \    save excel    ${Excel_File_Path}payment.xlsx
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    orderflower    ${now_row}    1    ${i}
    \    ${start_time}=    get time
    \    Write Data By Coordinates    orderflower    ${now_row}    2    ${start_time}
    \    wait until page contains element    ${randomflower_text}    10s
    \    ${text}=    get text    ${randomflower_text}
    \    Write Data By Coordinates    orderflower    ${now_row}    3    ${text}
    \    run keyword if    '${text}'=='${text_last}'    swipe to success fast
    \    run keyword if    '${text}'=='${text_last}'    sleep    5s
    \    run keyword if    '${text}'=='${text_last}'    continue for loop
    \    ${text_last}=    get text    ${randomflower_text}
    \    ${value}=    enter order page    ${randomflower_text}
    \    run keyword if    ${value}==0    Write Data By Coordinates    orderflower    ${now_row}    4
    \    ...    网络问题
    \    run keyword if    ${value}==0    continue for loop
    \    ${add_status}=    add food
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    orderflower    ${now_row}    5    ${start_time}
    \    ${status1}=    run keyword and return status    wait until page contains element    ${ok_to_pay}    20s
    \    ${status}=    run keyword and return status    Page Should Not Contain Element    ${popup}
    \    run keyword if    '${status2}'!='True'    popup to shop list page
    \    run keyword if    '${status2}'!='True'    Write Data By Coordinates    orderfood    ${now_row}    8
    \    ...    弹窗提示
    \    run keyword if    '${status2}'!='True'    continue for loop
    \    run keyword if    '${status1}'=='True'    click element    ${ok_to_pay}
    \    run keyword if    '${status1}'!='True'    pay wait page back to shop list page
    \    run keyword if    '${status1}'!='True'    Write Data By Coordinates    orderflower    ${now_row}    8
    \    ...    无法付款
    \    run keyword if    '${status1}'!='True'    continue for loop
    \    ${status3}=    run keyword and return status    wait until page contains element    ${pay_qrcode}    20s
    \    ${end_time}=    get time
    \    ${end_time_secs}=    get time    epoch
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    orderflower    ${now_row}    6    ${end_time}
    \    Write Data By Coordinates    orderflower    ${now_row}    7    ${duration_time}
    \    run keyword if    '${status3}'=='True'    Write Data By Coordinates    orderflower    ${now_row}    8
    \    ...    二维码成功
    \    ...    ELSE    Write Data By Coordinates    orderflower    ${now_row}    8
    \    ...    二维码失败
    \    back to confirm order page
    \    back to shop list page
    save excel    ${Excel_File_Path}payment.xlsx

order cake
    click element    ${cake_order}
    Open Excel    ${Excel_File_Path}payment.xlsx
    ${last_row}    Get Row Count    ordercake
    : FOR    ${i}    IN RANGE    1    100
    \    log    ${i}
    \    save excel    ${Excel_File_Path}payment.xlsx
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    ordercake    ${now_row}    1    ${i}
    \    ${start_time}=    get time
    \    Write Data By Coordinates    ordercake    ${now_row}    2    ${start_time}
    \    wait until page contains element    ${randomcake_text}    10s
    \    ${text}=    get text    ${randomcake_text}
    \    Write Data By Coordinates    ordercake    ${now_row}    3    ${text}
    \    run keyword if    '${text}'=='GANSO元祖蛋糕(江宁南师附中店)'    swipe to success smooth
    \    run keyword if    '${text}'=='GANSO元祖蛋糕(江宁南师附中店)'    continue for loop
    \    run keyword if    '${text}'=='${text_last}'    swipe to success fast
    \    run keyword if    '${text}'=='${text_last}'    sleep    5s
    \    run keyword if    '${text}'=='${text_last}'    continue for loop
    \    ${text_last}=    get text    ${randomcake_text}
    \    ${value}=    enter order page    ${randomcake_text}
    \    run keyword if    ${value}==0    Write Data By Coordinates    ordercake    ${now_row}    4
    \    ...    网络问题
    \    run keyword if    ${value}==0    continue for loop
    \    ${add_status}=    add food
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    ordercake    ${now_row}    5    ${start_time}
    \    ${status1}=    run keyword and return status    wait until page contains element    ${ok_to_pay}    20s
    \    ${status2}=    run keyword and return status    Page Should Not Contain Element    ${popup}
    \    run keyword if    '${status2}'!='True'    popup to shop list page
    \    run keyword if    '${status2}'!='True'    Write Data By Coordinates    orderfood    ${now_row}    8
    \    ...    弹窗提示
    \    run keyword if    '${status2}'!='True'    continue for loop
    \    run keyword if    '${status1}'=='True'    click element    ${ok_to_pay}
    \    run keyword if    '${status1}'!='True'    pay wait page back to shop list page
    \    run keyword if    '${status1}'!='True'    Write Data By Coordinates    ordercake    ${now_row}    8
    \    ...    无法付款
    \    run keyword if    '${status1}'!='True'    continue for loop
    \    ${status3}=    run keyword and return status    wait until page contains element    ${pay_qrcode}    20s
    \    ${end_time}=    get time
    \    ${end_time_secs}=    get time    epoch
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    ordercake    ${now_row}    6    ${end_time}
    \    Write Data By Coordinates    ordercake    ${now_row}    7    ${duration_time}
    \    run keyword if    '${status3}'=='True'    Write Data By Coordinates    ordercake    ${now_row}    8
    \    ...    二维码成功
    \    ...    ELSE    Write Data By Coordinates    ordercake    ${now_row}    8
    \    ...    二维码失败
    \    back to confirm order page
    \    back to shop list page
    save excel    ${Excel_File_Path}payment.xlsx
