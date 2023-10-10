import 'package:correios_contrato/core/preco_api_client.dart';
import 'package:correios_contrato/models/autorizacao.dart';
import 'package:correios_contrato/models/caixa.dart';
import 'package:correios_contrato/models/contrato.dart';
import 'package:correios_contrato/models/objeto.dart';
import 'package:correios_contrato/models/preco.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  testWidgets('preco api client ...', (tester) async {
    var mclient = MockClient((request) => Future.value(Response(
        r'[{"coProduto":"03298","pcBase":"15,99","pcBaseGeral":"16,84","peVariacao":"0,0000","pcReferencia":"16,84","vlBaseCalculoImposto":"16,84","nuRequisicao":"0","inPesoCubico":"N","psCobrado":"300","peAdValorem":"0,0100","vlSeguroAutomatico":"24,50","qtAdicional":"0","pcFaixa":"16,84","pcFaixaVariacao":"16,84","pcProduto":"16,84","pcFinal":"16,84"}]',
        200)));
    var contrato = Contrato(
        codigoAcesso: "ADFADFASD",
        codigoUsuario: "24524352345",
        numeroCartao: "2452345",
        numeroContrato: "2452345243");

    Autorizacao autorizacao = Autorizacao(
        ambiente: 'PRODUCAO',
        id: '1',
        ip: '',
        perfil: '',
        cnpj: '',
        emissao: DateTime.now(),
        expiraEm: DateTime.now(),
        zoneOffset: 'GMT -3',
        token: "");

    var objetos = [
      Caixa(
          cepOrigem: '14600000',
          cepDestino: '14600000',
          servico: Servico.pac,
          contrato: contrato,
          unidades: 1,
          peso: 300,
          comprimento: 16,
          largura: 12,
          altura: 4)
    ];
    var api = PrecoApiClient(httpClient: mclient);
    var precos = await api.getPreco(
        objetos: objetos,
        autorizacao: autorizacao,
        tipoRemessa: TipoRemessa.nacional);
    expect(precos, isA<List<Preco>>());
    expect(precos, isNotEmpty);
  });
}
