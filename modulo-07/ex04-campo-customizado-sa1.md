# Exercício 4 — Campo customizado na SA1

Como não estou utilizando o ambiente Protheus nesta entrega, abaixo está a descrição do procedimento que eu seguiria para criar o campo `A1_XAPELID`.

## Definição sugerida

| Propriedade | Valor sugerido |
|---|---|
| Campo | `A1_XAPELID` |
| Título | Apelido |
| Tipo | Caractere |
| Tamanho | 30 |
| Uso | Apelido do cliente |

O roteiro não informa o tamanho exato utilizado em aula, por isso o valor acima é uma sugestão.

## Passo a passo

1. Abriria o Configurador (`SIGACFG`).
2. Entraria na manutenção do dicionário de dados.
3. Localizaria a tabela `SA1`.
4. Abriria a manutenção dos campos.
5. Criaria o campo `A1_XAPELID`, seguindo o padrão usado em aula no campo `A1_VOVO`.
6. Informaria o tipo, o tamanho, o título e as demais propriedades.
7. Salvaria a alteração e atualizaria a estrutura.
8. Reabriria a rotina de cadastro de clientes no SmartClient.
9. Verificaria se o campo `Apelido` apareceu na tela sem necessidade de escrever código.

O campo pode aparecer automaticamente porque a tela utiliza as definições do dicionário de dados.
