# Exercício 2 — Completando a tabela ZA1

## Estrutura da tabela

O PDF informa os campos usados pelo cadastro, a relação do campo Virtual e os dois índices. Entretanto, ele orienta consultar a tabela da apostila para obter os tipos e tamanhos exatos. Como essa tabela não foi incluída no arquivo enviado, os tamanhos abaixo são sugestões e devem ser conferidos no material da aula antes da configuração definitiva.

| Campo | Descrição | Tipo sugerido | Tamanho sugerido | Observação |
|---|---|---:|---:|---|
| `ZA1_FILIAL` | Filial | Caractere | 2 | Campo obrigatório |
| `ZA1_COD` | Código do pet | Caractere | 6 | Chave sequencial |
| `ZA1_NOME` | Nome do pet | Caractere | 40 | Campo real |
| `ZA1_RACA` | Raça | Caractere | 30 | Campo real |
| `ZA1_DTNASC` | Data de nascimento | Data | 8 | Campo real |
| `ZA1_CLIENT` | Código do cliente | Caractere | 6 | Relacionado à SA1 |
| `ZA1_LOJA` | Loja do cliente | Caractere | 2 | Relacionado à SA1 |
| `ZA1_NOMCLI` | Nome do cliente | Caractere | 40 | Campo Virtual |

## Relação do campo ZA1_NOMCLI

O campo `ZA1_NOMCLI` deve ser configurado como Virtual no SX3, usando a seguinte relação:

```advpl
POSICIONE("SA1", 1, xFilial("SA1") + M->ZA1_CLIENT + M->ZA1_LOJA, "A1_NOME")
```

A relação procura o cliente na tabela `SA1`, utilizando a filial atual, o código e a loja informados durante a edição.

## Índices da ZA1 no SIX

### Ordem 1

```text
ZA1_FILIAL + ZA1_COD
```

Esse índice permite localizar o pet pela filial e pelo seu código.

### Ordem 2

```text
ZA1_FILIAL + ZA1_CLIENT + ZA1_LOJA
```

Esse índice organiza os pets pelo cliente e pela loja dentro de cada filial.

## Passos no Configurador

1. Abrir o `SIGACFG`.
2. Acessar o Dicionário de Dados.
3. Localizar a tabela `ZA1` no SX2.
4. Abrir os campos no SX3 e cadastrar ou ajustar todos os campos.
5. Configurar `ZA1_NOMCLI` como Virtual.
6. Inserir a expressão de relação no `X3_RELACAO`.
7. Acessar os índices no SIX.
8. Criar as ordens 1 e 2 com as expressões indicadas.
9. Salvar e atualizar a estrutura do ambiente.
10. Conferir a tabela e os índices no MPSDU em ambiente de desenvolvimento.

## Evidências solicitadas

- Print do SX2.
- Print dos campos no SX3.
- Print dos índices no SIX.
