PROCEDURE Main()

   LOCAL nA
   LOCAL nB := 0
   LOCAL nResultado := 0
   LOCAL cOperacao
   LOCAL cErro := ""

   nA := LerNumero("Digite o primeiro valor: ")
   cOperacao := LerOperacao()

   IF cOperacao != "R"
      nB := LerNumero("Digite o segundo valor: ")
   ENDIF

   IF Calcular(nA, nB, cOperacao, @nResultado, @cErro)
      MostrarResultado(nResultado)
   ELSE
      QOut(cErro)
   ENDIF

RETURN


FUNCTION LerNumero(cMensagem)

   LOCAL cEntrada := ""

   ACCEPT cMensagem TO cEntrada

RETURN Val(StrTran(cEntrada, ",", "."))


FUNCTION LerOperacao()

   LOCAL cOperacao := ""

   QOut("")
   QOut("Operacoes disponiveis: +  -  *  /  ^  R")
   ACCEPT "Escolha a operacao: " TO cOperacao

RETURN Upper(AllTrim(cOperacao))


FUNCTION Calcular(nA, nB, cOperacao, nResultado, cErro)

   cErro := ""

   DO CASE
   CASE cOperacao == "+"
      nResultado := Somar(nA, nB)

   CASE cOperacao == "-"
      nResultado := Subtrair(nA, nB)

   CASE cOperacao == "*"
      nResultado := Multiplicar(nA, nB)

   CASE cOperacao == "/"
      IF nB == 0
         cErro := "Erro: nao e possivel dividir por zero."
         RETURN .F.
      ENDIF
      nResultado := Dividir(nA, nB)

   CASE cOperacao == "^"
      nResultado := Potencia(nA, nB)

   CASE cOperacao == "R"
      IF nA < 0
         cErro := "Erro: nao existe raiz quadrada real de numero negativo."
         RETURN .F.
      ENDIF
      nResultado := RaizQuadrada(nA)

   OTHERWISE
      cErro := "Erro: operacao invalida."
      RETURN .F.
   ENDCASE

RETURN .T.


FUNCTION Somar(nA, nB)
RETURN nA + nB


FUNCTION Subtrair(nA, nB)
RETURN nA - nB


FUNCTION Multiplicar(nA, nB)
RETURN nA * nB


FUNCTION Dividir(nA, nB)
RETURN nA / nB


FUNCTION Potencia(nA, nB)
RETURN nA ^ nB


FUNCTION RaizQuadrada(nA)
RETURN Sqrt(nA)


PROCEDURE MostrarResultado(nResultado)

   QOut("")
   QOut("Resultado: " + Str(nResultado, 14, 2))

RETURN
