*** Settings ***
Variables  ../../source/du_Page_source/PersonalSetting.yaml

*** Keywords ***
log out duerOS
    page should contain text    ${text_profile_setting}
    click element    ${text_profile_setting}
    page should contain text    ${text_profile_exit}
    click element    ${text_profile_exit}
    page should contain text    ${text_confirm_exit}
    click element    ${text_confirm_exit}