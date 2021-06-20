import 'package:course2_sqflite/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'database.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.sqlCreateTable);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
