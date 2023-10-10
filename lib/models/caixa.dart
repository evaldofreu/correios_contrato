import 'objeto.dart';

class Caixa extends Objeto {
  Caixa({
    required super.cepOrigem,
    required super.cepDestino,
    required super.servico,
    required super.contrato,
    required super.unidades,
    required super.peso,
    super.numeroRequisicao,
    required this.comprimento,
    required this.largura,
    required this.altura,
  }) : super(tipoObjeto: TipoObjeto.pacote);

  final int comprimento;
  final int largura;
  final int altura;

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      ...{
        "tpObjeto": "2",
        "comprimento": "$comprimento",
        "largura": "$largura",
        "altura": "$altura"
      }
    };
  }
}
