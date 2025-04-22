*** Settings ***



Resource    ../Resource/geral.resource
Resource    ../Resource/login.resource
Resource    ../Resource/criar_diretoria.resource

*** Test Cases ***
CT02 - Criar diretoria
    Criar sessão
    Entrar com usuário administrador
    Criar diretoria
    Cadastrar nova diretoria