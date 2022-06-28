*** Settings ***
Documentation    Update Data in Talbe
Resource    ../keywords/keyword.robot
Resource    ../resources/import.robot
*** Test Cases ***
TC1 Update Data
    Update Data     11      AhPev     Cambodia

TC2 POST Login Mount Bank
    Login Mountbank     someas      password
#    Verify login        someas      password