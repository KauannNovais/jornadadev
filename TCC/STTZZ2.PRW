#Include "Protheus.ch"

/*/{Protheus.doc} STTZZ2
Rotina geral de Ocorrências de Fornecedores - tabela ZZ2.
@type Function
@author Kauan Novais
/*/
User Function STTZZ2()

   U_AbreZZ2("")

Return Nil


/*/{Protheus.doc} STTZZ2FLT
Abre a ZZ2 filtrada pelo código da ZZ1.
@type Function
@param cCodigoZZ1, Character, código do controle
/*/
User Function STTZZ2FLT(cCodigoZZ1)

   Default cCodigoZZ1 := ""

   U_AbreZZ2(cCodigoZZ1)

Return Nil


/*/{Protheus.doc} AbreZZ2
Função central que evita duplicação entre o browse geral e filtrado.
@type Function
/*/
User Function AbreZZ2(cCodigoZZ1)

   Local cAlias  := "ZZ2"
   Local cFiltro := ""
   Local aColors := {;
      {"U_PercNaoConforme(ZZ2->ZZ2_QTDOK,ZZ2->ZZ2_QTDNOK) > U_ToleranciaControle(ZZ2->ZZ2_CONFOR)", "BR_VERMELHO"},;
      {".T.", "BR_VERDE"};
   }

   Default cCodigoZZ1 := ""

   Private cCadastro := "Ocorrências de Fornecedores - ISO 9001"
   Private aRotina   := {}
   Private aIndexZZ2 := {}
   Private bFiltraBrw := {|| FilBrowse(cAlias, @aIndexZZ2, @cFiltro, .T.)}

   If ! Empty(cCodigoZZ1)
      cFiltro := ;
         "ZZ2->ZZ2_FILIAL == '" + xFilial("ZZ2") + "' .AND. " + ;
         "ZZ2->ZZ2_CONFOR == '" + cCodigoZZ1 + "'"

      cCadastro += " - Controle " + cCodigoZZ1
      aAdd(aRotina, {"Pesquisar"  , "PesqBrw"         , 0, 1})
   Else
      aAdd(aRotina, {"Pesquisar"  , "AxPesqui"        , 0, 1})
   EndIf

   aAdd(aRotina, {"Visualizar" , "AxVisual"         , 0, 2})
   aAdd(aRotina, {"Incluir"    , "AxInclui"         , 0, 3})
   aAdd(aRotina, {"Alterar"    , "AxAltera"         , 0, 4})
   aAdd(aRotina, {"Excluir"    , "AxDeleta"         , 0, 5})
   aAdd(aRotina, {"Indicadores", "U_ZZ2Indicadores", 0, 6})

   dbSelectArea(cAlias)
   dbSetOrder(1)

   // FilBrowse cria o filtro temporário usado pelo mBrowse.
   If ! Empty(cFiltro)
      Eval(bFiltraBrw)
      dbSelectArea(cAlias)
      dbGoTop()
   EndIf

   mBrowse(1, 1, 22, 75, cAlias, , , , , , aColors)

   // EndFilBrw elimina o filtro e o arquivo temporário após o fechamento.
   If Len(aIndexZZ2) > 0
      EndFilBrw(cAlias, aIndexZZ2)
   EndIf

Return Nil

/*/{Protheus.doc} ValidaZZ2
Valida os campos obrigatórios da ZZ2.
@type Function
@return Logical
/*/
User Function ValidaZZ2()

   Local lValido := .T.
   Local nTotal  := M->ZZ2_QTDOK + M->ZZ2_QTDNOK

   If Empty(AllTrim(M->ZZ2_CONFOR))
      MsgAlert("O controle de fornecimento deve ser informado.", "Validação")
      lValido := .F.

   ElseIf ! U_ControleExiste(M->ZZ2_CONFOR)
      MsgAlert("O controle informado não existe na ZZ1.", "Validação")
      lValido := .F.

   ElseIf Empty(AllTrim(M->ZZ2_CODPRO))
      MsgAlert("O produto deve ser informado.", "Validação")
      lValido := .F.

   ElseIf ! U_ProdutoExiste(M->ZZ2_CODPRO)
      MsgAlert("O produto informado não existe na SB1.", "Validação")
      lValido := .F.

   ElseIf Empty(M->ZZ2_DATA)
      MsgAlert("A data da ocorrência deve ser informada.", "Validação")
      lValido := .F.

   ElseIf M->ZZ2_DATA > dDataBase
      MsgAlert("A data da ocorrência não pode ser futura.", "Validação")
      lValido := .F.

   ElseIf M->ZZ2_QTDOK < 0 .Or. M->ZZ2_QTDNOK < 0
      MsgAlert("As quantidades não podem ser negativas.", "Validação")
      lValido := .F.

   ElseIf nTotal <= 0
      MsgAlert("Informe ao menos uma quantidade conforme ou não conforme.", "Validação")
      lValido := .F.

   ElseIf M->ZZ2_VLRUNI < 0
      MsgAlert("O valor unitário não pode ser negativo.", "Validação")
      lValido := .F.
   EndIf

Return lValido


/*/{Protheus.doc} STTZZ2SALVAR
Grava uma ocorrência com transação, log e atualização da ZZ1.
@type Function
@return Logical
/*/
User Function STTZZ2SALVAR()

   Local lInclui := INCLUI
   Local xErro   := Nil
   Local cFornec := ""
   Local cLoja   := ""

   BeginTran()

   BEGIN SEQUENCE

      If ! U_ValidaZZ2()
         Break("Existem campos inválidos na manutenção da ZZ2.")
      EndIf

      cFornec := Posicione(;
         "ZZ1",;
         1,;
         xFilial("ZZ1") + M->ZZ2_CONFOR,;
         "ZZ1_FORNEC";
      )

      cLoja := Posicione(;
         "ZZ1",;
         1,;
         xFilial("ZZ1") + M->ZZ2_CONFOR,;
         "ZZ1_LOJAFO";
      )

      If ! RecLock("ZZ2", lInclui)
         Break("Não foi possível bloquear o registro da ZZ2.")
      EndIf

      ZZ2->ZZ2_FILIAL := xFilial("ZZ2")
      ZZ2->ZZ2_CONFOR := M->ZZ2_CONFOR
      ZZ2->ZZ2_FORNEC := cFornec
      ZZ2->ZZ2_LOJAFO := cLoja
      ZZ2->ZZ2_DATA   := IIf(lInclui, dDataBase, M->ZZ2_DATA)
      ZZ2->ZZ2_HORA   := IIf(lInclui, Time(), M->ZZ2_HORA)
      ZZ2->ZZ2_CODPRO := M->ZZ2_CODPRO
      ZZ2->ZZ2_QTDOK  := M->ZZ2_QTDOK
      ZZ2->ZZ2_QTDNOK := M->ZZ2_QTDNOK
      ZZ2->ZZ2_VLRUNI := M->ZZ2_VLRUNI

      MsUnLock()

      If ! U_AtualizaTotaisZZ1(M->ZZ2_CONFOR)
         Break("A ocorrência foi gravada, mas os totais da ZZ1 não puderam ser atualizados.")
      EndIf

      CommitTran()
      MsgInfo("Ocorrência gravada com sucesso.", "Sucesso")

   RECOVER WITH xErro

      MsUnLock()
      RollBackTran()

      MsgStop(;
         "Não foi possível gravar a ocorrência." + CRLF + ;
         "Motivo: " + U_ErroDescTCC(xErro),;
         "Erro na gravação";
      )

      U_GravarLogTCC("STTZZ2SALVAR", xErro)

      Return .F.

   END SEQUENCE

Return .T.


/*/{Protheus.doc} ZZ2Indicadores
Exibe os indicadores do registro atual.
@type Function
/*/
User Function ZZ2Indicadores()

   Local nPerc       := 0
   Local nTolerancia := 0
   Local cSituacao   := ""
   Local cMensagem   := ""

   If Select("ZZ2") == 0 .Or. ZZ2->(Eof())
      MsgAlert("Selecione uma ocorrência.", "Atenção")
      Return Nil
   EndIf

   nPerc       := U_PercNaoConforme(ZZ2->ZZ2_QTDOK, ZZ2->ZZ2_QTDNOK)
   nTolerancia := U_ToleranciaControle(ZZ2->ZZ2_CONFOR)
   cSituacao   := IIf(nPerc > nTolerancia, "ACIMA DA TOLERÂNCIA", "DENTRO DA TOLERÂNCIA")

   cMensagem := "Controle: " + AllTrim(ZZ2->ZZ2_CONFOR) + CRLF
   cMensagem += "Produto: " + AllTrim(ZZ2->ZZ2_CODPRO) + CRLF
   cMensagem += "Descrição: " + AllTrim(U_NomeProduto(ZZ2->ZZ2_CODPRO)) + CRLF
   cMensagem += "% não conforme: " + AllTrim(Str(nPerc, 8, 2)) + "%" + CRLF
   cMensagem += "Tolerância: " + AllTrim(Str(nTolerancia, 8, 2)) + "%" + CRLF
   cMensagem += "Situação: " + cSituacao

   MsgInfo(cMensagem, "Indicadores de qualidade")

Return Nil
