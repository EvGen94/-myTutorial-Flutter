class Child {
  String childName;

  Child(String childName) {
    this.childName = childName;
  }

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
  }

*/
}
