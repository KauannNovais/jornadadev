PROCEDURE Main()

   LOCAL aNumeros := {}
   LOCAL cEntrada := ""
   LOCAL nI
   LOCAL nNumero
   LOCAL nSoma := 0
   LOCAL nMedia

   FOR nI := 1 TO 10
      ACCEPT "Digite o numero " + AllTrim(Str(nI)) + "/10: " TO cEntrada
      nNumero := Val(StrTran(cEntrada, ",", "."))
      AAdd(aNumeros, nNumero)
   NEXT

   ASort(aNumeros)

   FOR nI := 1 TO Len(aNumeros)
      nSoma += aNumeros[nI]
   NEXT

   nMedia := nSoma / Len(aNumeros)

   QOut("")
   QOut("=== NUMEROS EM ORDEM CRESCENTE ===")

   FOR nI := 1 TO Len(aNumeros)
      QOut(AllTrim(Str(aNumeros[nI], 12, 2)))
   NEXT

   QOut("")
   QOut("Soma:  " + Str(nSoma, 12, 2))
   QOut("Media: " + Str(nMedia, 12, 2))
   QOut("Menor: " + Str(aNumeros[1], 12, 2))
   QOut("Maior: " + Str(aNumeros[Len(aNumeros)], 12, 2))

RETURN
