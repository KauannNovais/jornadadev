PROCEDURE Main()

   LOCAL nNumeroSecreto := HB_RandomInt(1, 100)
   LOCAL nTentativa
   LOCAL nPalpite
   LOCAL cPalpite := ""
   LOCAL lAcertou := .F.

   QOut("=== ADIVINHE O NUMERO ===")
   QOut("O numero secreto esta entre 1 e 100.")
   QOut("Voce tem 7 tentativas.")
   QOut("")

   FOR nTentativa := 1 TO 7

      ACCEPT "Tentativa " + AllTrim(Str(nTentativa)) + "/7 - Palpite: " TO cPalpite
      nPalpite := Val(cPalpite)

      IF nPalpite == nNumeroSecreto
         lAcertou := .T.
         QOut("Parabens! Voce acertou o numero.")
         EXIT
      ELSEIF nPalpite < nNumeroSecreto
         QOut("O numero secreto e maior.")
      ELSE
         QOut("O numero secreto e menor.")
      ENDIF

      QOut("")
   NEXT

   QOut("")

   IF ! lAcertou
      QOut("Suas 7 tentativas terminaram.")
   ENDIF

   QOut("O numero secreto era: " + AllTrim(Str(nNumeroSecreto)))

RETURN
