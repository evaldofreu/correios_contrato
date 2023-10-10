import 'package:correios_contrato/util/convert.dart';

class Preco {
  final String coProduto;
  final double pcBase;
  final double pcBaseGeral;
  final double peVariacao;
  final double pcReferencia;
  final double vlBaseCalculoImposto;
  final String nuRequisicao;
  final bool inPesoCubico;
  final int psCobrado;
  final double peAdValorem;
  final double vlSeguroAutomatico;
  final int qtAdicional;
  final double pcFaixa;
  final double pcFaixaVariacao;
  final double pcProduto;
  final double pcFinal;
  Preco({
    required this.coProduto,
    required this.pcBase,
    required this.pcBaseGeral,
    required this.peVariacao,
    required this.pcReferencia,
    required this.vlBaseCalculoImposto,
    required this.nuRequisicao,
    required this.inPesoCubico,
    required this.psCobrado,
    required this.peAdValorem,
    required this.vlSeguroAutomatico,
    required this.qtAdicional,
    required this.pcFaixa,
    required this.pcFaixaVariacao,
    required this.pcProduto,
    required this.pcFinal,
  });

  factory Preco.fromJson(Map<String, dynamic> json) {
    return Preco(
        coProduto: json["coProduto"], // : "03220",
        pcBase: parseDouble(json["pcBase"]), // : "10,68",
        pcBaseGeral: parseDouble(json["pcBaseGeral"]), // : "11,13",
        peVariacao: parseDouble(json["peVariacao"]), // : "0,0000",
        pcReferencia: parseDouble(json["pcReferencia"]), // : "11,13",
        vlBaseCalculoImposto:
            parseDouble(json["vlBaseCalculoImposto"]), // : "11,13",
        nuRequisicao: json["nuRequisicao"], // : "0",
        inPesoCubico: json["inPesoCubico"] == "S", // : "N",
        psCobrado: int.parse(json["psCobrado"]), // : "300",
        peAdValorem: parseDouble(json["peAdValorem"]), // : "0,0100",
        vlSeguroAutomatico:
            parseDouble(json["vlSeguroAutomatico"]), // : "24,50",
        qtAdicional: int.parse(json["qtAdicional"]), // : "0",
        pcFaixa: parseDouble(json["pcFaixa"]), // : "11,13",
        pcFaixaVariacao: parseDouble(json["pcFaixaVariacao"]), // : "11,13",
        pcFinal: parseDouble(json["pcFinal"]), // : "11,13"
        pcProduto: parseDouble(json["pcProduto"])); // : "11,13",
  }
}
