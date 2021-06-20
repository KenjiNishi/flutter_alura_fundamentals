import 'dart:convert';

import 'package:course2_sqflite/http/logging_interceptor.dart';
import 'package:course2_sqflite/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_http.dart';

class TransferWebClient {
  Future<List<Transaction>> findAll() async {
    final Uri uri = Uri.parse('http://192.168.15.6:8080/transactions');
    final Response response;
    response = await InterceptedHttp.build(interceptors: [LoggingInterceptor()])
        .get(uri)
        .timeout(Duration(seconds: 4));

    return jsonToTransactionList(response);
  }

  Future<Transaction> save(Transaction transaction) async {
    final Uri uri = Uri.parse('http://192.168.15.6:8080/transactions');
    Map<String, dynamic> transactionMap = transactionToJson(transaction);

    final Response response =
        await InterceptedHttp.build(interceptors: [LoggingInterceptor()]).post(
      uri,
      body: json.encode(transactionMap),
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
    );

    return jsonToTransaction(response);
  }
}

List<Transaction> jsonToTransactionList(Response response) {
  List<dynamic> parsedResponse = jsonDecode(response.body);
  return parsedResponse.map((dynamic jsonEntry) {
    return Transaction.fromJson(jsonEntry);
  }).toList();
}

Transaction jsonToTransaction(Response response) {
  final Map<String, dynamic> decoded = json.decode(response.body);
  return Transaction.fromJson(decoded);
}

Map<String, dynamic> transactionToJson(Transaction transaction) {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber,
    },
  };
  return transactionMap;
}
