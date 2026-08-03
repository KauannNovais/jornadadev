#Include "Protheus.ch"

/*/{Protheus.doc} STTIP004
Browse de Interações da tabela SZ2 filtrado pelo contato selecionado.
@type Function
/*/
User Function STTIP004()

   Local cContato := ""
   Local cFiltro := ""

   If Select("SZ1") == 0 .Or. SZ1->(Eof())
      MsgAlert("Selecione um contato antes de abrir as interacoes.", "Atencao")
      Return Nil
   EndIf

   cContato := AllTrim(SZ1->Z1_CODIGO)

   cFiltro := ;
      "SZ2->Z2_FILIAL == '" + xFilial("SZ2") + "' .AND. " + ;
      "SZ2->Z2_CONTAT == '" + cContato + "'"

   Private cCadastro := "Interacoes do contato"
   Private aRotina := {}

   aAdd(aRotina, {"Pesquisar" , "AxPesqui", 0, 1})
   aAdd(aRotina, {"Visualizar", "AxVisual", 0, 2})
   aAdd(aRotina, {"Incluir"   , "AxInclui", 0, 3})
   aAdd(aRotina, {"Alterar"   , "AxAltera", 0, 4})
   aAdd(aRotina, {"Excluir"   , "AxDeleta", 0, 5})

   dbSelectArea("SZ2")
   dbSetOrder(1)

   mBrowse(1, 1, 22, 75, "SZ2", , , , , , , , , , , .F., , , cFiltro)

Return Nil
