import 'dart:convert';

import 'package:course2_sqflite/http/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_http.dart';

void findAll() async {
  final Uri uri = Uri.parse('http://192.168.15.6:8080/transactions');
  final Response response;
  try {
    response = await InterceptedHttp.build(interceptors: [LoggingInterceptor()])
        .get(uri);
    final parsedResponse;
    if (response.statusCode == 200) {
      parsedResponse = json.decode(response.body);
      print('findAll complete: $parsedResponse');
    } else {
      throw Exception("Error while fetching. \n ${response.body}");
    }
  } catch (e) {
    print(e);
  }
}
