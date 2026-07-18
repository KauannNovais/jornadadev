#define PI 3.14159

PROCEDURE Main()

   LOCAL cRaio    := ""
   LOCAL cCatetoA := ""
   LOCAL cCatetoB := ""
   LOCAL cPeso    := ""
   LOCAL cAltura  := ""

   LOCAL nRaio
   LOCAL nCatetoA
   LOCAL nCatetoB
   LOCAL nPeso
   LOCAL nAltura

   LOCAL nArea
   LOCAL nHipotenusa
   LOCAL nImc

   ACCEPT "Digite o raio do circulo: " TO cRaio
   nRaio := Val(StrTran(cRaio, ",", "."))

   ACCEPT "Digite o primeiro cateto: " TO cCatetoA
   nCatetoA := Val(StrTran(cCatetoA, ",", "."))

   ACCEPT "Digite o segundo cateto: " TO cCatetoB
   nCatetoB := Val(StrTran(cCatetoB, ",", "."))

   ACCEPT "Digite o peso em kg: " TO cPeso
   nPeso := Val(StrTran(cPeso, ",", "."))

   ACCEPT "Digite a altura em metros: " TO cAltura
   nAltura := Val(StrTran(cAltura, ",", "."))

   nArea       := PI * (nRaio ^ 2)
   nHipotenusa := Sqrt((nCatetoA ^ 2) + (nCatetoB ^ 2))

   QOut("")
   QOut("=== RESULTADOS ===")
   QOut("Area do circulo: " + Str(nArea, 10, 2))
   QOut("Hipotenusa:      " + Str(nHipotenusa, 10, 2))

   IF nAltura > 0
      nImc := nPeso / (nAltura ^ 2)
      QOut("IMC:             " + Str(nImc, 10, 2))
   ELSE
      QOut("Nao foi possivel calcular o IMC: altura invalida.")
   ENDIF

RETURN
