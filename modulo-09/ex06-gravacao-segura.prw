#Include "Protheus.ch"

/*/{Protheus.doc} STTIP003SALVAR
Realiza a gravação segura de um contato na SZ1.
Valida os campos, usa transação, lock, rollback e log.
@type Function
/*/
User Function STTIP003SALVAR()

   Local xErro := Nil
   Local lInclui := ! SZ1->(MsSeek(xFilial("SZ1") + M->Z1_CODIGO))

   BeginTran()

   BEGIN SEQUENCE

      If Empty(AllTrim(M->Z1_CLIENTE))
         Break("O cliente deve ser informado.")
      EndIf

      If Empty(AllTrim(M->Z1_ASSUNTO))
         Break("O assunto deve ser informado.")
      EndIf

      If ! RecLock("SZ1", lInclui)
         Break("Nao foi possivel bloquear o registro para gravacao.")
      EndIf

      SZ1->Z1_FILIAL  := xFilial("SZ1")
      SZ1->Z1_CODIGO  := M->Z1_CODIGO
      SZ1->Z1_CLIENTE := M->Z1_CLIENTE
      SZ1->Z1_ASSUNTO := M->Z1_ASSUNTO

      /*
         Inclua aqui os demais campos da SZ1 definidos na apostila.
         O PDF enviado não contém a estrutura completa da tabela.
      */

      MsUnLock()
      CommitTran()

      MsgInfo("Contato gravado com sucesso!", "Sucesso")

   RECOVER WITH xErro

      If SZ1->(Recno()) > 0
         MsUnLock()
      EndIf

      RollBackTran()

      MsgStop(;
         "Nao foi possivel salvar o contato." + CRLF + ;
         "Motivo: " + U_ERRODESC(xErro),;
         "Erro na gravacao";
      )

      U_GRAVARLOG("STTIP003SALVAR", xErro)

      Return .F.

   END SEQUENCE

Return .T.
