import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'data.db'),
        onCreate: (db, version) async {
      await db.execute('''
     CREATE TABLE forms (
       idex INTEGER PRIMARY KEY, name TEXT,  childName TEXT)
     ''');
    }, version: 1);
  }

  newPerson(addPerson) async {
    final db = await database;

    var res = await db.rawInsert('''
   INSERT INTO forms (
     index , name, childName
   ) VALUES (?,?,?)
   ''', [addPerson.index, addPerson.name, addPerson.childName]);

    return res;
  }

  Future<dynamic> getPerson() async {
    final db = await database;
    var res = await db.query("data");
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}
