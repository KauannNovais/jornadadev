PROCEDURE Main()

   LOCAL cNome     := ""
   LOCAL cDataNasc := ""
   LOCAL cPreco    := ""

   LOCAL dNasc
   LOCAL nPreco
   LOCAL nIdade
   LOCAL nDesconto := 0
   LOCAL nTotal

   SET DATE TO BRITISH
   SET CENTURY ON

   ACCEPT "Digite o nome do cliente: " TO cNome
   ACCEPT "Digite a data de nascimento (dd/mm/aaaa): " TO cDataNasc
   ACCEPT "Digite o preco do produto: R$ " TO cPreco

   dNasc  := CToD(cDataNasc)
   nPreco := Val(StrTran(cPreco, ",", "."))

   IF Empty(dNasc)
      QOut("Data de nascimento invalida.")
      RETURN
   ENDIF

   nIdade := Int((Date() - dNasc) / 365)

   IF nIdade > 60
      nDesconto := nPreco * 0.125
   ENDIF

   nTotal := nPreco - nDesconto

   QOut("")
   QOut("=== RESUMO DA COMPRA ===")
   QOut("Cliente:   " + cNome)
   QOut("Idade:     " + AllTrim(Str(nIdade)) + " anos")
   QOut("Preco:     R$ " + Str(nPreco, 10, 2))
   QOut("Desconto:  R$ " + Str(nDesconto, 10, 2))
   QOut("Total:     R$ " + Str(nTotal, 10, 2))

RETURN
