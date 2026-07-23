PROCEDURE Main()

   LOCAL aCarrinho := {}
   LOCAL cResposta := "S"
   LOCAL cNome
   LOCAL nPreco

   WHILE cResposta == "S"

      cNome := LerNomeProduto()
      nPreco := LerPrecoProduto()

      AAdd(aCarrinho, { cNome, nPreco })

      ACCEPT "Adicionar outro produto? (S/N): " TO cResposta
      cResposta := Upper(AllTrim(cResposta))
      QOut("")
   ENDDO

   ExibirCarrinho(aCarrinho)

RETURN


FUNCTION LerNomeProduto()

   LOCAL cNome := ""

   WHILE .T.
      ACCEPT "Nome do produto: " TO cNome
      cNome := AllTrim(cNome)

      IF Len(cNome) > 0
         RETURN cNome
      ENDIF

      QOut("O nome do produto nao pode ficar vazio.")
   ENDDO

RETURN ""


FUNCTION LerPrecoProduto()

   LOCAL cEntrada := ""
   LOCAL nPreco

   WHILE .T.
      ACCEPT "Preco do produto: R$ " TO cEntrada
      nPreco := Val(StrTran(cEntrada, ",", "."))

      IF nPreco >= 0
         RETURN nPreco
      ENDIF

      QOut("O preco nao pode ser negativo.")
   ENDDO

RETURN 0


PROCEDURE ExibirCarrinho(aCarrinho)

   LOCAL nI
   LOCAL nTotal := 0

   QOut("=== ITENS DO CARRINHO ===")

   IF Len(aCarrinho) == 0
      QOut("Carrinho vazio.")
      RETURN
   ENDIF

   FOR nI := 1 TO Len(aCarrinho)
      QOut(AllTrim(Str(nI)) + " - " + ;
           aCarrinho[nI][1] + " - R$ " + ;
           AllTrim(Str(aCarrinho[nI][2], 10, 2)))

      nTotal += aCarrinho[nI][2]
   NEXT

   QOut("")
   QOut("Total do carrinho: R$ " + Str(nTotal, 12, 2))

RETURN
