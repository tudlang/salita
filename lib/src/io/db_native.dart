import 'db.dart';
import 'package:http/http.dart' as http;

Future<String> post({
  required String url,
  required Map<String, String> body,
}) async {
  return (await http.post(Uri.parse(url), body: body)).body;
}
