import 'dart:convert';

import '../models/autorizacao.dart';
import '../models/contrato.dart';
import 'package:http/http.dart' as http;

///Adaptador que acessa a API Token que solicita autorização de acesso
class TokenAPIClient {
  ///Dados do contrato firmado com os Correios
  final Contrato contrato;
  late http.Client _httpClient;

  ///Inicializa o adaptador com as informações do contrato
  TokenAPIClient({required this.contrato, http.Client? httpClient}) {
    _httpClient = httpClient ?? http.Client();
  }

  ///Solicita autorização de acesso a API
  Future<Autorizacao> autorizar() async {
    var basicAuth =
        'Basic ${base64Encode(utf8.encode('${contrato.codigoUsuario}:${contrato.codigoAcesso}'))}';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Authorization": basicAuth
    };
    var body = {"numero": this.contrato.numeroCartao};
    var uri = Uri.parse(
        "https://api.correios.com.br/token/v1/autentica/cartaopostagem");

    http.Response response =
        await _httpClient!.post(uri, headers: headers, body: jsonEncode(body));
    print(response);
    if (response.statusCode == 201) {
      var json = jsonDecode(response.body);
      return Autorizacao.fromJson(json);
    } else {
      print(response);
      switch (response.statusCode) {
        case 400:
          throw "Credenciais inválidas";

        case 500:
          throw "Falha no serviço de consulta de preços";

        case 500:
          throw "Falha no serviço de consulta de preços";
        default:
          throw "Autorização falhou.";
      }
    }
  }
}
