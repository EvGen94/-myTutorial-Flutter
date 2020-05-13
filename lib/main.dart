import 'package:flutter/material.dart';
import './EmployeeForm.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'EmployeeApp',
      home: EmployeeForm(),
    );
  }
}