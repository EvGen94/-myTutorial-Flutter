class Child {
  String childName;
  int id;

    Child({this.childName, this.id});


/*
  Map<String, dynamic> toMap() {


    var map = <String, dynamic>{DatabaseProvider.COLUMN_NAME: name};

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }


  Employee.fromMap(Map<String, dynamic> map1) {
    id = map1[DatabaseProvider.COLUMN_ID];
    name = map1[DatabaseProvider.COLUMN_NAME];
  }*/

}/*
class Employee {
  String name;
  int id;
 
  Employee({this.name, this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{DatabaseProvider.COLUMN_NAME: name};

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  Employee.fromMap(Map<String, dynamic> map1) {
    id = map1[DatabaseProvider.COLUMN_ID];
    name = map1[DatabaseProvider.COLUMN_NAME];
  }*/
