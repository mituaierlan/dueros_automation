*** Settings ***
Variables  ../../source/du_Page_source/LoginPage.yaml

*** Keywords ***
Check login status
    [Documentation]  check the status of the login

    run keyword and continue on failure    wait until page contains    ${text_login_success}    30s
    go back
