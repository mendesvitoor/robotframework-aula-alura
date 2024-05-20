*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${URL}                    http://localhost:3000/
${BOTAO_CARD}             id:form-botao
${CAMPO_NOME_ERRO}        id:form-nome-erro
${CAMPO_CARGO_ERRO}       id:form-cargo-erro
${CAMPO_TIMES_ERRO}       id:form-times-erro
@{SELECIONAR_TIMES}
...           //option[contains(.,'Programação')]
...           //option[contains(.,'Front-End')]
...           //option[contains(.,'Data Science')]
...           //option[contains(.,'Devops')] 
...           //option[contains(.,'UX e Design')]
...           //option[contains(.,'Mobile')]
...           //option[contains(.,'Inovação e Gestão')]


*** Keywords ***

Dado que eu preencha os campos do formulário
    ${NOME}    FakerLibrary.First Name
    Input Text    ${CAMPO_NOME}    ${NOME}
    ${CARGO}     FakerLibrary.Job
    Input Text    ${CAMPO_CARGO}    ${CARGO}
    ${IMAGEM}    FakerLibrary.Image Url
    Input Text    ${CAMPO_IMAGEM}    ${IMAGEM}
    Click Element    ${CAMPO_TIME}
    Click Element    ${SELECIONAR_TIMES}[0]

E clique no botão criar card
    Click Element    class:botao

Então identificar o card dentro do time esperado
    Element Should Be Visible    class:colaborador

Então identificar 3 card criado no time esperado
    FOR    ${i}    IN RANGE    1    3
    Dado que eu preencha os campos do formulário
    E clique no botão criar card
    END

Então criar e identificar 1 card em cada time disponivel
    FOR    ${indice}    ${time}    IN ENUMERATE    @{SELECIONAR_TIMES}
        Dado que eu preencha os campos do formulário
        Click Element    ${time}
        E clique no botão criar card
    END
    
Dado que eu clique no botão criar card
    Click Element    class:botao

Então deve apresentar uma mensagem de erro para o campo nome
    Element Should Be Visible    ${CAMPO_NOME_ERRO}

E deve apresentar uma mensagem de erro para o campo cargo
    Element Should Be Visible    ${CAMPO_CARGO_ERRO}

E deve apresentar uma mensagem de erro para o campo times
    Element Should Be Visible    ${CAMPO_TIMES_ERRO}
