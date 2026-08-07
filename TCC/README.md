# TCC 

Este projeto foi desenvolvido como Trabalho de Conclusão do Start TOTVS

Não tive acesso a um ambiente Protheus com SmartClient, AppServer, RPO e
TDS/DevStudio durante a preparação da entrega. Por esse motivo, seguindo
as orientações do enunciado, o dicionário de dados foi documentado em
arquivos CSV e os fontes ADVPL foram escritos, organizados e comentados.

As funcionalidades que dependem do ambiente Protheus, como execução das
rotinas mBrowse, configuração visual do dicionário e geração de prints,
não puderam ser executadas.

Foram preparados para implementação no ambiente:

- Tabela ZZ1 com campos e índices;
- Tabela ZZ2 e relacionamento com ZZ1;
- Validações de fornecedor, produto, datas e tolerância;
- Campos virtuais;
- Gatilhos SX7;
- Consultas padrão SXB;
- Rotinas STTZZ1 e STTZZ2;
- Biblioteca STTZZLIB;
- Tratamento de erros com BEGIN SEQUENCE;
- Transações com CommitTran e RollBackTran;
- Integridade referencial entre ZZ1 e ZZ2.

Quando disponibilizado um ambiente Protheus, o próximo passo é configurar
o dicionário conforme os arquivos da pasta Dados-e-Dicionario, compilar
os fontes e executar o plano de testes descrito neste projeto.