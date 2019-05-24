*** Settings ***
Variables  ../../source/du_Page_source/RegisterFordPassPage.yaml
*** Keywords ***
check Register page contain specified text
    page should contain text     ${Text_step1}
    page should contain text     ${Text_step2}
    page should contain text     ${Text_step3}
    page should contain text     ${Text_step4}
    page should contain text     ${Text_Scan_QR_code}
    page should contain text     ${Text_Open_FordPass}
    page should contain text     ${Text_RNR}
    page should contain text     ${Text_Bind_Baidu_Account}
    page should contain text     ${Text_All_Finish}
    page should contain text     ${Text_Login}
    page should contain text     ${Text_Register_FordPass}
