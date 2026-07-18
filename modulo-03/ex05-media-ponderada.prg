PROCEDURE Main()

   LOCAL cNota1 := ""
   LOCAL cNota2 := ""
   LOCAL cNota3 := ""
   LOCAL cNota4 := ""

   LOCAL nNota1
   LOCAL nNota2
   LOCAL nNota3
   LOCAL nNota4
   LOCAL nMedia

   ACCEPT "Digite a nota do 1o bimestre: " TO cNota1
   ACCEPT "Digite a nota do 2o bimestre: " TO cNota2
   ACCEPT "Digite a nota do 3o bimestre: " TO cNota3
   ACCEPT "Digite a nota do 4o bimestre: " TO cNota4

   nNota1 := Val(StrTran(cNota1, ",", "."))
   nNota2 := Val(StrTran(cNota2, ",", "."))
   nNota3 := Val(StrTran(cNota3, ",", "."))
   nNota4 := Val(StrTran(cNota4, ",", "."))

   nMedia := ((nNota1 * 1) + ;
              (nNota2 * 2) + ;
              (nNota3 * 3) + ;
              (nNota4 * 4)) / 10

   QOut("")
   QOut("Media ponderada: " + Str(nMedia, 10, 2))

RETURN
