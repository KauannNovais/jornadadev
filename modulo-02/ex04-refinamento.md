# Exercício 4 — Refinamento sucessivo

## Nível 1 — Visão geral

1. Registrar os itens da compra.
2. Calcular o subtotal.
3. Aplicar o desconto do cartão fidelidade, quando houver.
4. Mostrar o total a pagar.

## Nível 2 — Detalhamento

### 1. Registrar os itens da compra

1. Iniciar a compra.
2. Ler o nome ou código do item.
3. Ler a quantidade do item.
4. Ler o preço unitário do item.
5. Calcular o valor do item: quantidade × preço unitário.
6. Adicionar o valor do item ao subtotal.
7. Perguntar se existem mais itens.
8. Repetir o processo enquanto houver itens.

### 2. Calcular o subtotal

1. Iniciar o subtotal com zero.
2. Somar o valor de cada item registrado.
3. Guardar o resultado na variável `subtotal`.

### 3. Aplicar o desconto do cartão fidelidade

1. Perguntar se o cliente possui cartão fidelidade.
2. Se possuir, calcular o desconto: `subtotal × 0,05`.
3. Calcular o total: `subtotal - desconto`.
4. Se não possuir, definir o desconto como zero.
5. Nesse caso, o total será igual ao subtotal.

### 4. Mostrar o total a pagar

1. Mostrar o subtotal.
2. Mostrar o valor do desconto.
3. Mostrar o total final da compra.
4. Encerrar a operação.
