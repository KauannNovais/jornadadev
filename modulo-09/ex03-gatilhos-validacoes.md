# Exercício 3 — Gatilhos, campos virtuais e validações cruzadas

## Campos virtuais da SZ2

O roteiro informa que `Z2_CODIGO` e `Z2_ASSUNT` devem ser configurados como campos Virtuais usando `POSICIONE()` no `X3_RELACAO`.

A expressão exata depende dos campos e da chave definidos na apostila. O padrão indicado pelo material é:

```advpl
POSICIONE("SZ1", 1, xFilial("SZ1") + M->Z2_CONTAT, "CAMPO_DA_SZ1")
```

Para cada campo Virtual, deve-se substituir `CAMPO_DA_SZ1` pelo campo correto da tabela `SZ1`.

## Gatilhos automáticos na SZ2

### Data

- Campo de origem: conforme a configuração da tela
- Contra-domínio: `Z2_DATA`
- Regra:

```advpl
dDataBase
```

### Hora

- Contra-domínio: `Z2_HORA`
- Regra:

```advpl
IF(INCLUI, Time(), SZ2->Z2_HORA)
```

### Usuário

- Contra-domínio: `Z2_USUAR`
- Regra:

```advpl
cNomUsr
```

## Validação cruzada no Z2_CONTAT

Configurar no `X3_VALID` do campo `Z2_CONTAT`:

```advpl
ExistCpo("SZ1", xFilial("SZ1") + M->Z2_CONTAT, 1)
```

A validação impede que uma interação seja vinculada a um contato inexistente.

## Testes

1. Incluir uma interação.
2. Verificar se data, hora e usuário aparecem automaticamente.
3. Informar um contato inexistente.
4. Confirmar que o sistema bloqueia a gravação.
5. Informar um contato válido e conferir os campos Virtuais.
