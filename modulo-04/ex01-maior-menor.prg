PROCEDURE Main()

   LOCAL cValor1 := ""
   LOCAL cValor2 := ""
   LOCAL nValor1
   LOCAL nValor2

   ACCEPT "Digite o primeiro valor: " TO cValor1
   ACCEPT "Digite o segundo valor: " TO cValor2

   nValor1 := Val(StrTran(cValor1, ",", "."))
   nValor2 := Val(StrTran(cValor2, ",", "."))

   QOut("")

   IF nValor1 == nValor2
      QOut("Os dois valores sao iguais.")
   ELSE
      IF nValor1 > nValor2
         QOut("Maior valor: " + AllTrim(Str(nValor1)))
         QOut("Menor valor: " + AllTrim(Str(nValor2)))
      ELSE
         QOut("Maior valor: " + AllTrim(Str(nValor2)))
         QOut("Menor valor: " + AllTrim(Str(nValor1)))
      ENDIF
   ENDIF

RETURN
