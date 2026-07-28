# Exercício 1 — Conceitos fundamentais

## a) Qual é a função do AppServer?

O AppServer é o servidor de aplicação do Protheus. Ele recebe as solicitações feitas pelo SmartClient, executa as regras e rotinas do sistema e faz a comunicação com o banco de dados e com os demais serviços do ambiente.

## b) O que é o RPO?

O RPO é o repositório que armazena os programas compilados utilizados pelo Protheus. Quando uma rotina é executada, o AppServer busca no RPO os objetos necessários para processar aquela funcionalidade.

## c) Para que serve o Configurador (SIGACFG)?

O Configurador, também chamado de SIGACFG, serve para administrar e configurar o ambiente do Protheus. Nele é possível trabalhar com o dicionário de dados, criar ou alterar tabelas e campos, configurar índices e realizar outras definições usadas pelo sistema.

## d) Qual a diferença entre campo Real e campo Virtual no SX3?

Um campo Real possui espaço físico na tabela e o seu valor fica gravado no banco de dados. Já um campo Virtual não é armazenado fisicamente: seu conteúdo é calculado ou apresentado durante a execução do sistema, conforme uma regra ou expressão configurada.
