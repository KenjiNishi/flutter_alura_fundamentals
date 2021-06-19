import 'package:flutter/material.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      new TextEditingController();
  final TextEditingController _valueController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New transfer"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _accountNumberController,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    labelText: 'Account Number', hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _valueController,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Value to transfer',
                    hintText: '999'),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
                child: Text("Transfer!"),
                onPressed: () {
                  debugPrint("Transfer button pressed!");
                  final value = int.tryParse(_valueController.text);
                  final String account = _accountNumberController.text;
                  if (value != null) {
                    final createdTransfer = Transfer(value, account);
                    debugPrint('$createdTransfer');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$createdTransfer'),
                      ),
                    );
                  }
                }),
          ],
        ));
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfers"),
      ),
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(105, "12356")),
          TransferItem(Transfer(210, "12356")),
          TransferItem(Transfer(420, "12356")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber),
      ),
    );
  }
}

class Transfer {
  final int value;
  final String accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer{value:$value, accountNumber:$accountNumber}';
  }
}
