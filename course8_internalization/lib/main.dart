import 'package:bytebank/components/localization.dart';
import 'package:bytebank/components/theme.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: bytebankTheme,
      home: LocalizationContainer(child: DashboardContainer()),
    );
  }
}
