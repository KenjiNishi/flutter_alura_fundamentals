import 'package:course2_sqflite/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full name'),
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(labelText: 'AccountNumber'),
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      final String name = _nameController.text;
                      final accNum =
                          int.tryParse(_accountNumberController.text);
                      final Contact newContact = Contact(name, accNum!);
                      Navigator.pop(context, newContact);
                    },
                    child: Text('Create')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
