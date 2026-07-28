# Exercício 5 — A1_FILIAL e xFilial()

## a) Por que existe o campo A1_FILIAL?

O campo `A1_FILIAL` identifica a filial à qual cada registro da tabela `SA1` pertence. Isso permite que o mesmo ambiente do Protheus seja utilizado por mais de uma empresa ou filial, mantendo os registros organizados conforme a configuração de compartilhamento.

A tabela `ZA1` também precisa de um campo de filial pelo mesmo motivo. Sem esse campo, o sistema não conseguiria separar corretamente os dados de diferentes filiais.

## b) O que a função xFilial() tem a ver com isso?

A função `xFilial()` retorna a filial correta para a tabela informada, respeitando a configuração do ambiente. Exemplo:

```advpl
xFilial("SA1")
```

Se a filial fosse escrita diretamente no código, a rotina poderia funcionar apenas em um ambiente específico e falhar em outro. Também poderia consultar ou gravar registros na filial errada, ignorar tabelas compartilhadas e causar problemas de localização ou duplicidade de dados. Por isso, usar `xFilial()` torna o programa mais seguro e compatível com diferentes ambientes Protheus.
