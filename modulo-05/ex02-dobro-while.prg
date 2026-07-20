PROCEDURE Main()

   LOCAL cEntrada := ""
   LOCAL nValor

   QOut("Digite numeros positivos para ver o dobro.")
   QOut("Digite zero ou um numero negativo para encerrar.")
   QOut("")

   WHILE .T.
      ACCEPT "Valor: " TO cEntrada
      nValor := Val(StrTran(cEntrada, ",", "."))

      IF nValor <= 0
         EXIT
      ENDIF

      QOut("Dobro: " + AllTrim(Str(nValor * 2)))
      QOut("")
   ENDDO

   QOut("Programa encerrado.")

RETURN
