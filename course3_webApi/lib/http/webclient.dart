import 'dart:convert';

import 'package:course2_sqflite/http/logging_interceptor.dart';
import 'package:course2_sqflite/models/contact.dart';
import 'package:course2_sqflite/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_http.dart';

Future<List<Transaction>> findAll() async {
  final Uri uri = Uri.parse('http://192.168.15.6:8080/transactions');
  final Response response;
  response = await InterceptedHttp.build(interceptors: [LoggingInterceptor()])
      .get(uri)
      .timeout(Duration(seconds: 4));

  if (response.statusCode == 200) {
    List<dynamic> parsedResponse = json.decode(response.body);
    final List<Transaction> transactions = [];
    for (Map<String, dynamic> element in parsedResponse) {
      final Map<String, dynamic> elementContact = element['contact'];
      final Transaction transaction = Transaction(
        element['value'],
        Contact(0, elementContact['name'], elementContact['accountNumber']),
      );
      transactions.add(transaction);
    }
    return transactions;
  } else {
    throw Exception("Error while fetching. \n ${response.body}");
  }
}

Future<Transaction> save(Transaction transaction) async {
  final Uri uri = Uri.parse('http://192.168.15.6:8080/transactions');
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber,
    },
  };

  final Response response =
      await InterceptedHttp.build(interceptors: [LoggingInterceptor()]).post(
    uri,
    body: json.encode(transactionMap),
    headers: {
      'Content-type': 'application/json',
      'password': '1000',
    },
  );

  final Map<String, dynamic> decoded = json.decode(response.body);
  final Map<String, dynamic> elementContact = decoded['contact'];
  return Transaction(
    decoded['value'],
    Contact(
      0,
      elementContact['name'],
      elementContact['accountNumber'],
    ),
  );
}
