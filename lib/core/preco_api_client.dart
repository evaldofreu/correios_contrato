import 'package:correios_contrato/models/autorizacao.dart';
import 'package:correios_contrato/models/objeto.dart';
import 'package:http/http.dart' as http;

import 'package:correios_contrato/models/preco.dart';
import 'dart:convert';

class PrecoApiClient {
  late http.Client _httpClient;
  PrecoApiClient({http.Client? httpClient}) {
    _httpClient = httpClient ?? http.Client();
  }
  Future<List<Preco>> getPreco(
      {required List<Objeto> objetos,
      required Autorizacao autorizacao,
      required TipoRemessa tipoRemessa}) async {
    var uri = Uri.parse(
        "https://api.correios.com.br/preco/v1/${tipoRemessa == TipoRemessa.nacional ? "nacional" : "internacional"}");

    var headers = {
      "Content-Type": "application/json",
      'accept': 'application/json',
      'Authorization': 'Bearer ${autorizacao.token}'
    };
    var json = jsonEncode(objetos.map((e) => e.toMap()).toList());
    http.Response response =
        await _httpClient.post(uri, headers: headers, body: json);
    switch (response.statusCode) {
      case 200:
        List<dynamic> precos = jsonDecode(response.body);
        return precos
            .map((precoProduto) => Preco.fromJson(precoProduto))
            .toList();
      case 400:
        throw "Dados insuficientes ou incompletos";
      case 500:
        throw "Erro no servidor";
      default:
        print("${response.reasonPhrase} ${response.body}");
        throw "Erro não identificado";
    }
  }
}
