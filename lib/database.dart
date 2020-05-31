import './model/employee.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE = "food";
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 's1DB.db'),
      version: 5,
      onCreate: (Database database, int version) async {
        print("Creating food table");

        await database.execute(
          "CREATE TABLE $TABLE ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_NAME TEXT"
          ")",
        );
      },
    );
  }

  Future<List<Employee>> getFoods() async {
    final db = await database;

    var foods = await db.query(TABLE, columns: [
      COLUMN_ID,
      COLUMN_NAME,
    ]);

    //  print("для теста !!! $foods");
    List<Employee> foodList = List<Employee>();

    foods.forEach((currentFood) {
      //print("для теста $currentFood");
      Employee food = Employee.fromMap(currentFood);

      foodList.add(food);
    });

    return foodList;
  }

  Future<Employee> insert(Employee food) async {
    final db = await database;
    food.id = await db.insert(TABLE, food.toMap());
    print("для теста $food.id");
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
