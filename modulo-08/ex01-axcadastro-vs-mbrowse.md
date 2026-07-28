# Exercício 1 — AxCadastro × mBrowse

## a) Quando usar AxCadastro e quando usar mBrowse?

Eu usaria o `AxCadastro` quando precisasse criar rapidamente um cadastro padrão, com as operações de incluir, alterar, visualizar e excluir registros, aproveitando as configurações do dicionário de dados. Um exemplo seria um cadastro simples de pets para uso interno.

Eu usaria o `mBrowse` quando precisasse de uma tela mais personalizada, com filtros, legendas, botões próprios e regras específicas de navegação. Um exemplo seria um cadastro de pets que destaque animais idosos por cor e permita filtrar somente os registros do mês atual.

## b) Três coisas que o mBrowse faz e o AxCadastro não faz

O `mBrowse` permite:

1. Configurar legendas coloridas para os registros.
2. Aplicar filtros personalizados ao Browse.
3. Criar uma `aRotina` com botões e funções personalizadas.

O `AxCadastro` é mais simples e rápido, mas oferece menos controle sobre a aparência e o comportamento da tela.

## c) Por que a regra `.T.` deve ficar por último em `aColors`?

As regras das legendas são avaliadas de cima para baixo. A expressão `.T.` sempre é verdadeira, então ela funciona como a opção padrão para os registros que não atenderam às regras anteriores. Se fosse colocada primeiro, todos os registros receberiam a mesma cor e as outras condições nunca seriam alcançadas.

## d) Campo Virtual × gatilho para preencher o nome do cliente

Um campo Virtual, configurado por meio do `X3_RELACAO`, calcula ou busca o valor no momento em que ele é exibido. Esse conteúdo não precisa ficar gravado fisicamente na tabela.

O gatilho do `SX7` é executado durante a edição de um campo e preenche outro campo automaticamente. Nesse caso, ao informar o código e a loja do cliente, o gatilho pode copiar o nome para outro campo. A principal diferença é que o campo Virtual apresenta o valor por uma relação, enquanto o gatilho atua no momento da digitação e pode gravar o resultado no registro.
