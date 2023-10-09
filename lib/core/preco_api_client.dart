import 'package:correios_contrato/models/autorizacao.dart';
import 'package:correios_contrato/models/objeto.dart';
import 'package:http/http.dart' as http;

import 'package:correios_contrato/models/preco.dart';
import 'dart:convert';

class PrecoApiClient {
  Future<Preco> getPreco(
      {required Objeto objeto, required Autorizacao autorizacao}) async {
    var uri = Uri.parse(
        "https://api.correios.com.br/preco/v1/${objeto.tipoRemessa == TipoRemessa.nacional ? "nacional" : "internacional"}");

    var headers = {
      "Content-Type": "application/json",
      'accept': 'application/json',
      'Authorization': 'Bearer ${autorizacao.token}'
    };
    var json = jsonEncode(objeto.toMap());
    print(json);
    http.Response response = await http.post(uri, headers: headers, body: json);

    switch (response.statusCode) {
      case 200:
        print(response.body);
        return Preco();

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
