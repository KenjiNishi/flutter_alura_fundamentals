import 'package:course2_sqflite/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'database.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('CREATE TABLE contacts('
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'account_number INTEGER)');
      },
      version: 1,
    );
  });
}

// Returns created id
Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    return db.insert('contacts', contactToMap(contact));
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact contact = mapToContact(map);
        contacts.add(contact);
      }
      return contacts;
    });
  });
}

// Translates Contact to Map
Map<String, dynamic> contactToMap(Contact contact) {
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return contactMap;
}

// Translates Map to Contact
Contact mapToContact(Map<String, dynamic> map) {
  return Contact(
    map['id'],
    map['name'],
    map['account_number'],
  );
}
