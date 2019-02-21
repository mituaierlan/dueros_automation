*** Settings ***
Documentation    Suite description
Resource     ../../keyword/common_keyword.robot
Suite Setup    Test1
suite teardown


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
TEST1
    Launch_mobile_app
