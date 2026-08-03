#Include "Protheus.ch"

/*/{Protheus.doc} VALEXCSZ1
Impede a exclusão de um contato que possua interações na SZ2.
@type Function
/*/
User Function VALEXCSZ1()

   Local cChave := xFilial("SZ2") + SZ1->Z1_CODIGO

   If ExistCpo("SZ2", cChave, 1)
      MsgAlert(;
         "Este contato possui interacoes vinculadas e nao pode ser excluido.",;
         "Integridade referencial";
      )
      Return .F.
   EndIf

Return .T.


/*/{Protheus.doc} EXECUTARSEGURO
Executa um bloco de código com tratamento de erros e log.
Retorna .T. em caso de sucesso e .F. em caso de falha.
@type Function
/*/
User Function EXECUTARSEGURO(bBloco, cMsgErro)

   Local xErro := Nil

   Default cMsgErro := "Falha ao executar a operacao."

   If ValType(bBloco) != "B"
      MsgStop("O parametro informado nao e um bloco de codigo.", "Erro")
      Return .F.
   EndIf

   BEGIN SEQUENCE

      Eval(bBloco)

   RECOVER WITH xErro

      MsgStop(;
         cMsgErro + CRLF + ;
         "Detalhes: " + U_ERRODESC(xErro),;
         "Erro";
      )

      U_GRAVARLOG("EXECUTARSEGURO", xErro)

      Return .F.

   END SEQUENCE

Return .T.
