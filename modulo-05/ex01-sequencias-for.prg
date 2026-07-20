PROCEDURE Main()

   LOCAL nI

   QOut("=== SEQUENCIA DE 1 A 100 ===")
   FOR nI := 1 TO 100
      QOut(AllTrim(Str(nI)))
   NEXT

   QOut("")
   QOut("=== SEQUENCIA DE -50 A 50 ===")
   FOR nI := -50 TO 50
      QOut(AllTrim(Str(nI)))
   NEXT

   QOut("")
   QOut("=== SEQUENCIA DE 80 A 5 ===")
   FOR nI := 80 TO 5 STEP -1
      QOut(AllTrim(Str(nI)))
   NEXT

RETURN
