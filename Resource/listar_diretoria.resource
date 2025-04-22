*** Settings ***
Library    RequestsLibrary
Library    string
Library    Collections

*** Variables ***

*** Keywords ***
Contagem de diretoria
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    GET On Session    alias=Blacklist    url=board/count/    headers=${headers}    expected_status=200
    Log    ${resposta.json()}
    Should Be Equal As Strings    ${resposta.status_code}    200

Contagem de diretroria sem token
    ${headers}    Create Dictionary    Authorization=
    ${resposta}    GET On Session    alias=Blacklist    url=board/count/    headers=${headers}    expected_status=403
    Log    ${resposta.json()}
    Should Be Equal As Strings    ${resposta.status_code}    403
    Should Be Equal As Strings    ${resposta.json()["errors"]}    ['No token provided.']  

Não encontrado
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    GET On Session    alias=Blacklist    url=board/count/1234    headers=${headers}    expected_status=404
    Log    ${resposta}
    Should Be Equal As Strings    ${resposta.status_code}    404

Erro Interno do Servidor
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    GET On Session    alias=Blacklist    url=board/coun   headers=${headers}    expected_status=500
    Log    ${resposta.json()}
    Should Be Equal As Strings    ${resposta.status_code}    500
    Should Be Equal As Strings    ${resposta.json()["error"]}    CastError: Cast to ObjectId failed for value "coun" (type string) at path "_id" for model "Board"
     
    
 
       