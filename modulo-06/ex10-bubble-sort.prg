PROCEDURE Main()

   LOCAL aNumeros := {}
   LOCAL cEntrada := ""
   LOCAL nI

   FOR nI := 1 TO 10
      ACCEPT "Digite o numero " + AllTrim(Str(nI)) + "/10: " TO cEntrada
      AAdd(aNumeros, Val(StrTran(cEntrada, ",", ".")))
   NEXT

   BubbleSort(aNumeros)

   QOut("")
   QOut("=== VETOR ORDENADO ===")

   FOR nI := 1 TO Len(aNumeros)
      QOut(AllTrim(Str(aNumeros[nI], 12, 2)))
   NEXT

RETURN


FUNCTION BubbleSort(aVetor)

   LOCAL nI
   LOCAL nJ
   LOCAL nTemporario

   FOR nI := 1 TO Len(aVetor) - 1
      FOR nJ := 1 TO Len(aVetor) - nI

         IF aVetor[nJ] > aVetor[nJ + 1]
            nTemporario := aVetor[nJ]
            aVetor[nJ] := aVetor[nJ + 1]
            aVetor[nJ + 1] := nTemporario
         ENDIF

      NEXT
   NEXT

RETURN aVetor
