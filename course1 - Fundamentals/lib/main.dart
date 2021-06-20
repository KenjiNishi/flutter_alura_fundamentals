import 'package:flutter/material.dart';
import 'package:flutter_alura_fundamentals/screens/transfer_form.dart';
import 'package:flutter_alura_fundamentals/screens/transfer_list.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alura Fundamentals',
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[420],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[600],
              textTheme: ButtonTextTheme.primary)),
      initialRoute: '/',
      routes: {
        '/': (context) => TransferList(),
        '/new': (context) => TransferForm(),
      },
    );
  }
}
