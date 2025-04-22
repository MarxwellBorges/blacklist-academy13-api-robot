*** Settings ***

Resource    ../Resource/geral.resource
Resource    ../Resource/login.resource
Resource    ../Resource/listar_diretoria.resource




*** Test Cases ***
CT03 - Contagem de diretoria
    Criar sessão
    Entrar com usuário administrador
    Contagem de diretoria

CT04 - Contagem de diretoria sem token
    Criar sessão
    Entrar com usuário administrador
    Contagem de diretroria sem token

CT05 - Não encontrado
    Criar sessão
    Entrar com usuário administrador
    Não encontrado

CT06 - Erro interno
    Criar sessão
    Entrar com usuário administrador
    Erro Interno do Servidor
    
    

   