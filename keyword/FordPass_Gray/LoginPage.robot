*** Settings ***
Variables   ../../source/FP_Page_source/LoginPage.yaml
*** Keywords ***
Login via FP
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element     id=com.ford.oa.ap:id/login_username_text    90s
    Input Text    ${text_username}    ${username}
    Input Text    ${text_password}    ${password}
    click element    ${button_login}
    enter Pin
    wait until page does not contain    加载中    90s
    run keyword and ignore error    click element  xpath=//*[@text='跳过']

enter Pin
    Wait Until Page Contains Element     ${button_pin_one}    50s
    click element    ${button_pin_one}
    click element    ${button_pin_two}
    click element    ${button_pin_three}
    click element    ${button_pin_four}
    Wait Until Page Contains      确认PIN码
    click element    ${button_pin_one}
    click element    ${button_pin_two}
    click element    ${button_pin_three}
    click element    ${button_pin_four}
    wait until page does not contain    加载中    90s
