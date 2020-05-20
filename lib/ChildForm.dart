import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import 'package:bloc_toturial/model/employee.dart';
import 'package:bloc_toturial/model/forChild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './EmployeeList.dart';
import './EmployeeScreen.dart';
import './events/EmployeeEvent.dart';

class ChildForm extends StatefulWidget {
  @override
  ChildFormState createState() => ChildFormState();
}

class ChildFormState extends State<ChildForm> {
  @override
  String _childName;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChildForm'),
      ),
      body: Container(
        padding: EdgeInsets.all(36),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'App text',
              style: TextStyle(fontSize: 42),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              style: TextStyle(fontSize: 22),
              onChanged: (text) {
                setState(() {
                  _childName = text;
                });
              },
            ),
            FloatingActionButton(
              onPressed: () => BlocProvider.of<ChildBloc>(context).add(
                EmployeeEvent.addChild(
                  Child(_childName),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
