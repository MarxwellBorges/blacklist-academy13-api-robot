*** Settings ***
Library    RequestsLibrary
Library    String
Library    collections
Resource    ../Resource/geral.resource
Resource    ../Resource/login.resource


*** Variables ***


*** Keywords ***
Criar diretoria
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable    ${NOME_DIRETORIA}     ${palavra_randomica} 
    Log    ${NOME_DIRETORIA} 

Cadastrar nova diretoria
    ${body}    Create Dictionary    boardName=${NOME_DIRETORIA}
    Log    ${body}
    Criar sessão
    Entrar com usuário administrador
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    POST On Session    alias=Blacklist    url=/board/    json=${body}    headers=${headers}    expected_status=201
    Log    ${resposta.json()}
    Should Be Equal As Strings    ${resposta.json()["msg"]}    Cadastro realizado com sucesso!
    