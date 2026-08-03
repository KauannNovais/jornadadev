FUNCTION Main()

   LOCAL nA := 10
   LOCAL nB := 0
   LOCAL nRes
   LOCAL oErro

   QOut("=== TESTE DE TRATAMENTO DE ERROS ===")
   QOut("")

   BEGIN SEQUENCE

      nRes := nA / nB
      QOut("Resultado: " + Str(nRes))

   RECOVER WITH oErro

      QOut("Erro capturado: " + oErro:Description)

   END SEQUENCE

   QOut("")
   QOut("O programa continua de pe!")

RETURN NIL
