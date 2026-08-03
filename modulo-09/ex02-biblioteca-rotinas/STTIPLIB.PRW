#Include "Protheus.ch"

/*/{Protheus.doc} NomeCliente
Retorna o nome do contato na SZ1 a partir do código.
A ordem e os campos devem ser conferidos com a apostila.
@type Function
/*/
User Function NomeCliente(cCodigo)

   Local cNome := ""

   If ! Empty(cCodigo)
      cNome := Posicione(;
         "SZ1",;
         1,;
         xFilial("SZ1") + cCodigo,;
         "Z1_NOME";
      )
   EndIf

Return cNome


/*/{Protheus.doc} ProxCodigoSZ1
Gera o próximo código sequencial para SZ1.
@type Function
/*/
User Function ProxCodigoSZ1()

   Local cCodigo := GetSXENum("SZ1", "Z1_CODIGO")

Return cCodigo


/*/{Protheus.doc} ProxSequenSZ2
Gera a próxima sequência para SZ2.
A geração final deve respeitar a chave definida na apostila.
@type Function
/*/
User Function ProxSequenSZ2()

   Local cSequencia := GetSXENum("SZ2", "Z2_SEQUEN")

Return cSequencia


/*/{Protheus.doc} DescTipoInteracao
Retorna a descrição do domínio Z2 no SX5.
@type Function
/*/
User Function DescTipoInteracao(cTipo)

   Local cDescricao := ""

   Do Case
   Case cTipo == "E"
      cDescricao := "E-mail"
   Case cTipo == "L"
      cDescricao := "Ligacao"
   Case cTipo == "R"
      cDescricao := "Reuniao"
   Case cTipo == "V"
      cDescricao := "Visita"
   Case cTipo == "W"
      cDescricao := "WhatsApp"
   Otherwise
      cDescricao := "Tipo nao identificado"
   EndCase

Return cDescricao


/*/{Protheus.doc} GRAVARLOG
Registra informações de erro em arquivo texto.
@type Function
/*/
User Function GRAVARLOG(cFuncao, xErro)

   Local cArquivo := GetTempPath() + "sttip_erros.log"
   Local cDescricao := U_ERRODESC(xErro)
   Local cLinha := ""
   Local nHandle := -1

   Default cFuncao := "Funcao nao informada"

   cLinha := DToC(Date()) + " " + Time() + ;
      " | " + cFuncao + ;
      " | " + cDescricao + CRLF

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
      ConOut("Nao foi possivel gravar o log: " + cLinha)
   EndIf

Return Nil


/*/{Protheus.doc} ERRODESC
Converte o erro recebido em uma descrição segura.
@type Function
/*/
User Function ERRODESC(xErro)

   Local cDescricao := "Erro nao identificado"

   If ValType(xErro) == "O"
      cDescricao := xErro:Description
   ElseIf ! Empty(xErro)
      cDescricao := cValToChar(xErro)
   EndIf

Return cDescricao
