import 'package:course2_sqflite/models/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onTap;

  ContactItem(this.contact, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () => onTap(),
      title: Text(
        contact.name,
        style: TextStyle(fontSize: 24),
      ),
      subtitle: Text(
        contact.accountNumber.toString(),
        style: TextStyle(fontSize: 16),
      ),
    ));
  }
}
