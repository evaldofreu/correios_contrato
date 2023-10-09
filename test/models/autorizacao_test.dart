import 'package:correios_contrato/models/autorizacao.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('autorizacao ...', (tester) async {
    var json = {
      "ambiente": "PRODUCAO",
      "id": "245243524352345",
      "perfil": "PJ",
      "cnpj": "245243524352345",
      "emissao": "2023-10-06T08:23:48",
      "expiraEm": "2023-10-07T08:23:48",
      "zoneOffset": "-03:00",
      "token":
          "eyJhbGciOiJSUzUxMiJ9.eyJhbWJpZW50ZSI6IlBST0RVQ0FPIiwiaWQiOiIzMTI5MjY2MzAwMDE1MCIsInBmbCI6IlBKIiwiY25waiI6IjMxMjkyNjYzMDAwMTUwIiwiaXAiOiIxNzkuMTA0LjEyMi42NCwgMTkyLjE2OC4xLjEzMSIsImlhdCI6MTY5NjU5MTQyOCwiaXNzIjoidG9rZW4tc2VydmljZSIsImV4cCI6MTY5NjY3NzgyOCwianRpIjoiZmI2NWNjNWUtZThlMi00YjdiLTgzMWYtYThmN2MwZDZlZTBiIn0.D8J_KusPNCGfvDHw7KPr6GE2PuhvdyzgcKi2wCa7SvOxaF3lURI0AQirq_1pkd6bWYwd0ic5CKcchLg70jZ8j56odbyW-aGymEwZqzcjwl2oNUYeNrMtZhhcSR-Fw1CqdII66_8IpgrDFCbPv3ZDWOVGLCFVzw_ObpCg50mE0OTtTfNajTiAcr6-BHdvCp9BTLNy7pQpJj7G1TNV6fL1AWnWSVjUzth8D92na13-nIs5jDXPWoK61fqmbiINSREIuY2SrHzFnA_WohJ31CtyruIuu0J5qTcsA2LgmIJgRyphzrRWMqRtXgGpmET-sLCZDmQFySzAV1s0Zg1k_rWMHA"
    };
    var au = Autorizacao.fromJson(json);
    print(au);
    expect(au, isA<Autorizacao>());
  });
}
