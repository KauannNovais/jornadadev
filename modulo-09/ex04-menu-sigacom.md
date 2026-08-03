# Exercício 4 — Menu no SIGACOM

## Configuração esperada

No `SIGACFG`, acessar o Menu do Sistema e localizar o módulo de Compras (`SIGACOM`).

Criar no grupo **Cadastros** as opções:

```text
Cadastros
├── Contatos
└── Interações (todas)
```

## Opção Contatos

- Nome: `Contatos`
- Tipo: Função de usuário
- Programa:

```text
STTIP003
```

## Opção Interações (todas)

- Nome: `Interações (todas)`
- Tipo: Função de usuário
- Programa:

```text
STTIP004B
```

A função `STTIP004B` abre o Browse geral da `SZ2`, sem o filtro de contato usado pela `STTIP004`.

## Teste

1. Entrar no módulo de Compras.
2. Abrir `Cadastros > Contatos`.
3. Confirmar que a rotina `STTIP003` abre sem erro.
4. Abrir `Cadastros > Interações (todas)`.
5. Confirmar que a rotina `STTIP004B` apresenta todos os registros.
