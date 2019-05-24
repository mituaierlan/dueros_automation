*** Settings ***
Variables  ../../source/du_Page_source/DashBoardPage.yaml
Library  AppiumLibrary
*** Keywords ***
get outside air quality value
    [Documentation]  check the status of the login

    ${result}=    get element attribute    ${id_pm_out}    text
    ${result}=    should match regexp  ${result}    \\d+
    [Return]    ${result}

verify popup content
    wait until page contains   开启外循环    1s
