PROCEDURE Main()

   LOCAL cEntrada := ""
   LOCAL nValor
   LOCAL nTotal := 0
   LOCAL nQtd := 0

   QOut("=== MAQUINA DE SOMA ===")
   QOut("Digite os valores que deseja somar.")
   QOut("Digite 0 para finalizar.")
   QOut("")

   WHILE .T.
      ACCEPT "Valor: " TO cEntrada
      nValor := Val(StrTran(cEntrada, ",", "."))

      IF nValor == 0
         EXIT
      ENDIF

      nTotal += nValor
      nQtd++
   ENDDO

   QOut("")
   QOut("=== RESULTADO ===")
   QOut("Soma total: " + Str(nTotal, 12, 2))
   QOut("Quantidade de valores: " + AllTrim(Str(nQtd)))

RETURN
