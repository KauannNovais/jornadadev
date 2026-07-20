PROCEDURE Main()

   LOCAL cNome
   LOCAL cDisc
   LOCAL cEntrada
   LOCAL cResposta
   LOCAL nNota1
   LOCAL nNota2
   LOCAL nMedia

   WHILE .T.

      cNome := ""
      cDisc := ""
      cEntrada := ""
      cResposta := ""

      WHILE .T.
         ACCEPT "Nome do aluno: " TO cNome
         cNome := AllTrim(cNome)

         IF Len(cNome) > 0
            EXIT
         ENDIF

         QOut("Erro: o nome nao pode ficar vazio.")
      ENDDO

      WHILE .T.
         ACCEPT "Disciplina (3 letras maiusculas): " TO cDisc
         cDisc := AllTrim(cDisc)

         IF DisciplinaValida(cDisc)
            EXIT
         ENDIF

         QOut("Erro: use exatamente 3 letras maiusculas, por exemplo MAT.")
      ENDDO

      WHILE .T.
         ACCEPT "Primeira nota (0 a 10): " TO cEntrada
         nNota1 := Val(StrTran(cEntrada, ",", "."))

         IF nNota1 >= 0 .AND. nNota1 <= 10
            EXIT
         ENDIF

         QOut("Erro: a nota deve estar entre 0 e 10.")
      ENDDO

      WHILE .T.
         ACCEPT "Segunda nota (0 a 10): " TO cEntrada
         nNota2 := Val(StrTran(cEntrada, ",", "."))

         IF nNota2 >= 0 .AND. nNota2 <= 10
            EXIT
         ENDIF

         QOut("Erro: a nota deve estar entre 0 e 10.")
      ENDDO

      nMedia := (nNota1 + nNota2) / 2

      QOut("")
      QOut("=== DADOS DO ALUNO ===")
      QOut("Nome:       " + cNome)
      QOut("Disciplina: " + cDisc)
      QOut("Nota 1:     " + Str(nNota1, 6, 2))
      QOut("Nota 2:     " + Str(nNota2, 6, 2))
      QOut("Media:      " + Str(nMedia, 6, 2))
      QOut("")

      ACCEPT "Deseja calcular outro? (S/N): " TO cResposta
      cResposta := Upper(AllTrim(cResposta))

      IF cResposta != "S"
         EXIT
      ENDIF

      QOut("")
   ENDDO

   QOut("Programa encerrado.")

RETURN


STATIC FUNCTION DisciplinaValida(cDisc)

   LOCAL nI
   LOCAL cLetra

   IF Len(cDisc) != 3
      RETURN .F.
   ENDIF

   FOR nI := 1 TO 3
      cLetra := SubStr(cDisc, nI, 1)

      IF cLetra < "A" .OR. cLetra > "Z"
         RETURN .F.
      ENDIF
   NEXT

RETURN .T.
