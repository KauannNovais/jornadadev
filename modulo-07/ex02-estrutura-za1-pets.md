# Exercício 2 — Estrutura da tabela ZA1 (Pets)

## a) Campos da tabela

O roteiro informa que a tabela possui os campos de filial, nome do pet, raça e data de nascimento. Como os tamanhos usados em aula não aparecem no PDF, a estrutura abaixo é uma sugestão coerente para recriar a tabela e deve ser ajustada caso o professor tenha utilizado tamanhos diferentes.

| Campo | Descrição | Tipo | Tamanho sugerido |
|---|---|---:|---:|
| `ZA1_FILIAL` | Filial do registro | Caractere | 2 |
| `ZA1_NOME` | Nome do pet | Caractere | 40 |
| `ZA1_RACA` | Raça do pet | Caractere | 30 |
| `ZA1_NASC` | Data de nascimento | Data | 8 |

O campo `ZA1_FILIAL` é obrigatório porque as tabelas do Protheus precisam identificar a filial à qual cada registro pertence.

## b) Índice sugerido

Um índice adequado seria:

```text
ZA1_FILIAL + ZA1_NOME
```

Esse índice organiza primeiro os registros por filial e depois pelo nome do pet. A ideia é parecida com uma lista telefônica: em vez de procurar registro por registro, o sistema consegue localizar os dados de forma ordenada e mais rápida.

## c) Por que o prefixo da tabela é Z?

No Protheus, tabelas iniciadas com a letra `Z` são reservadas para customizações feitas pelo cliente. Isso evita conflito com tabelas padrão do sistema, que são mantidas pela TOTVS.

## d) Por que os campos começam com ZA1_?

Os campos começam com `ZA1_` porque esse é o identificador da tabela. Dessa forma, cada campo fica claramente relacionado à tabela a que pertence, seguindo a convenção do dicionário de dados e evitando nomes soltos ou ambíguos.
