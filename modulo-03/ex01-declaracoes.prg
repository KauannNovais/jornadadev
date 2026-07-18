PROCEDURE Main()

   LOCAL cNome
   LOCAL nSalario
   LOCAL lAtivo
   LOCAL dAdmissao
   LOCAL cDepto

   SET DATE TO BRITISH
   SET CENTURY ON

   cNome     := "Ana Souza"
   nSalario  := 3500.00
   lAtivo    := .T.
   dAdmissao := CToD("10/01/2024")
   cDepto    := "FIN"

   QOut("=== DADOS DO FUNCIONARIO ===")
   QOut("Nome: " + cNome)
   QOut("Salario bruto: R$ " + Str(nSalario, 10, 2))
   QOut("Ativo: " + IIf(lAtivo, "Sim", "Nao"))
   QOut("Data de admissao: " + DToC(dAdmissao))
   QOut("Departamento: " + cDepto)

RETURN
