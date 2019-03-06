*** Settings ***
Documentation     Suite description
Suite Setup       Launch_app    'FPAPP'
Suite Teardown    Close_app
Resource          ../../keyword/common_keyword.robot

*** Keywords ***