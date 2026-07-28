#Include "Protheus.ch"

/*/{Protheus.doc} STTIP008
mBrowse da ZA1 filtrado pelos pets com data de nascimento no mes atual.
Inclui botoes para abrir sem filtro e mostrar o historico do registro.
@type  Function
@author Kauan Novais
/*/
User Function STTIP008()

   Local cFiltro := ;
      "Month(ZA1->ZA1_DTNASC) == Month(dDataBase) .AND. " + ;
      "Year(ZA1->ZA1_DTNASC) == Year(dDataBase)"

   Private cCadastro := "Pets - Mes atual"
   Private aRotina := {}

   aAdd(aRotina, {"Pesquisar"  , "AxPesqui"     , 0, 1})
   aAdd(aRotina, {"Visualizar" , "AxVisual"     , 0, 2})
   aAdd(aRotina, {"Incluir"    , "AxInclui"     , 0, 3})
   aAdd(aRotina, {"Alterar"    , "AxAltera"     , 0, 4})
   aAdd(aRotina, {"Excluir"    , "AxDeleta"     , 0, 5})
   aAdd(aRotina, {"Sem filtro" , "U_STTIP008S"  , 0, 6})
   aAdd(aRotina, {"Historico"  , "U_HISTPET"    , 0, 6})

   dbSelectArea("ZA1")
   dbSetOrder(1)

   mBrowse(1, 1, 22, 75, "ZA1", , , , , , , , , , , .F., , , cFiltro)

Return Nil


/* Abre o mesmo Browse sem o filtro do mes. */
User Function STTIP008S()

   Local cFiltro := ""

   Private cCadastro := "Pets - Todos"
   Private aRotina := {}

   aAdd(aRotina, {"Pesquisar" , "AxPesqui"    , 0, 1})
   aAdd(aRotina, {"Visualizar", "AxVisual"    , 0, 2})
   aAdd(aRotina, {"Incluir"   , "AxInclui"    , 0, 3})
   aAdd(aRotina, {"Alterar"   , "AxAltera"    , 0, 4})
   aAdd(aRotina, {"Excluir"   , "AxDeleta"    , 0, 5})
   aAdd(aRotina, {"Mes atual" , "U_STTIP008"  , 0, 6})
   aAdd(aRotina, {"Historico" , "U_HISTPET"   , 0, 6})

   dbSelectArea("ZA1")
   dbSetOrder(1)

   mBrowse(1, 1, 22, 75, "ZA1", , , , , , , , , , , .F., , , cFiltro)

Return Nil


/* Exibe informacoes do registro atual. */
User Function HISTPET()

   Local cMensagem := ""

   dbSelectArea("ZA1")

   If Eof()
      MsgAlert("Nao existe um pet selecionado.", "Atencao")
      Return Nil
   EndIf

   cMensagem := "Codigo: " + AllTrim(ZA1->ZA1_COD) + CRLF
   cMensagem += "Nome: "  + AllTrim(ZA1->ZA1_NOME) + CRLF
   cMensagem += "Raca: "  + AllTrim(ZA1->ZA1_RACA)

   MsgInfo(cMensagem, "Historico do pet")

Return Nil
