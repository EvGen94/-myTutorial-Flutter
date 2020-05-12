import 'package:flutter/material.dart';
import './EmployeeList.dart';
class EmployeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ymployee')),
      body: EmployeeList(),
      
    );
  }
}