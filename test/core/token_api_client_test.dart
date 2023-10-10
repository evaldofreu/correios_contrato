import 'package:correios_contrato/core/token_api_client.dart';
import 'package:correios_contrato/models/contrato.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('token api client: autorização ...', (tester) async {
    var mclient = MockClient((request) => Future.value(Response(
        r'{"ambiente":"PRODUCAO","id":"31292663000150","ip":"177.106.108.181, 192.168.1.132","perfil":"PJ","cnpj":"31292663000150","cartaoPostagem":{"numero":"0077997824","contrato":"9912624384","dr":74,"api":[27,34,35,36,37,41,76,78,80,83,87,93,566,587]},"api":[87,504,518,564,575,587],"emissao":"2023-10-09T15:45:41","expiraEm":"2023-10-10T15:45:41","zoneOffset":"-03:00","token":"eyJhbGciOiJSUzUxMiJ9.eyJhbWJpZW50ZSI6IlBST0RVQ0FPIiwiaWQiOiIzMTI5MjY2MzAwMDE1MCIsInBmbCI6IlBKIiwiY25waiI6IjMxMjkyNjYzMDAwMTUwIiwiYXBpIjpbODcsNTA0LDUxOCw1NjQsNTc1LDU4N10sImNhcnRhby1wb3N0YWdlbSI6eyJudW1lcm8iOiIwMDc3OTk3ODI0IiwiY29udHJhdG8iOiI5OTEyNjI0Mzg0IiwiZHIiOjc0LCJhcGkiOlsyNywzNCwzNSwzNiwzNyw0MSw3Niw3OCw4MCw4Myw4Nyw5Myw1NjYsNTg3XX0sImlwIjoiMTc3LjEwNi4xMDguMTgxLCAxOTIuMTY4LjEuMTMyIiwiaWF0IjoxNjk2ODc3MTQxLCJpc3MiOiJ0b2tlbi1zZXJ2aWNlIiwiZXhwIjoxNjk2OTYzNTQxLCJqdGkiOiJlZmViMGRhOC0xYzJmLTQ3YTUtYjlkZS1jOGM0OWVmMDE0NGQifQ.kSdaW7j80gFf8zU8t72qB8IoCkWpN1zdofrZj4C32aGmgOIH2HBbJUlPkXnd5GcY3LLuwZDwLUnGJpbUQsHwyfhohZylcbcffxbSrunmXFAZGq-bab2XuNF69zGyGCH-o_u-IHBik1Glden7dSyLZ5aCV1m_HsYuIjlfRr7j9LASs1mBrd7-aNb-8aNEhOidlzTxTzoCDYBHgDVR1e0PNk9qPUPsaG2ybUYktqA1DyIzFaroIfBF9j4Gh0jVOq4mGfSncPgCxM6b7dM1SB0YxCF-Y0wOwhJstwiXOY7ZPKLsyG9kqCRZGlimi4l88nPe-PqxJrofexcnO2VFXsroRg"}',
        201)));
    var contrato = Contrato(
        codigoAcesso: "ADFADFASD",
        codigoUsuario: "24524352345",
        numeroCartao: "2452345",
        numeroContrato: "2452345243");
    TokenAPIClient auth =
        TokenAPIClient(contrato: contrato, httpClient: mclient);
    var autorizacao = await auth.autorizar();
    expect(autorizacao.isAutorizado(), true);
  });
}
