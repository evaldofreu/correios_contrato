<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Plugin de acesso a API dos correios para clientes com contrato.
## Features
Somente a API de Preço foi implementada.


## Getting started

Para acessar a API de Preço e Prazo dos correios, antes é necessário realizar um contrato através da página https://www.correios.com.br/correios-facil/correios-facil. O processo é online e a assinatura do contrato é realizado por meio de certificado digital e-CNPJ.
A documentação da API está disponível em https://www.correios.com.br/atendimento/developers/arquivos/manual-para-integracao-correios-api

# Gerando um código de acesso
Na página da API dos correios (https://cws.correios.com.br/acesso-componentes) Acesse o menu Gestão de acesso a API´s e gere um código que você irá utilizar para obter um token de autorização. 
![Alt text](image-1.png)



## Usage


```dart

Future<void> main() async {
  var contrato = Contrato(
      codigoUsuario: "33333333333333", // cnpj da empresa
      codigoAcesso:
          "XXXXXXXXXXXXXXXXX", //  Código de acesso gerado na pagina cws.correios.com
      numeroCartao: "00777777777", //  Número do cartão do contrato
      numeroContrato:
          "3333333333"); // número do contrato - Pacote mínimo é o BRONZE

  var api = CorreiosContrato(contrato: contrato);

  List<Objeto> objetos = [
    Caixa(
      cepDestino: '14600000',
      cepOrigem: '14600000',
      contrato: contrato,
      peso: 500, // 500g
      servico: Servico.sedex,
      unidades: 1,
      numeroRequisicao: "0",
      altura: 4,
      largura: 12,
      comprimento: 16,
    )
  ];
  try {
    await api.getPreco(objetos).then((value) => print(value));
  } catch (e) {
    print(e);
  }
}

```

## Additional information


A API de Preço e prazo são restritas e você deve solicitar ao gestor responsável pelo seu contrato para libere o uso das APIs restritas.