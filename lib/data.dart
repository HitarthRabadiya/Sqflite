import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class dbclass
{
  static Future<Database> dbcreate() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'student.db');
    print(path);

    Database database = await openDatabase(path, version: 2,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'create table register(id integer primary key,employid text,employName text,contact text,email text,designation text,salary text,field text,fav integer)');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute(
            'alter table register add column fav integer default 0'
        );
      },
    );
    return database;
  }
}
