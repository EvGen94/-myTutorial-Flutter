import 'package:bloc_toturial/events/EmployeeEvent.dart';
import 'package:bloc_toturial/model/forChild.dart';
import 'package:flutter/cupertino.dart';

import './model/employee.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE1 = "employeeTab";
  static const String COLUMN_ID1 = "id";
  static const String COLUMN_NAME1 = "employeeName";
  static const String COLUMN_SURNAME1 = "employeeSurname";

  static const String TABLE2 = "kidsTab";
  static const String ID2 = "id";
  static const String NAME2 = "childName";
  static const String SURNAME2 = "childSurname";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    // print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 's2DB.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        // print("Creating food table");

        await database.execute(
          "CREATE TABLE $TABLE1 ("
          "$COLUMN_ID1 INTEGER PRIMARY KEY,"
          "$COLUMN_NAME1 TEXT"
          ")",
        );

        await database.execute(
          "CREATE TABLE $TABLE2 ("
          "$ID2 INTEGER PRIMARY KEY,"
          "$NAME2 TEXT"
          ")",
        );
      },
    );
  }

  Future<void> getData(
      {@required EventType eventType, int id}) async {
    final db = await database;

    if (eventType == EventType.add) {
      var employee = await db.query(TABLE1, columns: [
        COLUMN_ID1,
        COLUMN_NAME1,
        COLUMN_SURNAME1
      ]);

      List<Employee> employeeList = List<Employee>();

      employee.forEach((curValue) {
        print("для теста2 $curValue");
        Employee employee = Employee.fromMap(curValue);

        employeeList.add(employee);
      });

      return employeeList;
    }

    var kidTabRes = await db.query(TABLE2, columns: [
      ID2,
      NAME2,
     SURNAME2
    ]);

    print("для теста1  $kidTabRes");
    List<Child> childList = List<Child>();

    kidTabRes.forEach((curValue) {
      print("для теста2 $curValue");
      Child kid = Child.fromMap(curValue);

      childList.add(kid);
    });

    return childList;
    
  }

  Future<Employee> insertEmployee(Employee name) async {
    final db = await database;
    name.id = await db.insert(TABLE1, name.toMap());
    print("для теста insertfood $name.toMap().id");
    return name;
  }

  
  Future<Child> insertKid(Child name, int id) async {
    final db = await database;
    name.id = await db.insert(TABLE2, name.toMap());
    print("для теста insertfood $name.toMap().id");
    name.id = await db.rawInsert('''INSERT INTO $TABLE2 ($ID2, $NAME2, $SURNAME2)
    SELECT
    (SELECT $id); 
    (SELECT $name);
    (SELECT $COLUMN_SURNAME1 FROM $TABLE1 WHERE $COLUMN_ID1 = $id);
    ''');

    return name;
  }
}
/*
  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_WORK,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(Food food) async {
    final db = await database;

    return await db.update(
      TABLE_WORK,
      food.toMap(),
      where: "id = ?",
      whereArgs: [food.id],
    );
  }
}
*/
