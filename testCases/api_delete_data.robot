*** Settings ***
Documentation    Suite description
Resource    ../keywords/keyword.robot
Resource    ../resources/import.robot

*** Test Cases ***
TC1 Delett Data
    Delete Data     10