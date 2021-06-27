import 'package:bytebank/screens/dashboard/balanceCard.dart';
import 'package:bytebank/screens/deposit/form.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bytebank'),
        ),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: BalanceCard(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DepositForm();
                }));
              },
              child: Text('Receive deposit'),
            ),
          ],
        ));
  }
}
