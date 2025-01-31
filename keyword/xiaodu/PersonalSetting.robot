*** Settings ***
Variables  ../../source/du_Page_source/PersonalSetting.yaml

*** Keywords ***
enter qr code
    wait until page contains element    ${text_not_login}    5s
    sleep     2s
    click element    ${text_user_photo}
log out duerOS
    page should contain text    ${text_profile_setting}
    click element    ${text_profile_setting}
    page should contain text    ${text_profile_exit}
    click element    ${text_profile_exit}
    page should contain text    ${text_confirm_exit}
    click element    ${text_confirm_exit}


check the status of login
    run keyword and continue on failure  wait until page contains element     ${text_not_login}    30s
