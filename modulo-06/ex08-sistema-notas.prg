PROCEDURE Main()

   LOCAL aAlunos := {}
   LOCAL aAluno
   LOCAL nQtdAlunos
   LOCAL nI

   nQtdAlunos := LerQuantidadeAlunos()

   FOR nI := 1 TO nQtdAlunos
      QOut("")
      QOut("=== ALUNO " + AllTrim(Str(nI)) + " ===")

      aAluno := { LerNome(), ;
                  LerNota("Nota 1: "), ;
                  LerNota("Nota 2: "), ;
                  LerNota("Nota 3: "), ;
                  LerNota("Nota 4: ") }

      AAdd(aAlunos, aAluno)
   NEXT

   ListarResultados(aAlunos)

RETURN


FUNCTION LerQuantidadeAlunos()

   LOCAL cEntrada := ""
   LOCAL nQuantidade

   WHILE .T.
      ACCEPT "Quantidade de alunos: " TO cEntrada
      nQuantidade := Val(cEntrada)

      IF nQuantidade > 0 .AND. nQuantidade == Int(nQuantidade)
         RETURN Int(nQuantidade)
      ENDIF

      QOut("Digite uma quantidade inteira maior que zero.")
   ENDDO

RETURN 0


FUNCTION LerNome()

   LOCAL cNome := ""

   WHILE .T.
      ACCEPT "Nome: " TO cNome
      cNome := AllTrim(cNome)

      IF Len(cNome) > 0
         RETURN cNome
      ENDIF

      QOut("O nome nao pode ficar vazio.")
   ENDDO

RETURN ""


FUNCTION LerNota(cMensagem)

   LOCAL cEntrada := ""
   LOCAL nNota

   WHILE .T.
      ACCEPT cMensagem TO cEntrada
      nNota := Val(StrTran(cEntrada, ",", "."))

      IF nNota >= 0 .AND. nNota <= 10
         RETURN nNota
      ENDIF

      QOut("A nota deve estar entre 0 e 10.")
   ENDDO

RETURN 0


FUNCTION MediaAluno(aAluno)

RETURN (aAluno[2] + aAluno[3] + aAluno[4] + aAluno[5]) / 4


PROCEDURE ListarResultados(aAlunos)

   LOCAL nI
   LOCAL nMedia
   LOCAL lEncontrou

   QOut("")
   QOut("=== RESULTADO DE TODOS OS ALUNOS ===")

   FOR nI := 1 TO Len(aAlunos)
      nMedia := MediaAluno(aAlunos[nI])
      QOut(aAlunos[nI][1] + " - Media: " + ;
           AllTrim(Str(nMedia, 6, 2)) + " - " + ;
           IIf(nMedia >= 7, "APROVADO", "REPROVADO"))
   NEXT

   QOut("")
   QOut("=== APROVADOS ===")
   lEncontrou := .F.

   FOR nI := 1 TO Len(aAlunos)
      nMedia := MediaAluno(aAlunos[nI])

      IF nMedia >= 7
         QOut(aAlunos[nI][1] + " - " + AllTrim(Str(nMedia, 6, 2)))
         lEncontrou := .T.
      ENDIF
   NEXT

   IF ! lEncontrou
      QOut("Nenhum aluno aprovado.")
   ENDIF

   QOut("")
   QOut("=== REPROVADOS ===")
   lEncontrou := .F.

   FOR nI := 1 TO Len(aAlunos)
      nMedia := MediaAluno(aAlunos[nI])

      IF nMedia < 7
         QOut(aAlunos[nI][1] + " - " + AllTrim(Str(nMedia, 6, 2)))
         lEncontrou := .T.
      ENDIF
   NEXT

   IF ! lEncontrou
      QOut("Nenhum aluno reprovado.")
   ENDIF

RETURN
