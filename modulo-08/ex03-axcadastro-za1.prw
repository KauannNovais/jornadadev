#Include "Protheus.ch"

/*/{Protheus.doc} STTIP001
Cadastro de Pets utilizando AxCadastro na tabela ZA1.
@type  Function
@author Kauan Novais
/*/
User Function STTIP001()

   Private cCadastro := "Pets"

   dbSelectArea("ZA1")
   dbSetOrder(1)

   AxCadastro("ZA1", "Pets", , "1", , , , .F.)

Return Nil
