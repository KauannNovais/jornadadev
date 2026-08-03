#Include "Protheus.ch"

/*/{Protheus.doc} STTIP004B
Browse geral de todas as Interações da SZ2, sem filtro por contato.
@type Function
/*/
User Function STTIP004B()

   Private cCadastro := "Todas as interacoes"
   Private aRotina := {}

   aAdd(aRotina, {"Pesquisar" , "AxPesqui", 0, 1})
   aAdd(aRotina, {"Visualizar", "AxVisual", 0, 2})
   aAdd(aRotina, {"Incluir"   , "AxInclui", 0, 3})
   aAdd(aRotina, {"Alterar"   , "AxAltera", 0, 4})
   aAdd(aRotina, {"Excluir"   , "AxDeleta", 0, 5})

   dbSelectArea("SZ2")
   dbSetOrder(1)

   mBrowse(1, 1, 22, 75, "SZ2")

Return Nil
