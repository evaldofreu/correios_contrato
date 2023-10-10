import 'objeto.dart';

class Cilindro extends Objeto {
  final int diametro;
  final int comprimento;

  Cilindro(this.diametro, this.comprimento,
      {required super.cepOrigem,
      required super.cepDestino,
      required super.servico,
      required super.contrato,
      required super.unidades,
      required super.peso})
      : super(tipoObjeto: TipoObjeto.cilindro);

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      ...{
        "tpObjeto": "3",
        "comprimento": "$comprimento",
        "diametro": "$diametro"
      }
    };
  }
}
