# Exercício 3 — Fluxograma

Problema: uma loja oferece desconto de 10% para compras acima de R$ 100,00.

```mermaid
flowchart TD
    A([Início]) --> B[/Leia o valor da compra/]
    B --> C{Valor > 100?}
    C -- Sim --> D[Valor final ← valor × 0,90]
    C -- Não --> E[Valor final ← valor]
    D --> F[/Mostre o valor final/]
    E --> F
    F --> G([Fim])
```

## Explicação

- Se o valor da compra for maior que R$ 100,00, o valor final será calculado com 10% de desconto.
- Caso contrário, o valor final será igual ao valor original da compra.
