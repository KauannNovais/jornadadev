#Include "Protheus.ch"

/*/{Protheus.doc} STTIP003
mBrowse da ZA1 com legendas coloridas.

Observação:
O exemplo do PDF usa dDataBase - 30, que representa aproximadamente
30 dias. Como o texto do exercício pede pets com mais de 10 anos,
foi utilizada a aproximação de 3650 dias.
@type  Function
@author Kauan Novais
/*/
User Function STTIP003()

   Local aColors := {}
   Local cFiltro := ""

   Private cCadastro := "Pets"
   Private aRotina := {}

   aAdd(aRotina, {"Pesquisar" , "AxPesqui" , 0, 1})
   aAdd(aRotina, {"Visualizar", "AxVisual" , 0, 2})
   aAdd(aRotina, {"Incluir"   , "AxInclui" , 0, 3})
   aAdd(aRotina, {"Alterar"   , "AxAltera" , 0, 4})
   aAdd(aRotina, {"Excluir"   , "AxDeleta" , 0, 5})

   aAdd(aColors, {"ZA1->ZA1_DTNASC < dDataBase - 3650", "BR_RED"})
   aAdd(aColors, {"ZA1->ZA1_DTNASC == dDataBase",       "BR_YELLOW"})
   aAdd(aColors, {".T.",                                "BR_GREEN"})

   dbSelectArea("ZA1")
   dbSetOrder(1)

   mBrowse(1, 1, 22, 75, "ZA1", , , , , , aColors, , , , , .F., , , cFiltro)

Return Nil
