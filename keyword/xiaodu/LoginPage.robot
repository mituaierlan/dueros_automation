*** Settings ***
Variables  ../../source/du_Page_source/LoginPage.yaml

*** Keywords ***
Check login status
    page should contain text    ${text_login_success}