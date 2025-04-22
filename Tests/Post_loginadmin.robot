*** Settings ***
Resource    ../Resource/geral.resource
Resource    ../Resource/login.resource


*** Test Cases ***
CT 01 - Login administrador
    Criar sessão
    Entrar com usuário administrador
    Validar o token 
