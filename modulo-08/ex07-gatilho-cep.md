# Exercício 7 — Gatilho para preenchimento do endereço pelo CEP

## Configuração dos gatilhos no SX7

Os três gatilhos devem ser criados no campo `A1_CEP`:

| Sequência | Contra-domínio | Regra |
|---:|---|---|
| `001` | `A1_BAIRRO` | `U_STCEP(M->A1_CEP,"BAIRRO")` |
| `002` | `A1_MUN` | `U_STCEP(M->A1_CEP,"CIDADE")` |
| `003` | `A1_EST` | `U_STCEP(M->A1_CEP,"UF")` |

O arquivo `stcep.prw` mencionado no exercício não está dentro do PDF enviado. Portanto, ele precisa ser obtido no pacote do Classroom para compilação e teste.

## a) Diferença entre campo, contra-domínio e regra

O campo é o dado que inicia o gatilho. Neste exercício, o gatilho é disparado quando o usuário informa ou altera o `A1_CEP`.

O contra-domínio é o campo que receberá o resultado da execução. Por exemplo, `A1_BAIRRO` recebe o bairro correspondente ao CEP.

A regra é a expressão executada para calcular ou buscar o valor que será enviado ao contra-domínio. Neste caso, a regra chama a função `U_STCEP()`.

## b) Por que usar M->A1_CEP e não SA1->A1_CEP?

`M->A1_CEP` representa o valor que está no formulário durante a inclusão ou alteração, mesmo antes de ele ser gravado na tabela.

`SA1->A1_CEP` representa o valor que já está salvo no registro atual da tabela. Durante a edição, esse valor pode ainda ser o CEP antigo. Por isso, o gatilho deve usar `M->A1_CEP` para trabalhar com o valor que o usuário acabou de digitar.

## c) Problemas de manter os CEPs dentro do fonte

### Problema 1 — manutenção e atualização

Os dados podem ficar desatualizados. Qualquer inclusão ou alteração de CEP exigiria modificar o fonte, recompilar o programa e atualizar o RPO.

Uma solução seria armazenar os dados em uma tabela customizada criada e mantida pelo dicionário, permitindo a atualização sem alterar o código.

### Problema 2 — quantidade limitada de dados

Um fonte com CEPs fixos não consegue representar todos os endereços do país e pode crescer de forma difícil de manter.

Uma solução mais adequada seria consultar um serviço externo de CEP. A função faria a requisição, trataria erros e devolveria bairro, município, UF e outras informações.

## d) Como preencher também A1_COD_MUN?

Eu criaria um quarto gatilho no campo `A1_CEP`, com o contra-domínio `A1_COD_MUN`. A função `STCEP` também precisaria aceitar uma opção para retornar o código do município.

Exemplo de configuração:

| Sequência | Contra-domínio | Regra |
|---:|---|---|
| `004` | `A1_COD_MUN` | `U_STCEP(M->A1_CEP,"CODMUN")` |

Também seria necessário ajustar a origem dos dados, seja a tabela customizada ou o serviço externo, para disponibilizar o código correto do município.
