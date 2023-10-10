import 'package:correios_contrato/correios_contrato.dart';
import 'package:correios_contrato/models/caixa.dart';
import 'package:correios_contrato/models/contrato.dart';
import 'package:correios_contrato/models/objeto.dart';

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
