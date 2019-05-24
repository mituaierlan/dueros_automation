*** Settings ***
Variables  ../../source/du_Page_source/QRCodePage.yaml
*** Keywords ***
refresh QR code
    : FOR    ${i}    IN RANGE    1    10
    \    ${status}=    run keyword and return status    check page contain QR code
    \    run keyword if    ${status}     click element   ${QR_code_status}
         ...    ELSE    exit for loop

check page contain QR code
    run keyword and continue on failure   page should contain element    ${QR_code_status}

check QRcode page contain specified text
    page should contain text     ${Text_login_to_unlock_more_function}
    page should contain text    ${Text_vin}
    page should contain text    ${Text_CAF_Phone}
    page should contain text    ${Text_Phone_Number}
    page should contain text    ${Text_Scan_to_login}
    page should contain text    ${Text_no_fordPass}

Enter no fordpass page
    click text     ${Text_no_fordPass}