*** Settings ***
Variables  ../../source/du_Page_source/QRCodePage.yaml
Library   AppiumLibrary
*** Keywords ***
refresh QR code
    : FOR    ${i}    IN RANGE    1    10
    \    ${status}=    run keyword and return status    check page contain QR code
    \    run keyword if    ${status}     click element   ${QR_code_status}
         ...    ELSE    exit for loop

check page contain QR code
    run keyword and continue on failure   page should contain element    ${QR_code_status}

