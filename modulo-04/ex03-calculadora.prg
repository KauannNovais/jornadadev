PROCEDURE Main()

   LOCAL cValorA   := ""
   LOCAL cValorB   := ""
   LOCAL cOperacao := ""
   LOCAL nA
   LOCAL nB := 0
   LOCAL nResultado

   QOut("=== CALCULADORA ===")
   QOut("Operacoes: +  -  *  /  ^  R")
   QOut("R calcula a raiz quadrada do primeiro valor.")
   QOut("")

   ACCEPT "Digite o primeiro valor: " TO cValorA
   ACCEPT "Digite a operacao: " TO cOperacao

   nA        := Val(StrTran(cValorA, ",", "."))
   cOperacao := Upper(AllTrim(cOperacao))

   IF cOperacao != "R"
      ACCEPT "Digite o segundo valor: " TO cValorB
      nB := Val(StrTran(cValorB, ",", "."))
   ENDIF

   QOut("")

   DO CASE
   CASE cOperacao == "+"
      nResultado := nA + nB
      QOut("Resultado: " + Str(nResultado, 12, 2))

   CASE cOperacao == "-"
      nResultado := nA - nB
      QOut("Resultado: " + Str(nResultado, 12, 2))

   CASE cOperacao == "*"
      nResultado := nA * nB
      QOut("Resultado: " + Str(nResultado, 12, 2))

   CASE cOperacao == "/"
      IF nB == 0
         QOut("Erro: nao e possivel dividir por zero.")
      ELSE
         nResultado := nA / nB
         QOut("Resultado: " + Str(nResultado, 12, 2))
      ENDIF

   CASE cOperacao == "^"
      nResultado := nA ^ nB
      QOut("Resultado: " + Str(nResultado, 12, 2))

   CASE cOperacao == "R"
      IF nA < 0
         QOut("Erro: nao e possivel calcular a raiz de numero negativo.")
      ELSE
         nResultado := Sqrt(nA)
         QOut("Resultado: " + Str(nResultado, 12, 2))
      ENDIF

   OTHERWISE
      QOut("Operacao invalida.")

   ENDCASE

RETURN
