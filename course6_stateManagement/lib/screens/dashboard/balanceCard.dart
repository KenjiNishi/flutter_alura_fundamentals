import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final Balance value;
  BalanceCard(this.value);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(28),
        child: Text(
          this.value.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
