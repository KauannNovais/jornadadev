#Include "Protheus.ch"

/*/{Protheus.doc} STTZZ1
Rotina principal de Controle de Fornecimento - tabela ZZ1.
Possui mBrowse, legendas, ocorrências, gravação segura e exclusão validada.
@type Function
@author Kauan Novais
/*/
User Function STTZZ1()

   Local aColors := {;
      {"!Empty(ZZ1->ZZ1_VALCER) .AND. ZZ1->ZZ1_VALCER < dDataBase", "BR_VERMELHO"},;
      {"U_CertificadoVencendo(ZZ1->ZZ1_VALCER)",                    "BR_AMARELO"},;
      {".T.",                                                       "BR_VERDE"};
   }

   Private cCadastro := "Controle de Fornecimento - ISO 9001"
   Private aRotina   := {}

   aAdd(aRotina, {"Pesquisar"   , "AxPesqui"    , 0, 1})
   aAdd(aRotina, {"Visualizar"  , "AxVisual"    , 0, 2})
   aAdd(aRotina, {"Incluir"     , "AxInclui"    , 0, 3})
   aAdd(aRotina, {"Alterar"     , "AxAltera"    , 0, 4})
   aAdd(aRotina, {"Excluir"     , "U_ZZ1Excluir", 0, 6})
   aAdd(aRotina, {"Ocorrencias" , "U_ZZ1Ocorr" , 0, 6})

   dbSelectArea("ZZ1")
   dbSetOrder(1)

   mBrowse(1, 1, 22, 75, "ZZ1", , , , , , aColors)

Return Nil


/*/{Protheus.doc} ZZ1Ocorr
Abre a rotina de ocorrências filtrada pelo controle selecionado.
@type Function
/*/
User Function ZZ1Ocorr()

   If Select("ZZ1") == 0 .Or. ZZ1->(Eof())
      MsgAlert("Selecione um controle para visualizar as ocorrências.", "Atenção")
      Return Nil
   EndIf

   U_STTZZ2FLT(AllTrim(ZZ1->ZZ1_CODIGO))

Return Nil


/*/{Protheus.doc} ValidaZZ1
Valida todos os dados obrigatórios da ZZ1.
@type Function
@return Logical
/*/
User Function ValidaZZ1()

   Local lValido := .T.

   If Empty(AllTrim(M->ZZ1_CODIGO))
      MsgAlert("O código do controle deve ser informado.", "Validação")
      lValido := .F.

   ElseIf Empty(AllTrim(M->ZZ1_FORNEC)) .Or. Empty(AllTrim(M->ZZ1_LOJAFO))
      MsgAlert("Informe o fornecedor e a loja.", "Validação")
      lValido := .F.

   ElseIf ! ExistCpo("SA2", xFilial("SA2") + M->ZZ1_FORNEC + M->ZZ1_LOJAFO, 1)
      MsgAlert("Fornecedor ou loja não cadastrado na SA2.", "Validação")
      lValido := .F.

   ElseIf Empty(AllTrim(M->ZZ1_CERTIF))
      MsgAlert("Os dados do certificado devem ser informados.", "Validação")
      lValido := .F.

   ElseIf Empty(M->ZZ1_VALCER)
      MsgAlert("A validade do certificado deve ser informada.", "Validação")
      lValido := .F.

   ElseIf INCLUI .And. M->ZZ1_VALCER < dDataBase
      MsgAlert("Na inclusão, a validade não pode ser anterior à data atual.", "Validação")
      lValido := .F.

   ElseIf M->ZZ1_TOLERA < 0 .Or. M->ZZ1_TOLERA > 100
      MsgAlert("A tolerância deve estar entre 0 e 100%.", "Validação")
      lValido := .F.

   ElseIf M->ZZ1_TOTOK < 0 .Or. M->ZZ1_TOTNOK < 0
      MsgAlert("As quantidades consolidadas não podem ser negativas.", "Validação")
      lValido := .F.
   EndIf

Return lValido


/*/{Protheus.doc} STTZZ1SALVAR
Grava a ZZ1 com transação, tratamento de erros e log técnico.
Pode ser configurada como ponto de entrada da confirmação da rotina.
@type Function
@return Logical
/*/
User Function STTZZ1SALVAR()

   Local lInclui   := INCLUI
   Local lUsouSX8  := .F.
   Local xErro     := Nil

   If lInclui .And. Empty(AllTrim(M->ZZ1_CODIGO))
      M->ZZ1_CODIGO := GetSXENum("ZZ1", "ZZ1_CODIGO")
      lUsouSX8 := .T.
   EndIf

   BeginTran()

   BEGIN SEQUENCE

      If ! U_ValidaZZ1()
         Break("Existem campos inválidos na manutenção da ZZ1.")
      EndIf

      If ! RecLock("ZZ1", lInclui)
         Break("Não foi possível bloquear o registro da ZZ1.")
      EndIf

      ZZ1->ZZ1_FILIAL := xFilial("ZZ1")
      ZZ1->ZZ1_CODIGO := M->ZZ1_CODIGO
      ZZ1->ZZ1_FORNEC := M->ZZ1_FORNEC
      ZZ1->ZZ1_LOJAFO := M->ZZ1_LOJAFO
      ZZ1->ZZ1_CERTIF := M->ZZ1_CERTIF
      ZZ1->ZZ1_VALCER := M->ZZ1_VALCER
      ZZ1->ZZ1_TOLERA := M->ZZ1_TOLERA
      ZZ1->ZZ1_TOTOK  := M->ZZ1_TOTOK
      ZZ1->ZZ1_TOTNOK := M->ZZ1_TOTNOK

      MsUnLock()

      If lUsouSX8
         ConfirmSX8()
      EndIf

      CommitTran()
      MsgInfo("Controle de fornecimento gravado com sucesso.", "Sucesso")

   RECOVER WITH xErro

      MsUnLock()
      RollBackTran()

      If lUsouSX8
         RollBackSX8()
      EndIf

      MsgStop(;
         "Não foi possível gravar o controle." + CRLF + ;
         "Motivo: " + U_ErroDescTCC(xErro),;
         "Erro na gravação";
      )

      U_GravarLogTCC("STTZZ1SALVAR", xErro)

      Return .F.

   END SEQUENCE

Return .T.


/*/{Protheus.doc} ValExcZZ1
Impede a exclusão de um controle que possua ocorrências na ZZ2.
@type Function
@return Logical
/*/
User Function ValExcZZ1()

   Local cChave := xFilial("ZZ2") + ZZ1->ZZ1_CODIGO

   If ExistCpo("ZZ2", cChave, 1)
      MsgAlert(;
         "Este controle possui ocorrências vinculadas e não pode ser excluído.",;
         "Integridade referencial";
      )
      Return .F.
   EndIf

Return .T.


/*/{Protheus.doc} ZZ1Excluir
Exclusão protegida da ZZ1.
@type Function
/*/
User Function ZZ1Excluir()

   Local xErro := Nil

   If Select("ZZ1") == 0 .Or. ZZ1->(Eof())
      MsgAlert("Selecione um controle para excluir.", "Atenção")
      Return Nil
   EndIf

   If ! U_ValExcZZ1()
      Return Nil
   EndIf

   If ! MsgYesNo("Confirma a exclusão do controle selecionado?", "Confirmação")
      Return Nil
   EndIf

   BeginTran()

   BEGIN SEQUENCE

      If ! RecLock("ZZ1", .F.)
         Break("Não foi possível bloquear o registro para exclusão.")
      EndIf

      dbDelete()
      MsUnLock()
      CommitTran()

      MsgInfo("Controle excluído com sucesso.", "Sucesso")

   RECOVER WITH xErro

      MsUnLock()
      RollBackTran()

      MsgStop(;
         "Não foi possível excluir o controle." + CRLF + ;
         "Motivo: " + U_ErroDescTCC(xErro),;
         "Erro";
      )

      U_GravarLogTCC("ZZ1Excluir", xErro)

   END SEQUENCE

Return Nil
