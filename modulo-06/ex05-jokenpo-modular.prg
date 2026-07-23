PROCEDURE Main()

   LOCAL cJogada
   LOCAL cJogadaCPU
   LOCAL cVencedor
   LOCAL cResposta := "S"

   WHILE cResposta == "S"

      cJogada := LerJogada()
      cJogadaCPU := SortearJogadaCPU()
      cVencedor := DefinirVencedor(cJogada, cJogadaCPU)

      MostrarResultado(cJogada, cJogadaCPU, cVencedor)

      ACCEPT "Jogar novamente? (S/N): " TO cResposta
      cResposta := Upper(AllTrim(cResposta))
      QOut("")
   ENDDO

   QOut("Jogo encerrado.")

RETURN


FUNCTION LerJogada()

   LOCAL cJogada := ""

   WHILE .T.
      ACCEPT "Escolha PEDRA, PAPEL ou TESOURA: " TO cJogada
      cJogada := Upper(AllTrim(cJogada))

      IF ValidarJogada(cJogada)
         RETURN cJogada
      ENDIF

      QOut("Jogada invalida. Tente novamente.")
   ENDDO

RETURN ""


FUNCTION SortearJogadaCPU()

   LOCAL nSorteio := HB_RandomInt(1, 3)

   DO CASE
   CASE nSorteio == 1
      RETURN "PEDRA"
   CASE nSorteio == 2
      RETURN "PAPEL"
   OTHERWISE
      RETURN "TESOURA"
   ENDCASE

RETURN ""


FUNCTION ValidarJogada(cJogada)

RETURN cJogada == "PEDRA" .OR. ;
       cJogada == "PAPEL" .OR. ;
       cJogada == "TESOURA"


FUNCTION DefinirVencedor(cJogada1, cJogada2)

   IF cJogada1 == cJogada2
      RETURN "EMPATE"
   ENDIF

   IF (cJogada1 == "PEDRA" .AND. cJogada2 == "TESOURA") .OR. ;
      (cJogada1 == "PAPEL" .AND. cJogada2 == "PEDRA") .OR. ;
      (cJogada1 == "TESOURA" .AND. cJogada2 == "PAPEL")
      RETURN "JOGADOR"
   ENDIF

RETURN "CPU"


PROCEDURE MostrarResultado(cJogada, cJogadaCPU, cVencedor)

   QOut("")
   QOut("Sua jogada: " + cJogada)
   QOut("Jogada da CPU: " + cJogadaCPU)

   DO CASE
   CASE cVencedor == "EMPATE"
      QOut("Resultado: empate!")
   CASE cVencedor == "JOGADOR"
      QOut("Resultado: voce venceu!")
   OTHERWISE
      QOut("Resultado: a CPU venceu!")
   ENDCASE

   QOut("")

RETURN
