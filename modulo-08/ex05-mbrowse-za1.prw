#Include "Protheus.ch"

/*/{Protheus.doc} STTIP002
Cadastro de Pets utilizando mBrowse.
@type  Function
@author Kauan Novais
/*/
User Function STTIP002()

   Private cCadastro := "Pets"
   Private aRotina := {}

   aAdd(aRotina, {"Pesquisar" , "AxPesqui" , 0, 1})
   aAdd(aRotina, {"Visualizar", "AxVisual" , 0, 2})
   aAdd(aRotina, {"Incluir"   , "AxInclui" , 0, 3})
   aAdd(aRotina, {"Alterar"   , "AxAltera" , 0, 4})
   aAdd(aRotina, {"Excluir"   , "AxDeleta" , 0, 5})

   dbSelectArea("ZA1")
   dbSetOrder(1)

   mBrowse(1, 1, 22, 75, "ZA1")

Return Nil
