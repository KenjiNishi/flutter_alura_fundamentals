import 'package:course2_sqflite/component/feature_item.dart';
import 'package:course2_sqflite/screens/contacts_list.dart';
import 'package:course2_sqflite/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FeatureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onTap: () => _navigateTo(context, ContactsList()),
                ),
                FeatureItem(
                  'Transaction Feed',
                  Icons.description,
                  onTap: () => _navigateTo(context, TransactionsList()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _navigateTo(context, Widget component) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => component));
}
