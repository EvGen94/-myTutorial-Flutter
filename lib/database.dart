import './model/employee.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE1 = "employeeTab";
  static const String TABLE2 = "kidsTab";
  static const String COLUMN_ID1 = "id";
  static const String COLUMN_NAME1 = "name";
   static const String COLUMN_ID2 = "id";
  static const String COLUMN_NAME2 = "childName";

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
          "$COLUMN_ID2 INTEGER PRIMARY KEY,"
          "$COLUMN_NAME2 TEXT"
          ")",
        );
      },
    );
  }

  Future<List<Employee>> getFoods(int flag) async {
    final db = await database;
    if{flag = 1} 
    var foods = await db.query(TABLE1, columns: [
      COLUMN_ID1,
      COLUMN_NAME1,
    ]);

    print("для теста1  $foods");
    List<Employee> foodList = List<Employee>();

    foods.forEach((currentFood) {
      print("для теста2 $currentFood");
      Employee food = Employee.fromMap(currentFood);

      foodList.add(food);
    });

    return foodList;
  }

  Future<Employee> insert(Employee food) async {
    final db = await database;
    food.id = await db.insert(TABLE, food.toMap());
    print("для теста insertfood $food.toMap().id");
    return food;
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
