# Exercício 3 — Recriando a ZA1 no Configurador

Como não estou utilizando o ambiente Protheus nesta entrega, abaixo está a descrição do procedimento que eu seguiria.

## Passo a passo

1. Acessaria o Protheus pelo SmartClient e abriria o Configurador (`SIGACFG`).
2. Entraria na área de dicionário de dados e procuraria a manutenção de tabelas.
3. Criaria a tabela customizada `ZA1`, observando o caminho correto do arquivo e as informações obrigatórias.
4. Confirmaria o registro da tabela no `SX2`.
5. Cadastraria no `SX3` os campos `ZA1_FILIAL`, `ZA1_NOME`, `ZA1_RACA` e `ZA1_NASC`.
6. Definiria os títulos dos campos com atenção ao limite de tamanho apresentado no Browse.
7. Criaria um índice usando `ZA1_FILIAL + ZA1_NOME`.
8. Salvaria as alterações e executaria a atualização necessária para criar ou ajustar a estrutura física.
9. Executaria a rotina de fórmulas mostrada em aula para forçar o reconhecimento da tabela pelo framework.
10. Abriria o MPSDU em ambiente de desenvolvimento e conferiria a tabela, os campos e o índice.

## Pontos de atenção

- Conferir o caminho do arquivo.
- Não esquecer o campo obrigatório de filial.
- Respeitar o limite de tamanho dos títulos no Browse.
- Usar o MPSDU somente em ambiente de desenvolvimento.
