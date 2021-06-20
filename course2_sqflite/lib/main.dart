import 'package:course2_sqflite/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  // save(Contact(0, 'name', 1323)).then((id) {
  //   findAll().then((contacts) => debugPrint(contacts.toString()));
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
