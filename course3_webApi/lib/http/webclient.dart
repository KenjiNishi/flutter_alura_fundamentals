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
        Contact(0, elementContact['value'], elementContact['accountNumber']),
      );
      transactions.add(transaction);
    }
    return transactions;
  } else {
    throw Exception("Error while fetching. \n ${response.body}");
  }
}
