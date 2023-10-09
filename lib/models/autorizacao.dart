class Autorizacao {
  final String ambiente;
  final String id;
  final String ip;
  final String perfil;
  final String cnpj;
  final DateTime emissao;
  final DateTime expiraEm;
  final String zoneOffset;
  final String token;

  Autorizacao(
      {required this.ambiente,
      required this.id,
      required this.ip,
      required this.perfil,
      required this.cnpj,
      required this.emissao,
      required this.expiraEm,
      required this.zoneOffset,
      required this.token});

  factory Autorizacao.fromJson(Map<String, dynamic> json) {
    return Autorizacao(
      ambiente: json["ambiente"] ?? "",
      id: json["id"] ?? "",
      ip: json["ip"] ?? "",
      perfil: json["perfil"] ?? "",
      cnpj: json["cnpj"] ?? "",
      emissao: DateTime.parse(json["emissao"] ?? ""),
      expiraEm: DateTime.parse(json["expiraEm"] ?? ""),
      zoneOffset: json["zoneOffset"] ?? "",
      token: json["token"] ?? "",
    );
  }

  ///Verifica se a autorização já foi realizada e se ainda é válida.
  bool isAutorizado() {
    return expiraEm.isAfter(DateTime.now());
  }

  @override
  String toString() {
    return "ambiente:$ambiente\nid:$id\nip:$ip\nperfil:$perfil\ncnpj:$cnpj\nemissao:$emissao\nexpiraEm:$expiraEm\nzoneOffset:$zoneOffset\ntoken:$token\n";
  }
}
