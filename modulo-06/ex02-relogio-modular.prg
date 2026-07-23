PROCEDURE Main()

   LOCAL nSegundo
   LOCAL cHora

   FOR nSegundo := 1 TO 30
      cHora := ObterHora()
      cHora := FormatarHora(cHora)
      ExibirHora(cHora)
      Inkey(1)
   NEXT

RETURN


FUNCTION ObterHora()

RETURN Time()


FUNCTION FormatarHora(cHora)

   cHora := AllTrim(cHora)

   IF Len(cHora) >= 8
      RETURN SubStr(cHora, 1, 8)
   ENDIF

RETURN cHora


PROCEDURE ExibirHora(cHora)

   CLS
   QOut("=== RELOGIO DIGITAL ===")
   QOut("")
   QOut(cHora)
   QOut("")
   QOut("Atualizando por aproximadamente 30 segundos...")

RETURN
