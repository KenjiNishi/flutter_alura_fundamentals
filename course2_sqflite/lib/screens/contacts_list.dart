import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
              child: ListTile(
            title: Text(
              'PERSON',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: Text(
              'VALUE',
              style: TextStyle(fontSize: 16),
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
