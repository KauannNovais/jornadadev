PROCEDURE Main()

   LOCAL cSalario := ""
   LOCAL nSalario
   LOCAL nPercentual
   LOCAL nReajuste
   LOCAL nNovoSalario

   ACCEPT "Digite o salario atual: R$ " TO cSalario
   nSalario := Val(StrTran(cSalario, ",", "."))

   IF nSalario < 1000
      nPercentual := 15
   ELSEIF nSalario <= 2000
      nPercentual := 12
   ELSEIF nSalario <= 4000
      nPercentual := 8
   ELSE
      nPercentual := 5
   ENDIF

   nReajuste    := nSalario * (nPercentual / 100)
   nNovoSalario := nSalario + nReajuste

   QOut("")
   QOut("=== REAJUSTE SALARIAL ===")
   QOut("Salario atual:  R$ " + Str(nSalario, 10, 2))
   QOut("Percentual:        " + AllTrim(Str(nPercentual)) + "%")
   QOut("Valor reajuste: R$ " + Str(nReajuste, 10, 2))
   QOut("Novo salario:   R$ " + Str(nNovoSalario, 10, 2))

RETURN
