import 'package:course2_sqflite/database/app_database.dart';
import 'package:course2_sqflite/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const String sqlCreateTable = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  // Returns created id
  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    return db.insert(_tableName, contactToMap(contact));
  }

//Without async/await
  Future<List<Contact>> findAll() {
    return getDatabase().then((db) {
      return db.query(_tableName).then((maps) {
        return mapsToList(maps);
      });
    });
  }

  Future<int> update(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = contactToMap(contact);
    return db.update(
      _tableName,
      contactMap,
      where: '$_id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }

  List<Contact> mapsToList(List<Map<String, dynamic>> maps) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> map in maps) {
      final Contact contact = mapToContact(map);
      contacts.add(contact);
    }
    return contacts;
  }

// Translates Contact to Map
  Map<String, dynamic> contactToMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

// Translates Map to Contact
  Contact mapToContact(Map<String, dynamic> map) {
    return Contact(
      map[_id],
      map[_name],
      map[_accountNumber],
    );
  }
}
