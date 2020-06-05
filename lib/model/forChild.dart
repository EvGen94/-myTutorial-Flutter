import 'package:bloc_toturial/database.dart';

class Child {
  String childName;
  String childSurname;
  int id;

  Child({this.childName, this.childSurname, this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.ID2: id,
      DatabaseProvider.NAME2: childName,
      DatabaseProvider.SURNAME2: childSurname
    };

    return map;
  }

  Child.fromMap(Map<String, dynamic> map1) {
    id = map1[DatabaseProvider.ID2];
    childName = map1[DatabaseProvider.NAME2];
    childSurname = map1[DatabaseProvider.SURNAME2];
  }
}
 