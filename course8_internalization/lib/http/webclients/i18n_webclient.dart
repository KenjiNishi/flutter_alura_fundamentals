import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

String messagesUrl(String viewKey) => 'http://localhost:8002/$viewKey.json';

class I18NWebClient {
  final String viewKey;
  I18NWebClient(this.viewKey);

  Future<Map<String, dynamic>> findAll() async {
    final Response response =
        await client.get(Uri.tryParse(messagesUrl(viewKey)));
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}
