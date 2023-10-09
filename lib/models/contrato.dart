// Informações do contrato do usuário com os correios
class Contrato {
  final String codigoUsuario;
  final String codigoAcesso;
  final String numeroCartao;
  final String numeroContrato;

  //Cria um novo objeto de contrato com todas as informações necessárias preenchidas:
  ///codigoUsuario - CNPJ do cliente;
  ///codigoAcesso -  Código de acesso gerado na página da API
  ///numeroContrato - Número do contrato
  ///numeroCartao - Número do cartão vinculado com o contrato.
  Contrato(
      {required this.codigoUsuario,
      required this.codigoAcesso,
      required this.numeroCartao,
      required this.numeroContrato});
}
