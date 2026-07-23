FUNCTION MenuEstoque()

   LOCAL cEntrada := ""
   LOCAL nOpcao

   WHILE .T.
      QOut("=== CONTROLE DE ESTOQUE ===")
      QOut("1 - Cadastrar produto")
      QOut("2 - Listar produtos")
      QOut("3 - Entrada de estoque")
      QOut("4 - Saida de estoque")
      QOut("5 - Buscar produto por codigo")
      QOut("6 - Relatorio de estoque")
      QOut("0 - Sair")

      ACCEPT "Opcao: " TO cEntrada
      cEntrada := AllTrim(cEntrada)

      IF EhInteiroNaoNegativo(cEntrada)
         nOpcao := Val(cEntrada)

         IF nOpcao >= 0 .AND. nOpcao <= 6
            RETURN nOpcao
         ENDIF
      ENDIF

      QOut("Opcao invalida.")
      QOut("")
   ENDDO

RETURN 0


PROCEDURE CadastrarProduto(aProdutos)

   LOCAL cCodigo := ""
   LOCAL cNome := ""
   LOCAL nQuantidade
   LOCAL nPreco

   WHILE .T.
      ACCEPT "Codigo do produto: " TO cCodigo
      cCodigo := Upper(AllTrim(cCodigo))

      IF Len(cCodigo) == 0
         QOut("O codigo nao pode ficar vazio.")
      ELSEIF BuscarProduto(aProdutos, cCodigo) != 0
         QOut("Ja existe um produto com esse codigo.")
      ELSE
         EXIT
      ENDIF
   ENDDO

   WHILE .T.
      ACCEPT "Nome do produto: " TO cNome
      cNome := AllTrim(cNome)

      IF Len(cNome) > 0
         EXIT
      ENDIF

      QOut("O nome nao pode ficar vazio.")
   ENDDO

   nQuantidade := LerInteiroNaoNegativo("Quantidade inicial: ")
   nPreco := LerNumeroPositivo("Preco unitario: R$ ")

   AAdd(aProdutos, { cCodigo, cNome, nQuantidade, nPreco })

   QOut("Produto cadastrado com sucesso.")

RETURN


PROCEDURE ListarProdutos(aProdutos)

   LOCAL nI

   QOut("")
   QOut("=== PRODUTOS CADASTRADOS ===")

   IF Len(aProdutos) == 0
      QOut("Nenhum produto cadastrado.")
      RETURN
   ENDIF

   FOR nI := 1 TO Len(aProdutos)
      ExibirProduto(aProdutos[nI])
   NEXT

RETURN


PROCEDURE EntradaEstoque(aProdutos)

   LOCAL nPosicao
   LOCAL nQuantidade

   nPosicao := SolicitarPosicaoProduto(aProdutos)

   IF nPosicao == 0
      RETURN
   ENDIF

   nQuantidade := LerInteiroPositivo("Quantidade de entrada: ")
   aProdutos[nPosicao][3] += nQuantidade

   QOut("Entrada registrada. Estoque atual: " + ;
        AllTrim(Str(aProdutos[nPosicao][3])))

RETURN


PROCEDURE SaidaEstoque(aProdutos)

   LOCAL nPosicao
   LOCAL nQuantidade

   nPosicao := SolicitarPosicaoProduto(aProdutos)

   IF nPosicao == 0
      RETURN
   ENDIF

   nQuantidade := LerInteiroPositivo("Quantidade de saida: ")

   IF nQuantidade > aProdutos[nPosicao][3]
      QOut("Erro: estoque insuficiente.")
      QOut("Quantidade disponivel: " + ;
           AllTrim(Str(aProdutos[nPosicao][3])))
      RETURN
   ENDIF

   aProdutos[nPosicao][3] -= nQuantidade

   QOut("Saida registrada. Estoque atual: " + ;
        AllTrim(Str(aProdutos[nPosicao][3])))

RETURN


PROCEDURE ConsultarProduto(aProdutos)

   LOCAL nPosicao

   nPosicao := SolicitarPosicaoProduto(aProdutos)

   IF nPosicao == 0
      RETURN
   ENDIF

   QOut("")
   QOut("=== PRODUTO ENCONTRADO ===")
   ExibirProduto(aProdutos[nPosicao])

RETURN


FUNCTION BuscarProduto(aProdutos, cCodigo)

   LOCAL nI

   cCodigo := Upper(AllTrim(cCodigo))

   FOR nI := 1 TO Len(aProdutos)
      IF aProdutos[nI][1] == cCodigo
         RETURN nI
      ENDIF
   NEXT

RETURN 0


PROCEDURE RelatorioEstoque(aProdutos)

   LOCAL nI
   LOCAL nValorProduto
   LOCAL nTotalGeral := 0

   QOut("")
   QOut("=== RELATORIO DE ESTOQUE ===")

   IF Len(aProdutos) == 0
      QOut("Nenhum produto cadastrado.")
      RETURN
   ENDIF

   FOR nI := 1 TO Len(aProdutos)
      nValorProduto := aProdutos[nI][3] * aProdutos[nI][4]
      nTotalGeral += nValorProduto

      QOut(aProdutos[nI][1] + " - " + ;
           aProdutos[nI][2] + " - Valor em estoque: R$ " + ;
           AllTrim(Str(nValorProduto, 12, 2)))
   NEXT

   QOut("")
   QOut("Valor total geral: R$ " + Str(nTotalGeral, 14, 2))

RETURN


FUNCTION SolicitarPosicaoProduto(aProdutos)

   LOCAL cCodigo := ""
   LOCAL nPosicao

   IF Len(aProdutos) == 0
      QOut("Nenhum produto cadastrado.")
      RETURN 0
   ENDIF

   ACCEPT "Codigo do produto: " TO cCodigo
   cCodigo := Upper(AllTrim(cCodigo))

   IF Len(cCodigo) == 0
      QOut("O codigo nao pode ficar vazio.")
      RETURN 0
   ENDIF

   nPosicao := BuscarProduto(aProdutos, cCodigo)

   IF nPosicao == 0
      QOut("Produto nao encontrado.")
   ENDIF

RETURN nPosicao


PROCEDURE ExibirProduto(aProduto)

   QOut("Codigo: " + aProduto[1] + ;
        " | Nome: " + aProduto[2] + ;
        " | Quantidade: " + AllTrim(Str(aProduto[3])) + ;
        " | Preco: R$ " + AllTrim(Str(aProduto[4], 10, 2)))

RETURN


FUNCTION LerInteiroNaoNegativo(cMensagem)

   LOCAL cEntrada := ""

   WHILE .T.
      ACCEPT cMensagem TO cEntrada
      cEntrada := AllTrim(cEntrada)

      IF EhInteiroNaoNegativo(cEntrada)
         RETURN Val(cEntrada)
      ENDIF

      QOut("Digite um numero inteiro igual ou maior que zero.")
   ENDDO

RETURN 0


FUNCTION LerInteiroPositivo(cMensagem)

   LOCAL nValor

   WHILE .T.
      nValor := LerInteiroNaoNegativo(cMensagem)

      IF nValor > 0
         RETURN nValor
      ENDIF

      QOut("O valor deve ser maior que zero.")
   ENDDO

RETURN 0


FUNCTION LerNumeroPositivo(cMensagem)

   LOCAL cEntrada := ""
   LOCAL nValor

   WHILE .T.
      ACCEPT cMensagem TO cEntrada
      cEntrada := AllTrim(cEntrada)

      IF EhNumeroNaoNegativo(cEntrada)
         nValor := Val(StrTran(cEntrada, ",", "."))

         IF nValor > 0
            RETURN nValor
         ENDIF
      ENDIF

      QOut("Digite um numero maior que zero.")
   ENDDO

RETURN 0


FUNCTION EhInteiroNaoNegativo(cTexto)

   LOCAL nI
   LOCAL cCaractere

   cTexto := AllTrim(cTexto)

   IF Len(cTexto) == 0
      RETURN .F.
   ENDIF

   FOR nI := 1 TO Len(cTexto)
      cCaractere := SubStr(cTexto, nI, 1)

      IF cCaractere < "0" .OR. cCaractere > "9"
         RETURN .F.
      ENDIF
   NEXT

RETURN .T.


FUNCTION EhNumeroNaoNegativo(cTexto)

   LOCAL nI
   LOCAL cCaractere
   LOCAL nSeparadores := 0
   LOCAL nDigitos := 0

   cTexto := AllTrim(cTexto)

   IF Len(cTexto) == 0
      RETURN .F.
   ENDIF

   FOR nI := 1 TO Len(cTexto)
      cCaractere := SubStr(cTexto, nI, 1)

      IF cCaractere >= "0" .AND. cCaractere <= "9"
         nDigitos++
      ELSEIF cCaractere == "." .OR. cCaractere == ","
         nSeparadores++

         IF nSeparadores > 1
            RETURN .F.
         ENDIF
      ELSE
         RETURN .F.
      ENDIF
   NEXT

RETURN nDigitos > 0
