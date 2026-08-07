#Include "Protheus.ch"

/*/{Protheus.doc} TControleQualidade
Classe de domínio utilizada para encapsular regras do controle de qualidade.
Diferencial de Programação Orientada a Objetos.
@type Class
/*/
Class TControleQualidade

   Data cControle
   Data nTolerancia
   Data dValidade

   Method New(cControle, nTolerancia, dValidade) Constructor
   Method PercNaoConforme(nQtdOk, nQtdNok)
   Method AcimaTolerancia(nQtdOk, nQtdNok)
   Method SituacaoCertificado()
   Method Resumo(nQtdOk, nQtdNok)

EndClass


Method New(cControle, nTolerancia, dValidade) Class TControleQualidade

   Default cControle   := ""
   Default nTolerancia := 0
   Default dValidade   := CToD("")

   ::cControle   := cControle
   ::nTolerancia := nTolerancia
   ::dValidade   := dValidade

Return Self


Method PercNaoConforme(nQtdOk, nQtdNok) Class TControleQualidade

Return U_PercNaoConforme(nQtdOk, nQtdNok)


Method AcimaTolerancia(nQtdOk, nQtdNok) Class TControleQualidade

Return ::PercNaoConforme(nQtdOk, nQtdNok) > ::nTolerancia


Method SituacaoCertificado() Class TControleQualidade

   Local cSituacao := "REGULAR"

   If Empty(::dValidade)
      cSituacao := "SEM VALIDADE"
   ElseIf ::dValidade < dDataBase
      cSituacao := "VENCIDO"
   ElseIf ::dValidade <= dDataBase + 30
      cSituacao := "VENCE EM ATÉ 30 DIAS"
   EndIf

Return cSituacao


Method Resumo(nQtdOk, nQtdNok) Class TControleQualidade

   Local nPerc     := ::PercNaoConforme(nQtdOk, nQtdNok)
   Local cSituacao := IIf(::AcimaTolerancia(nQtdOk, nQtdNok), ;
      "ACIMA DA TOLERÂNCIA", ;
      "DENTRO DA TOLERÂNCIA")

Return ;
   "Controle: " + ::cControle + CRLF + ;
   "% não conforme: " + AllTrim(Str(nPerc, 8, 2)) + "%" + CRLF + ;
   "Tolerância: " + AllTrim(Str(::nTolerancia, 8, 2)) + "%" + CRLF + ;
   "Qualidade: " + cSituacao + CRLF + ;
   "Certificado: " + ::SituacaoCertificado()


/*/{Protheus.doc} TestaClasseTCC
Exemplo de uso da classe no SmartClient.
@type Function
/*/
User Function TestaClasseTCC()

   Local oControle := TControleQualidade():New(;
      "000001",;
      5,;
      dDataBase + 20;
   )

   MsgInfo(oControle:Resumo(95, 5), "Teste POO - TCC")

Return Nil
