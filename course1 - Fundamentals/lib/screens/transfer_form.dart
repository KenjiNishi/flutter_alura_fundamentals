import 'package:flutter/material.dart';
import 'package:flutter_alura_fundamentals/components/editor.dart';
import 'package:flutter_alura_fundamentals/models/transfer.dart';

final _title = "New transfer";
final _labelAccountNumber = "Account Number";
final _tipAccountNumber = "0000";
final _labelValue = "Transfer Value";
final _tipValue = "00.00";
final _labelButton = "DO IT";

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
      new TextEditingController();
  final TextEditingController _valueController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _accountNumberController,
                label: _labelAccountNumber,
                hint: _tipAccountNumber,
              ),
              Editor(
                  controller: _valueController,
                  label: _labelValue,
                  hint: _tipValue,
                  icon: Icons.monetization_on),
              ElevatedButton(
                  child: Text(_labelButton),
                  onPressed: () {
                    _createTransfer(context);
                  }),
            ],
          ),
        ));
  }

  void _createTransfer(BuildContext context) {
    final value = double.tryParse(_valueController.text);
    final String account = _accountNumberController.text;
    if (value != null) {
      final createdTransfer = Transfer(value, account);
      Navigator.pop(context, createdTransfer);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Created transfer: $createdTransfer'),
        ),
      );
    }
  }
}
