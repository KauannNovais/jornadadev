FUNCTION FatorialN(nN)

   LOCAL nI
   LOCAL nResultado := 1

   nN := Int(nN)

   IF nN < 0
      RETURN -1
   ENDIF

   FOR nI := 2 TO nN
      nResultado *= nI
   NEXT

RETURN nResultado


FUNCTION EhPrimo(nN)

   LOCAL nDivisor

   nN := Int(nN)

   IF nN < 2
      RETURN .F.
   ENDIF

   FOR nDivisor := 2 TO Int(Sqrt(nN))
      IF Mod(nN, nDivisor) == 0
         RETURN .F.
      ENDIF
   NEXT

RETURN .T.


FUNCTION MDC(nA, nB)

   LOCAL nResto

   nA := Abs(Int(nA))
   nB := Abs(Int(nB))

   WHILE nB != 0
      nResto := Mod(nA, nB)
      nA := nB
      nB := nResto
   ENDDO

RETURN nA


FUNCTION MMC(nA, nB)

   LOCAL nDivisor

   nA := Int(nA)
   nB := Int(nB)

   IF nA == 0 .OR. nB == 0
      RETURN 0
   ENDIF

   nDivisor := MDC(nA, nB)

RETURN Abs(nA * nB) / nDivisor
