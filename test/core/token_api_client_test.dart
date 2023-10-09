import 'package:correios_contrato/core/token_api_client.dart';
import 'package:correios_contrato/models/contrato.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  LiveTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('token api client: autorização ...', (tester) async {
    var contrato = Contrato(
        codigoAcesso: "",
        codigoUsuario: "",
        numeroCartao: "",
        numeroContrato: "");
    TokenAPIClient auth = await TokenAPIClient(contrato: contrato);
    await auth.autorizar();
    //expect(auth.isAutorizado(), true);
  });
}
