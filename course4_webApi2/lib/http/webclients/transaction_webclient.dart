import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 200) {}

    _throwError(response.statusCode);
    return Transaction.fromJson(jsonDecode(response.body));
  }

  void _throwError(int statusCode) {
    throw Exception(_statusCodeResponses[statusCode]);
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'There was an error while submitting the transfer!',
    401: 'Invalid password! ',
  };
}
