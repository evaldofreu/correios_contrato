library correios_contrato;

import 'package:correios_contrato/core/token_api_client.dart';

import 'core/preco_api_client.dart';
import 'models/autorizacao.dart';
import 'models/contrato.dart';
import 'models/objeto.dart';
import 'models/preco.dart';

class CorreiosContrato {
  final Contrato contrato;
  static Autorizacao? autorizacao;
  CorreiosContrato({required this.contrato});

  Future<Preco> getPreco(Objeto objeto) async {
    if (!(autorizacao?.isAutorizado() ?? false)) {
      var apitoken = TokenAPIClient(contrato: contrato);
      autorizacao = await apitoken.autorizar();
    }
    if (autorizacao?.isAutorizado() ?? false) {
      return PrecoApiClient()
          .getPreco(objeto: objeto, autorizacao: autorizacao!);
    } else {
      throw "Problemas com credenciais de acesso.";
    }
  }
}
