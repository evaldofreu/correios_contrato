import 'package:intl/intl.dart';

import 'contrato.dart';

abstract class Objeto {
  final String cepOrigem;
  final String cepDestino;
  final Servico servico;
  final String? numeroRequisicao;
  final Contrato contrato;
  final int peso;
  final int unidades;
  final TipoObjeto tipoObjeto;
  final DateTime? dataEvento;
  final double? valor;

  final int? pesoCubico;

  Objeto(
      {required this.cepOrigem,
      required this.cepDestino,
      required this.servico,
      required this.contrato,
      required this.tipoObjeto,
      required this.unidades,
      required this.peso,
      this.valor,
      this.dataEvento,
      this.pesoCubico,
      this.numeroRequisicao});

  get servicoCodigo {
    switch (servico) {
      case Servico.sedex:
        return "03220";
      case Servico.pac:
        return "03298";
      default:
        throw "Serviço não selecionado";
    }
  }

  String toParameters() {
    return 'coProduto=$servicoCodigo&cepDestino=$cepDestino&nuRequisicao=$numeroRequisicao&nuContrato=${contrato.numeroContrato}&cepOrigem=$cepOrigem&psObjeto=$peso&nuUnidade=$unidades&tpObjeto=${tipoObjeto.index + 1}&psCubico=$pesoCubico&dtEvento=';
  }

  Map<String, dynamic> toMap() {
    var dt = DateFormat("dd-MM-y").format(dataEvento ?? DateTime.now());

    var obj = {
      "coProduto": servicoCodigo,
      "cepOrigem": cepOrigem,
      "nuRequisicao": "${numeroRequisicao ?? 0}",
      "psObjeto": "$peso",
      "dtEvento": dt,
      "dtArmazenagem": dt,
      "cepDestino": cepDestino,
    };
    if ((valor ?? 0.0) > 0.0) {
      // caso o valor for declarado deve ser informado o servi~ço adicional "Valor Declarado"
      // "019" valor declarado SEDEX / "064" PAC - segundo: https://www2.correios.com.br/sistemas/encomendas/sigepweb/doc/Manual_de_Implementacao_do_Web_Service_SIGEP_WEB.pdf - págna 44
      obj.addAll({
        "servicosAdicionais": [servico == Servico.sedex ? "019" : "064"],
        "vlDeclarado": "${valor ?? 0.0}"
      });
    }
    return obj;
  }
}

enum TipoRemessa { nacional, internacional }

enum TipoObjeto { envelope, pacote, cilindro }

enum Servico { sedex, pac }
