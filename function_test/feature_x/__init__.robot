*** Settings ***
Documentation    Suite description
suite setup
suite teardown
resource   ../../keyword/Login

*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
Provided precondition
    Setup system under test