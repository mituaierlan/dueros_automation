*** Settings ***
Suite Setup       TS Setup
Suite Teardown    TS Teardown
Force Tags        @feature=Account
Resource          ../../keyword/common_keyword.robot
Resource          ../../keyword/FordPass/LoginPage.robot
Resource          ../../keyword/FordPass/DashBoardPage.robot
Resource          ../../keyword/FordPass/AccountPage.robot
Resource          ../../keyword/FordPass/AddVehiclePage.robot
Resource          ../../keyword/FordPass/VehicleDetailsPage.robot
Resource          ../../keyword/xiaodu/LoginPage.robot
Resource          ../../keyword/xiaodu/PersonalSetting.robot
Resource          ../../keyword/xiaodu/QRCodePage.robot
Resource          ../../keyword/xiaodu/RegisterFordPassPage.robot
Variables         ../../config/testdata_stage.yaml
Library           Collections
Library           AppiumLibrary    #Variables    ${my_sheet_index}    #Library    Excellibrary    #Library    ExcelLibrary

*** Variables ***
${my_sheet_index}    ${EMPTY}
${Excel_File_Path}    C:\\Users\\ESG\\dueros_automation\\
${banner_status}    ${EMPTY}

*** Test Cases ***
Add Vehicle
    [Tags]    @tcid=001.002.002    @Regression
    [Setup]
    #    Download and install FordPass and register fordpass account
    #    [Tags]    @tcid=001.002.001    @regression
    #    [Setup]    switch application    xiaoduAPP
    #    [Teardown]    switch application    FPAPP
    #    enter qr code
    #    check QRcode page contain specified text
    #    Enter no fordpass page
    #    ${init_time}=    get time    epoch
    #    capture page screenshot    001_002_001_${init_time}.png
    #    check Register page contain specified text
    ${a}    Set variable    80
    run keyword if    ${a}>=90    log    top
    ...    ELSE IF    ${a}<=80    log    middle
    ...    ELSE IF    ${a}<=60    log    low
    ...    ELSE    log    loser
    log    Hello ${a}
    : FOR    ${i}    IN    10
    \    log    ${i}
    @{abc}    create list    a    b    c    d    e
    : FOR    ${i}    IN    @{abc}
    \    log    ${i}
    \    Exit For Loop If    '${i}'=='d'
    ${d}    evaluate    random.randint(100,150)    random
    log    ${d}
    #import library    C:/Users/ESG/Desktop/fouction.py
    #import library    C:/Users/ESG/dueros_automation/ACSTS/MQTTClient.py
    #send_message
    #import library    C:/Users/ESG/Desktop/vha_excel_common.py
    #get_vha_title_by_warning_code    1
    #write_result
    ${a}    evaluate    int(4)
    ${b}    evaluate    float(5.00)
    ${add}    add    ${a}    ${b}
    log    ${add}
    ${t}=    get time
    sleep    2s
    ${t}=    get time
    log    ${t}
    #Capture Page Screenshot
    scan QR CODE
    # Close RNR
    #go back
    #Auth
    # [Tags]    @tcid=1-2    @happyPath
    # enter vehicle details
    # auth vehicle
    # switch application    xiaoduAPP
    # WAIT UNTIL KEYWORD SUCCEEDS    90s    5s    Check login status

*** Keywords ***
TS Setup
    [Documentation]    setup for current cases
    switch application    FPAPP
    #Login via FP    ${username}    ${password}

TS Teardown
    [Documentation]    teardown for current cases
    log    reopen application
    switch application    FPAPP
    #    quit application
    #    launch application
    #    enter vehicle details
    #    delete vehicle
    Logout FP
    switch application    xiaoduAPP
    #    Tap by coordinator    ${position}    ${deviceName2}
    #    log out duerOS
