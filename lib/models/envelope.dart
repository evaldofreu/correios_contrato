import 'objeto.dart';

class Envelope extends Objeto {
  final int altura;
  final int largura;
  Envelope(
      {required super.cepOrigem,
      required super.cepDestino,
      required super.servico,
      required super.contrato,
      required super.unidades,
      required super.peso,
      super.numeroRequisicao,
      super.dataEvento,
      super.valor,
      required this.altura,
      required this.largura})
      : super(tipoObjeto: TipoObjeto.cilindro);

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      ...{"tpObjeto": "1", "largura": "$largura", "altura": "$altura"}
    };
  }
}
