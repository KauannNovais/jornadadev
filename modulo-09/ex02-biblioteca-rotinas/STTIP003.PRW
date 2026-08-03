#Include "Protheus.ch"

/*/{Protheus.doc} STTIP003
Browse de Contatos da tabela SZ1.
O conjunto final de campos depende do dicionário da apostila.
@type Function
/*/
User Function STTIP003()

   Local aColors := {;
      {"Empty(SZ1->Z1_CLIENTE)", "BR_RED"},;
      {".T.", "BR_GREEN"};
   }

   Private cCadastro := "Contatos"
   Private aRotina := {}

   aAdd(aRotina, {"Pesquisar"  , "AxPesqui"   , 0, 1})
   aAdd(aRotina, {"Visualizar" , "AxVisual"   , 0, 2})
   aAdd(aRotina, {"Incluir"    , "AxInclui"   , 0, 3})
   aAdd(aRotina, {"Alterar"    , "AxAltera"   , 0, 4})
   aAdd(aRotina, {"Excluir"    , "AxDeleta"   , 0, 5})
   aAdd(aRotina, {"Interacoes" , "U_STTIP004" , 0, 6})

   dbSelectArea("SZ1")
   dbSetOrder(1)

   mBrowse(1, 1, 22, 75, "SZ1", , , , , , aColors)

Return Nil
