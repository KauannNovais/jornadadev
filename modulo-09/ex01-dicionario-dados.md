# Exercício 1 — Dicionário de dados completo

Este exercício depende da apostila e do ambiente Protheus. O PDF enviado informa as tabelas, os índices e o domínio, mas não traz a relação completa de campos, tipos e tamanhos. Por isso, abaixo estão apenas as configurações confirmadas pelo roteiro.

## Tabelas no SX2

- `SZ1` — Contatos
- `SZ2` — Interações
- Modo de compartilhamento: **Compartilhado**

## Índices no SIX

### SZ1 — Ordem 1

```text
Z1_FILIAL + Z1_CODIGO
```

### SZ2 — Ordem 1

```text
Z2_FILIAL + Z2_CONTAT + Z2_SEQUEN
```

## Domínio no SX5

Criar o domínio de código `Z2` para os tipos de interação:

| Código | Tipo de interação |
|---|---|
| `E` | E-mail |
| `L` | Ligação |
| `R` | Reunião |
| `V` | Visita |
| `W` | WhatsApp |

> Os textos descritivos acima são interpretações usuais das letras. Confirme na apostila da aula se a turma utilizou descrições diferentes.

## Passos no Configurador

1. Abrir o `SIGACFG`.
2. Acessar o Dicionário de Dados.
3. Criar ou conferir as tabelas `SZ1` e `SZ2` no `SX2`.
4. Definir ambas como compartilhadas, conforme a orientação do exercício.
5. Cadastrar no `SX3` todos os campos indicados na apostila.
6. Conferir se cada campo é Real ou Virtual.
7. Criar os índices no `SIX`.
8. Criar o domínio `Z2` no `SX5`.
9. Atualizar a estrutura e conferir no MPSDU em ambiente de desenvolvimento.

## Evidências

- Print do `SX2`.
- Print dos campos no `SX3`.
- Print dos índices no `SIX`.
- Print do domínio `Z2` no `SX5`.
