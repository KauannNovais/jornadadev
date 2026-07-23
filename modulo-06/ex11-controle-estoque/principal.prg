SET PROCEDURE TO estoque_lib.prg

PROCEDURE Main()

   LOCAL aProdutos := {}
   LOCAL nOpcao

   WHILE .T.

      nOpcao := MenuEstoque()

      DO CASE
      CASE nOpcao == 1
         CadastrarProduto(aProdutos)

      CASE nOpcao == 2
         ListarProdutos(aProdutos)

      CASE nOpcao == 3
         EntradaEstoque(aProdutos)

      CASE nOpcao == 4
         SaidaEstoque(aProdutos)

      CASE nOpcao == 5
         ConsultarProduto(aProdutos)

      CASE nOpcao == 6
         RelatorioEstoque(aProdutos)

      CASE nOpcao == 0
         EXIT
      ENDCASE

      QOut("")
   ENDDO

   QOut("Sistema encerrado.")

RETURN
