*** Settings ***
Library    RequestsLibrary
Library    string
Library    collections



*** Variables ***
${url}    https://black-list.qacoders.dev.br/api
${login}    sysadmin@qacoders.com
${password}    1234@Test    




*** Keywords ***
Criar sessão
    ${headers}    Create Dictionary    accept=application/json  Content-Type=application/json   
    Create Session    alias=Blacklist    url=${url}    headers=${headers}
