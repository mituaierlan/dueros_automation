*** Settings ***
Documentation     Suite description
Suite Setup       Launch_app    'FPAPP'    'xiaoduAPP'
Suite Teardown    Close_app
Resource          ../../keyword/common_keyword.robot

*** Keywords ***