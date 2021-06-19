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
            Editor(
              controller: _accountNumberController,
              label: "Account Number",
              hint: "00000",
            ),
            Editor(
                controller: _valueController,
                label: "Transfer Value",
                hint: "000",
                icon: Icons.monetization_on),
            ElevatedButton(
                child: Text("Transfer!"),
                onPressed: () {
                  _createTransfer(context);
                }),
          ],
        ));
  }

  void _createTransfer(context) {
    final value = int.tryParse(_valueController.text);
    final String account = _accountNumberController.text;
    if (value != null) {
      final createdTransfer = Transfer(value, account);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$createdTransfer'),
        ),
      );
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;

  Editor(
      {required this.controller,
      required this.label,
      required this.hint,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            icon: icon != null ? Icon(icon) : null),
        keyboardType: TextInputType.number,
      ),
    );
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
