PROCEDURE Main()

   LOCAL cTextoLongo := "Harbour"
   LOCAL cInicio     := "Harb"
   LOCAL lComIgual
   LOCAL lComIgualExato

   // Com SET EXACT OFF, o operador = aceita uma correspondencia
   // pelo inicio da string.
   SET EXACT OFF

   lComIgual      := (cTextoLongo = cInicio)
   lComIgualExato := (cTextoLongo == cInicio)

   QOut("Texto 1: " + cTextoLongo)
   QOut("Texto 2: " + cInicio)
   QOut("")
   QOut("Resultado usando =  : " + IIf(lComIgual, ".T.", ".F."))
   QOut("Resultado usando == : " + IIf(lComIgualExato, ".T.", ".F."))

   QOut("")
   QOut("Explicacao:")
   QOut("= compara de forma nao exata quando SET EXACT esta OFF.")
   QOut("== compara de forma exata, incluindo todo o conteudo.")

RETURN
