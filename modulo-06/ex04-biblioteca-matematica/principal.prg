SET PROCEDURE TO matematica.prg

PROCEDURE Main()

   LOCAL cEntrada := ""
   LOCAL nN
   LOCAL nA
   LOCAL nB
   LOCAL nFatorial

   ACCEPT "Digite um numero para testar fatorial e primo: " TO cEntrada
   nN := Val(cEntrada)

   ACCEPT "Digite o primeiro numero para MMC e MDC: " TO cEntrada
   nA := Val(cEntrada)

   ACCEPT "Digite o segundo numero para MMC e MDC: " TO cEntrada
   nB := Val(cEntrada)

   nFatorial := FatorialN(nN)

   QOut("")
   QOut("=== RESULTADOS ===")

   IF nFatorial == -1
      QOut("Fatorial: numero negativo nao possui fatorial.")
   ELSE
      QOut("Fatorial de " + AllTrim(Str(Int(nN))) + ": " + AllTrim(Str(nFatorial)))
   ENDIF

   QOut("Eh primo? " + IIf(EhPrimo(nN), "Sim", "Nao"))
   QOut("MDC: " + AllTrim(Str(MDC(nA, nB))))
   QOut("MMC: " + AllTrim(Str(MMC(nA, nB))))

RETURN
