import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final int passMaxLenght = 4;
  final Function(String password) onConfirm;

  TransactionAuthDialog({@required this.onConfirm});

  @override
  State<StatefulWidget> createState() {
    return TransactionAuthDialogState();
  }
}

class TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: widget.passMaxLenght,
        decoration: InputDecoration(border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 64,
          letterSpacing: 32,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
