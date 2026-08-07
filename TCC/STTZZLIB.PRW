#Include "Protheus.ch"

/*/{Protheus.doc} NomeFornecedor
Retorna o nome do fornecedor cadastrado na SA2.
@type Function
@param cFornec, Character, código do fornecedor
@param cLoja, Character, loja do fornecedor
@return Character, nome do fornecedor
/*/
User Function NomeFornecedor(cFornec, cLoja)

   Local cNome := ""

   Default cFornec := ""
   Default cLoja   := ""

   If ! Empty(cFornec) .And. ! Empty(cLoja)
      cNome := Posicione(;
         "SA2",;
         1,;
         xFilial("SA2") + cFornec + cLoja,;
         "A2_NOME";
      )
   EndIf

Return cNome


/*/{Protheus.doc} NomeProduto
Retorna a descrição do produto cadastrado na SB1.
@type Function
@param cCodPro, Character, código do produto
@return Character, descrição do produto
/*/
User Function NomeProduto(cCodPro)

   Local cDescricao := ""

   Default cCodPro := ""

   If ! Empty(cCodPro)
      cDescricao := Posicione(;
         "SB1",;
         1,;
         xFilial("SB1") + cCodPro,;
         "B1_DESC";
      )
   EndIf

Return cDescricao


/*/{Protheus.doc} PercNaoConforme
Calcula o percentual de quantidade não conforme.
@type Function
@param nOk, Numeric, quantidade conforme
@param nNok, Numeric, quantidade não conforme
@return Numeric, percentual entre 0 e 100
/*/
User Function PercNaoConforme(nOk, nNok)

   Local nTotal := 0
   Local nPerc  := 0

   Default nOk  := 0
   Default nNok := 0

   nTotal := nOk + nNok

   If nTotal > 0
      nPerc := (nNok / nTotal) * 100
   EndIf

Return Round(nPerc, 2)


/*/{Protheus.doc} CertificadoVencendo
Retorna verdadeiro quando o certificado vence nos próximos 30 dias.
Certificados já vencidos retornam falso, pois possuem legenda própria.
@type Function
@param dValCer, Date, validade do certificado
@return Logical
/*/
User Function CertificadoVencendo(dValCer)

   Local lVencendo := .F.

   If ValType(dValCer) == "D" .And. ! Empty(dValCer)
      lVencendo := dValCer >= dDataBase .And. dValCer <= dDataBase + 30
   EndIf

Return lVencendo


/*/{Protheus.doc} ToleranciaControle
Busca a tolerância cadastrada na ZZ1.
@type Function
@param cControle, Character, código do controle
@return Numeric, tolerância percentual
/*/
User Function ToleranciaControle(cControle)

   Local nTolerancia := 0
   Local cValor      := ""

   Default cControle := ""

   If ! Empty(cControle)
      cValor := Posicione(;
         "ZZ1",;
         1,;
         xFilial("ZZ1") + cControle,;
         "ZZ1_TOLERA";
      )

      If ValType(cValor) == "N"
         nTolerancia := cValor
      Else
         nTolerancia := Val(cValToChar(cValor))
      EndIf
   EndIf

Return nTolerancia


/*/{Protheus.doc} ControleExiste
Valida a existência do controle na tabela ZZ1.
@type Function
/*/
User Function ControleExiste(cControle)

   Default cControle := ""

Return ExistCpo("ZZ1", xFilial("ZZ1") + cControle, 1)


/*/{Protheus.doc} FornecedorExiste
Valida código e loja na tabela SA2.
@type Function
/*/
User Function FornecedorExiste(cFornec, cLoja)

   Default cFornec := ""
   Default cLoja   := ""

Return ExistCpo("SA2", xFilial("SA2") + cFornec + cLoja, 1)


/*/{Protheus.doc} ProdutoExiste
Valida o código do produto na tabela SB1.
@type Function
/*/
User Function ProdutoExiste(cProduto)

   Default cProduto := ""

Return ExistCpo("SB1", xFilial("SB1") + cProduto, 1)


/*/{Protheus.doc} ErroDescTCC
Converte um objeto ou valor de erro em texto seguro.
@type Function
/*/
User Function ErroDescTCC(xErro)

   Local cDescricao := "Erro não identificado"

   If ValType(xErro) == "O"
      cDescricao := xErro:Description
   ElseIf ValType(xErro) == "C"
      cDescricao := xErro
   ElseIf ! Empty(xErro)
      cDescricao := cValToChar(xErro)
   EndIf

Return cDescricao


/*/{Protheus.doc} GravarLogTCC
Grava um log técnico em arquivo texto no diretório temporário.
@type Function
@param cFuncao, Character, função onde ocorreu a falha
@param xErro, Variant, objeto ou descrição do erro
@return Nil
/*/
User Function GravarLogTCC(cFuncao, xErro)

   Local cArquivo   := GetTempPath() + "tcc_iso9001_erros.log"
   Local cDescricao := U_ErroDescTCC(xErro)
   Local cLinha     := ""
   Local nHandle    := -1

   Default cFuncao := "Função não informada"

   cLinha := DToC(Date()) + " " + Time() + ;
      " | Usuário: " + cNomUsr + ;
      " | Função: " + cFuncao + ;
      " | Erro: " + cDescricao + CRLF

   nHandle := FOpen(cArquivo, 2)

   If nHandle < 0
      nHandle := FCreate(cArquivo)
   Else
      FSeek(nHandle, 0, 2)
   EndIf

   If nHandle >= 0
      FWrite(nHandle, cLinha)
      FClose(nHandle)
   Else
      ConOut("Falha ao gravar log: " + cLinha)
   EndIf

Return Nil


/*/{Protheus.doc} AtualizaTotaisZZ1
Recalcula as quantidades consolidadas da ZZ1 a partir da ZZ2.
@type Function
@param cControle, Character, código do controle
@return Logical
/*/
User Function AtualizaTotaisZZ1(cControle)

   Local aArea     := GetArea()
   Local aAreaZZ1 := {}
   Local aAreaZZ2 := {}
   Local nTotOk   := 0
   Local nTotNok  := 0
   Local lSucesso := .F.
   Local xErro    := Nil

   Default cControle := ""

   If Empty(cControle)
      Return .F.
   EndIf

   BEGIN SEQUENCE

      dbSelectArea("ZZ2")
      aAreaZZ2 := ZZ2->(GetArea())
      dbSetOrder(1)

      If ZZ2->(dbSeek(xFilial("ZZ2") + cControle))
         While ! ZZ2->(Eof()) .And. ;
               ZZ2->ZZ2_FILIAL == xFilial("ZZ2") .And. ;
               ZZ2->ZZ2_CONFOR == cControle

            nTotOk  += ZZ2->ZZ2_QTDOK
            nTotNok += ZZ2->ZZ2_QTDNOK
            ZZ2->(dbSkip())
         EndDo
      EndIf

      dbSelectArea("ZZ1")
      aAreaZZ1 := ZZ1->(GetArea())
      dbSetOrder(1)

      If ZZ1->(dbSeek(xFilial("ZZ1") + cControle))
         If RecLock("ZZ1", .F.)
            ZZ1->ZZ1_TOTOK  := nTotOk
            ZZ1->ZZ1_TOTNOK := nTotNok
            MsUnLock()
            lSucesso := .T.
         Else
            Break("Não foi possível bloquear a ZZ1 para atualizar os totais.")
         EndIf
      Else
         Break("Controle não encontrado para atualização dos totais.")
      EndIf

   RECOVER WITH xErro

      U_GravarLogTCC("AtualizaTotaisZZ1", xErro)
      lSucesso := .F.

   END SEQUENCE

   If Len(aAreaZZ2) > 0
      RestArea(aAreaZZ2)
   EndIf

   If Len(aAreaZZ1) > 0
      RestArea(aAreaZZ1)
   EndIf

   RestArea(aArea)

Return lSucesso
