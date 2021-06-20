import 'package:course2_sqflite/component/contact_item.dart';
import 'package:course2_sqflite/component/loading_component.dart';
import 'package:course2_sqflite/dao/contact_dao.dart';
import 'package:course2_sqflite/models/contact.dart';
import 'package:course2_sqflite/screens/contacts_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactsListState();
  }
}

class ContactsListState extends State<ContactsList> {
  final ContactDao contactDao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        //future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        future: contactDao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return LoadingComponent();
            case ConnectionState.active:
              // To work with STREAMS
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data as List<Contact>;

              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return ContactItem(contact);
                },
                itemCount: contacts.length,
              );
          }
          return Text('Unknown error while listing contacts...');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
