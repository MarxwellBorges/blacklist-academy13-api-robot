*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Resource    ../Resource/geral.resource

*** Variables ***

*** Keywords ***
Entrar com usuário administrador 
    ${body}    Create Dictionary    mail=${login}    password=${password}
    Log    ${body}
    Criar sessão
    ${resposta}    POST On Session    alias=Blacklist    url=/login/    json=${body}
    Log    ${resposta.json()}
    Set Test Variable    ${TOKEN}    ${resposta.json()["token"]}

Validar o token
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    GET On Session    alias=Blacklist    url=/validateToken    headers=${headers}
    log    ${TOKEN}




