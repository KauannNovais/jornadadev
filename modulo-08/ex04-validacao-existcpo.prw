#Include "Protheus.ch"

/*/{Protheus.doc} VALCLI001
Valida se o cliente e a loja informados existem na tabela SA1.

Configuração no SX3:
Campo: ZA1_CLIENT
X3_VALID: U_VALCLI001()
@type  Function
@author Kauan Novais
/*/
User Function VALCLI001()

   Local cChave := xFilial("SA1") + M->ZA1_CLIENT + M->ZA1_LOJA

   If ! ExistCpo("SA1", cChave, 1)
      MsgAlert("Cliente nao cadastrado na SA1!", "Atencao")
      Return .F.
   EndIf

Return .T.
