*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o organo
Test Teardown     Fechar o navegador

*** Test Cases ***
Verificar se ao não preencher os campos do formulário corretamente algum card é criado
    Dado que eu clique no botão criar card
    Então deve apresentar uma mensagem de erro para o campo nome
    E deve apresentar uma mensagem de erro para o campo cargo
    E deve apresentar uma mensagem de erro para o campo times
