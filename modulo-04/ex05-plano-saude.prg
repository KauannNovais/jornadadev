PROCEDURE Main()

   LOCAL cIdade       := ""
   LOCAL cDependentes := ""
   LOCAL nIdade
   LOCAL nDependentes
   LOCAL nValorBase
   LOCAL nAdicional
   LOCAL nTotal

   ACCEPT "Digite a idade: " TO cIdade
   ACCEPT "Digite o numero de dependentes: " TO cDependentes

   nIdade       := Val(cIdade)
   nDependentes := Val(cDependentes)

   IF nIdade < 0 .OR. nDependentes < 0
      QOut("Erro: idade e numero de dependentes nao podem ser negativos.")
      RETURN
   ENDIF

   IF nIdade <= 25
      nValorBase := 180
   ELSEIF nIdade <= 40
      nValorBase := 260
   ELSEIF nIdade <= 60
      nValorBase := 380
   ELSE
      nValorBase := 520
   ENDIF

   nAdicional := nDependentes * 90
   nTotal     := nValorBase + nAdicional

   QOut("")
   QOut("=== PLANO DE SAUDE ===")
   QOut("Valor pela idade: R$ " + Str(nValorBase, 10, 2))
   QOut("Dependentes:        " + AllTrim(Str(nDependentes)))
   QOut("Adicional:        R$ " + Str(nAdicional, 10, 2))
   QOut("Valor mensal:     R$ " + Str(nTotal, 10, 2))

RETURN
