import '../database.dart';

class Employee {
  String name;
  String surname;
  int id;
  /*Employee(String name, int id) {
    this.name = name;
    this.id = id;
  }*/
  Employee({this.name, this.surname, this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NAME1: name,
      DatabaseProvider.COLUMN_SURNAME1: surname
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID1] = id;
    }

    return map;
  }

  Employee.fromMap(Map<String, dynamic> map1) {
    id = map1[DatabaseProvider.COLUMN_ID1];
    name = map1[DatabaseProvider.COLUMN_NAME1];
    surname = map1[DatabaseProvider.COLUMN_SURNAME1];
  }
}
