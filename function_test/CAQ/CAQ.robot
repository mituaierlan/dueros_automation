*** Settings ***
Force Tags        @feature=CAQ
Resource          ../../keyword/common_keyword.robot
Resource          ../../keyword/xiaodu/DashBoardPage.robot
Library          ../../lib/imageIdentify.py
Variables         ../../config/testdata_stage.yaml
*** Test Cases ***
CAQ device should be displayed in the top of BT scan list
    [Tags]    @tcid=006.001   @integration
    [Setup]   TC Setup
    [Teardown]    TC Teardown
    ${outside_pm}=    get outside air quality value
    ${inside_pm}=    evaluate    ${outside_pm}+30
    modify CAQ via adb  ${udid2}    ${inside_pm}
    sleep  1s
    capture page screenshot   ${OUTPUTDIR}/1.png
    sleep  1s
    capture page screenshot   ${OUTPUTDIR}/2.png
    ${result}=    check_identical_images    ${OUTPUTDIR}/1.png    ${OUTPUTDIR}/2.png
    should be true  ${result}


*** Keywords ***
TC Setup
    [Documentation]    setup for current cases
    go back

TC Teardown
    [Documentation]    teardown for current cases
    quit application
    launch application
