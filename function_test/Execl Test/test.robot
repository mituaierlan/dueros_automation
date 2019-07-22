*** Settings ***
Library           Collections    #Library    ExcelLibrary
Library           NewLibrary
Library           openpyxllibrary
Library           ICanLibrary
Library           AppiumLibrary

*** Variables ***
${Names}          ${EMPTY}
${Num}            ${EMPTY}
${Excel_File_Path}    C:\\Users\\ESG\\dueros_automation\\
${SheetName}      Graph Data
${NewSheetName}    NewSheet

*** Test Cases ***
Excel Test
    Run Keyword If    1==1    Run Keywords    log    1
    ...    AND    log    2
    ...    AND    log    3
    TCU PROVISION
    sleep    5
    #Failresponse    true
    #Remote Unlock
    #sleep    5
    #${a}=    Remote Lock
    #sleep    5

Excel Test0
    #${a}=    evaluate    int(36)
    Send Message
    run keyword and ignore error    Wait Until Page Contains Element    0    100s
    #    Set Appium Timeout    6000
    Door Control    36    1
    #Create Excel Workbook    performance
    #Save Excel    ${Excel_File_Path}TestExcel2.xlsx

Excel Test2
    #import library    C:/Users/ESG/AppData/Local/Programs/Python/Python36-32/Lib/site-packages/NewLibrary/myclass.py
    #import library    C:/Users/ESG/Desktop/fouction.py
    #import library    C:/Users/ESG/Desktop/myclass.py
    #Send Message
    #Remote Unlock
    #DRVDoor Ajar
    #sleep    5
    #DRVDoor Close
    #sleep    5
    #Remote Unlock
    #sleep    5
    #Remote Lock
    #sleep    5
    #${add}    add    11    21
    #printMsg    printMsg
    Open Excel    ${Excel_File_Path}TestExcel.xlsx
    #Write Data By Coordinates    TestSheet1    2    2    100
    #${a}    Get Row Count    TestSheet1
    #${b}    Get Column Count    TestSheet1
    #Write Data By Coordinates    TestSheet1    4    4    11
    #${a}    Get Row Count    TestSheet1
    #Save Excel    ${Excel_File_Path}TestExcel.xlsx
    #Send Message
    #Unlock
    #Ignition ON
    #lock
    #Ignition OFF
    #Add Date To Sheet
    #Perform Function and Change Date
    #Create a New Excel
    #Add a New Sheet
    #Check New Sheet Values

*** Keywords ***
Get Values and Modify Spreadsheet
    Open Excel    C:\\Users\\ESG\\dueros_automation\\ExcelRobotTest.xlsx
    printMsg    god
    ${Names}=    Get Sheet Names
    Set Suite Variable    ${Names}
    ${Num}=    Get Number of Sheets
    Set Suite Variable    ${Num}
    ${Col}=    Get Column Count    TestSheet1
    ${Row}=    Get Row Count    TestSheet1
    ${ColVal}=    Get Column Values    TestSheet2    1
    ${RowVal}=    Get Row Values    TestSheet2    1
    ${Sheet}=    Get Sheet Values    DataSheet
    Log    ${Sheet}
    ${Workbook}=    Get Workbook Values    False
    Log    ${Workbook}
    ${ByName}=    Read Cell Data By Name    GraphSheet    B2
    ${ByCoords}=    Read Cell Data By Coordinates    GraphSheet    1    1
    Check Cell Type    TestSheet1    0    1
    Put Number To Cell    TestSheet1    1    1    90
    Put String To Cell    TestSheet3    1    1    yellow
    Put Date To Cell    TestSheet2    1    1    1.4.1989
    Put Date To Cell    TestSheet2    1    2    12.10.1991
    Save Excel    ${Excel_File_Path}TestExcel.xls

Add Date To Sheet
    Open Excel    ${Excel_File_Path}TestExcel.xls
    Add To Date    TestSheet2    1    2    5
    Check Cell Type    TestSheet2    1    2
    Save Excel    ${Excel_File_Path}NewDateExcel.xls

Perform Function and Change Date
    Open Excel    ${Excel_File_Path}NewDateExcel.xls
    Modify Cell With    TestSheet1    1    1    *    45
    Subtract From Date    TestSheet2    1    1    1
    Save Excel    ${Excel_File_Path}FunctionExcel.xls

Create a New Excel
    Create Excel Workbook    NewExcelSheet
    Save Excel    ${Excel_File_Path}NewExcel.xls

Add a New Sheet
    Open Excel    ${Excel_File_Path}FunctionExcel.xls
    Add New Sheet    ${NewSheetName}
    Save Excel    ${Excel_File_Path}NewSheetExcel.xls

Check New Sheet Values
    Open Excel    ${Excel_File_Path}NewSheetExcel.xls
    ${NewNames}=    Get Sheet Names
    ${NewNum}=    Get Number of Sheets
    Should Not Be Equal As Strings    ${Names}    ${NewNames}
    Should Not Be Equal As Integers    ${Num}    ${NewNum}
    ${Sheet}=    Get Sheet Values    TestSheet3    False
    Log    ${Sheet}
    ${stringList}=    Convert To String    ${Sheet}
    Should Contain    ${stringList}    yellow
