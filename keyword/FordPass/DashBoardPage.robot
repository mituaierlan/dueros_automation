*** Settings ***
Variables         ../../source/FP_Page_source
Library           AppiumLibrary
Library           NewLibrary    #Library    ExcelLibrary
Library           openpyxllibrary
Library           ICanLibrary

*** Variables ***
${banner_status}    ${EMPTY}
${press_type}     ${EMPTY}
${now_row}        ${EMPTY}

*** Keywords ***
remote start
    Open Excel    ${Excel_File_Path}TestExcel.xlsx
    ${last_row}    Get Row Count    TestSheet3
    ${sshot_num}    set variable    1
    : FOR    ${i}    IN RANGE    1    5
    \    Save Excel    ${Excel_File_Path}TestExcel.xlsx
    \    quit application
    \    launch application
    \    enter index page
    \    enter vehicle status page
    \    enter index page
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    TestSheet3    ${now_row}    1    ${i}
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet3    ${now_row}    2    ${start_time}
    \    ${fd_status}=    run keyword and return status    Page Should Contain Element    ${text_start}
    \    run keyword if    ${fd_status}    Write Data By Coordinates    TestSheet3    ${now_row}    5
    \    ...    environment success
    \    ...    ELSE    Write Data By Coordinates    TestSheet3    ${now_row}    5
    \    ...    environment failed
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet3    ${now_row}    3    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet3    ${now_row}    4    ${duration_time}
    \    #    Capture Page Screenshot    ${sshot_num}.png
    \    #    ${sshot_num}    evaluate    ${sshot_num}+1
    \    run keyword if    '${fd_status}'!='True'    Capture Page Screenshot
    \    run keyword if    '${fd_status}'!='True'    continue for loop
    \    Long Press    ${text_start}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet3    ${now_row}    7    ${start_time}
    \    ${time_out}    run keyword and return status    Wait Until Page Contains Element    ${text_banner}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet3    ${now_row}    10
    \    ...    start_timeout
    \    run keyword if    '${time_out}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${return_status}    run keyword and return status    Element Should Not Contain Text    ${text_banner}    ${text_addtime}
    \    run keyword if    '${return_status}' != 'True'    Write Data By Coordinates    TestSheet3    ${now_row}    10
    \    ...    start_ever
    \    run keyword if    '${return_status}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${return_status}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    ${banner_error}=    check banner error    ${text}
    \    run keyword if    ${banner_error} >= 1    Capture Page Screenshot
    \    run keyword if    ${banner_error} >= 1    Write Data By Coordinates    TestSheet3    ${now_row}    10
    \    ...    ${text}
    \    run keyword if    ${banner_error} >= 1    continue for loop
    \    Write Data By Coordinates    TestSheet3    ${now_row}    10    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet3    ${now_row}    8    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet3    ${now_row}    9    ${duration_time}
    \    Long Press    ${text_start}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet3    ${now_row}    12    ${start_time}
    \    ${time_out}    run keyword and return status    wait until page contains    ${text_shutdown}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet3    ${now_row}    15
    \    ...    shutdown_timeout
    \    run keyword if    '${time_out}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    Write Data By Coordinates    TestSheet3    ${now_row}    15    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet3    ${now_row}    13    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet3    ${now_row}    14    ${duration_time}
    Save Excel    ${Excel_File_Path}TestExcel.xlsx

Lock Unlock
    Open Excel    ${Excel_File_Path}TestExcel.xlsx
    ${last_row}    Get Row Count    TestSheet2
    ${sshot_num}    set variable    1
    : FOR    ${i}    IN RANGE    1    3
    \    Save Excel    ${Excel_File_Path}TestExcel.xlsx
    \    quit application
    \    launch application
    \    enter index page
    \    enter vehicle status page
    \    enter index page
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    TestSheet2    ${now_row}    1    ${i}
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet2    ${now_row}    2    ${start_time}
    \    ${fd_status}=    run keyword and return status    Page Should Contain Element    ${text_start}
    \    run keyword if    ${fd_status}    Write Data By Coordinates    TestSheet2    ${now_row}    5
    \    ...    environment success
    \    ...    ELSE    Write Data By Coordinates    TestSheet2    ${now_row}    5
    \    ...    environment failed
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet2    ${now_row}    3    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet2    ${now_row}    4    ${duration_time}
    \    run keyword if    '${fd_status}'!='True'    continue for loop
    \    Remote Lock
    \    sleep    5s
    \    Long press    ${text_unlock}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet2    ${now_row}    7    ${start_time}
    \    ${time_out}    run keyword and return status    Wait Until Page Contains Element    ${text_banner}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet2    ${now_row}    10
    \    ...    unlock_timeout
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    Write Data By Coordinates    TestSheet2    ${now_row}    10    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet2    ${now_row}    8    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet2    ${now_row}    9    ${duration_time}
    \    Door Control    36    1
    \    sleep    5s
    \    Long Press    ${text_lock}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet2    ${now_row}    12    ${start_time}
    \    ${time_out}    run keyword and return status    Wait Until Page Contains Element    ${text_banner}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet2    ${now_row}    15
    \    ...    lock_timeout
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    Write Data By Coordinates    TestSheet2    ${now_row}    15    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet2    ${now_row}    13    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet2    ${now_row}    14    ${duration_time}
    \    Door Control    36    0
    \    sleep    5s
    \    Long Press    ${text_lock}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet2    ${now_row}    17    ${start_time}
    \    ${time_out}    run keyword and return status    Wait Until Page Contains Element    ${text_banner}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet2    ${now_row}    20
    \    ...    lock_timeout
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    Write Data By Coordinates    TestSheet2    ${now_row}    20    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet2    ${now_row}    18    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet2    ${now_row}    19    ${duration_time}
    Save Excel    ${Excel_File_Path}TestExcel.xlsx

command control
    Open Excel    ${Excel_File_Path}TestExcel.xlsx
    ${last_row}    Get Row Count    TestSheet1
    ${sshot_num}    set variable    1
    : FOR    ${i}    IN RANGE    1    20
    \    Save Excel    ${Excel_File_Path}TestExcel.xlsx
    \    quit application
    \    launch application
    \    enter index page
    \    enter vehicle status page
    \    enter index page
    \    ${now_row}=    evaluate    ${i}+1+${last_row}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    1    ${i}
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    2    ${start_time}
    \    ${fd_status}=    run keyword and return status    Page Should Contain Element    ${text_start}
    \    run keyword if    ${fd_status}    Write Data By Coordinates    TestSheet1    ${now_row}    5
    \    ...    environment success
    \    ...    ELSE    Write Data By Coordinates    TestSheet1    ${now_row}    5
    \    ...    environment failed
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    3    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    4    ${duration_time}
    \    #    Capture Page Screenshot    ${sshot_num}.png
    \    #    ${sshot_num}    evaluate    ${sshot_num}+1
    \    run keyword if    '${fd_status}'!='True'    Capture Page Screenshot
    \    run keyword if    '${fd_status}'!='True'    continue for loop
    \    run keyword and ignore error    Long Press    ${text_start}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    7    ${start_time}
    \    ${time_out}    run keyword and return status    Wait Until Page Contains Element    ${text_banner}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet1    ${now_row}    10
    \    ...    start_timeout
    \    run keyword if    '${time_out}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${return_status}    run keyword and return status    Element Should Not Contain Text    ${text_banner}    ${text_addtime}
    \    run keyword if    '${return_status}' != 'True'    Write Data By Coordinates    TestSheet1    ${now_row}    10
    \    ...    start_ever
    \    run keyword if    '${return_status}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${return_status}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    ${banner_error}=    check banner error    ${text}
    \    run keyword if    ${banner_error} >= 1    Capture Page Screenshot
    \    run keyword if    ${banner_error} >= 1    Write Data By Coordinates    TestSheet1    ${now_row}    10
    \    ...    ${text}
    \    run keyword if    ${banner_error} >= 1    continue for loop
    \    Write Data By Coordinates    TestSheet1    ${now_row}    10    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    8    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    9    ${duration_time}
    \    run keyword and ignore error    Long Press    ${text_start}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    12    ${start_time}
    \    ${time_out}    run keyword and return status    wait until page contains    ${text_shutdown}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet1    ${now_row}    15
    \    ...    shutdown_timeout
    \    run keyword if    '${time_out}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    Write Data By Coordinates    TestSheet1    ${now_row}    15    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    13    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    14    ${duration_time}
    \    run keyword and ignore error    Remote Lock
    \    sleep    5s
    \    run keyword and ignore error    Long press    ${text_unlock}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    17    ${start_time}
    \    ${time_out}    run keyword and return status    Wait Until Page Contains Element    ${text_banner}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet1    ${now_row}    20
    \    ...    unlock_timeout
    \    run keyword if    '${time_out}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    Write Data By Coordinates    TestSheet1    ${now_row}    20    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    18    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    19    ${duration_time}
    \    run keyword and ignore error    Door Control    36    1
    \    sleep    5s
    \    run keyword and ignore error    Long Press    ${text_lock}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    22    ${start_time}
    \    ${time_out}    run keyword and return status    Wait Until Page Contains Element    ${text_banner}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet1    ${now_row}    25
    \    ...    lock_timeout
    \    run keyword if    '${time_out}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    Write Data By Coordinates    TestSheet1    ${now_row}    25    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    23    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    24    ${duration_time}
    \    run keyword and ignore error    Door Control    36    0
    \    sleep    5s
    \    run keyword and ignore error    Long Press    ${text_lock}    4000
    \    ${start_time_secs}=    get time    epoch
    \    ${start_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    27    ${start_time}
    \    ${time_out}    run keyword and return status    Wait Until Page Contains Element    ${text_banner}    90s
    \    run keyword if    '${time_out}' != 'True'    Write Data By Coordinates    TestSheet1    ${now_row}    30
    \    ...    lock_timeout
    \    run keyword if    '${time_out}' != 'True'    Capture Page Screenshot
    \    run keyword if    '${time_out}' != 'True'    continue for loop
    \    ${text}=    check banner status
    \    Write Data By Coordinates    TestSheet1    ${now_row}    30    ${text}
    \    ${end_time_secs}=    get time    epoch
    \    ${end_time}=    get time
    \    Write Data By Coordinates    TestSheet1    ${now_row}    28    ${end_time}
    \    ${duration_time}=    evaluate    ${end_time_secs}-${start_time_secs}
    \    Write Data By Coordinates    TestSheet1    ${now_row}    29    ${duration_time}
    Save Excel    ${Excel_File_Path}TestExcel.xlsx

check page contain Register code
    run keyword and continue on failure    page should contain element    ${text_recognized_ok}    20s
    #sleep    5s

check banner error
    [Arguments]    ${text}
    ${banner_error}    Set variable    0
    : FOR    ${i}    IN RANGE    1    3
    \    ${banner_error}=    Set Variable If    '${text}' == '${text_net_error}'    1    0
    \    exit for loop if    ${banner_error}!=0
    \    ${banner_error}=    Set Variable If    '${text}' == '${text_alert}'    2    0
    \    exit for loop if    ${banner_error}!=0
    \    ${banner_error}=    Set Variable If    '${text}' == '${text_startagain}'    3    0
    \    exit for loop
    Return From Keyword    ${banner_error}

check banner status
    ${banner_status}    Set variable    0
    ${text}=    get text    ${text_banner}
    #    : FOR    ${i}    IN RANGE    1    3
    #    ${banner_status}=    Set Variable If    '${text}' == '${text_alert}'    1    0
    #    exit for loop if    ${banner_status}!=0
    #    ${banner_status}=    Set Variable If    '${text}' == '${text_startagain}'    2    0
    #    exit for loop if    ${banner_status}!=0
    #    ${banner_status}=    Set Variable If    '${text}' == '${text_startok}'    3    0
    #    exit for loop if    ${banner_status}!=0
    #    ${banner_status}=    Set Variable If    '${text}' == '${text_shutdown}'    4    0
    #    exit for loop if    ${banner_status}!=0
    #    ${banner_status}=    Set Variable If    '${text}' == '${text_unlockok}'    5    0
    #    exit for loop if    ${banner_status}!=0
    #    ${banner_status}=    Set Variable If    '${text}' == '${text_lockok}'    6    0
    #    exit for loop if    ${banner_status}!=0
    #    ${banner_status}=    Set Variable If    '${text}' == '${text_syserror}'    7    0
    #    exit for loop
    ${return_status}    run keyword and return status    Page Should Contain Element    ${text_banner_close}
    run keyword if    '${return_status}' == 'True'    click element    ${text_banner_close}
    #    run keyword if    ${banner_status} >= 1    click element    ${text_banner_close}
    #Return From Keyword    ${banner_status}
    Return From Keyword    ${text}

text change
    [Arguments]    ${value}
    : FOR    ${i}    IN RANGE    1    3
    \    ${text}=    Set Variable If    ${value} == 0    其他报警    0
    \    exit for loop if    '${text}'!='0'
    \    ${text}=    Set Variable If    ${value} == 1    警示：车辆未能启动    0
    \    exit for loop if    '${text}'!='0'
    \    ${text}=    Set Variable If    ${value} == 2    请点击并长按进行重试    0
    \    exit for loop if    '${text}'!='0'
    \    ${text}=    Set Variable If    ${value} == 3    车辆已启动    0
    \    exit for loop if    '${text}'!='0'
    \    ${text}=    Set Variable If    ${value} == 4    车辆已熄火    0
    \    exit for loop if    '${text}'!='0'
    \    ${text}=    Set Variable If    ${value} == 5    车门已解锁    0
    \    exit for loop if    '${text}'!='0'
    \    ${text}=    Set Variable If    ${value} == 6    车门已上锁    0
    \    exit for loop if    '${text}'!='0'
    \    ${text}=    Set Variable If    ${value} == 7    抱歉，系统异常。    0
    \    exit for loop
    Return From Keyword    ${text}

scan qr code
    enter index page
    wait until page contains element    ${scan_qr_code}    60s
    log    scan qr code
    click element    ${scan_qr_code}
    run keyword and continue on failure    wait until page contains    ${text_recognized}    60s

enter vehicle details
    run keyword and ignore error    choose vehicle
    wait until page contains element    ${vehicle_details}    5s
    click element    ${vehicle_details}
    wait until page does not contain    加载中    90s

choose vehicle
    wait until page contains element    ${text_vehicle}    20s
    sleep    2s
    click element    ${text_vehicle}
    wait until page does not contain    加载中    90s

enter index page
    wait until page contains element    ${text_index_page}    20s
    click element    ${text_index_page}

enter vehicle status page
    wait until page contains element    ${text_vehicle_status_page}    20s
    click element    ${text_vehicle_status_page}
