import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import 'package:bloc_toturial/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './EmployeeList.dart';
import './EmployeeScreen.dart';
import './events/EmployeeEvent.dart';

class EmployeeForm extends StatefulWidget {
  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  String _employeeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmployeeApp'),
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
                  _employeeName = text;
                });
              },
            ),
            Container(padding: EdgeInsets.all(10), child: EmployeeList()),
          ],
        )),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
          heroTag: 'button1',
          child: Icon(Icons.save),
          onPressed: () => BlocProvider.of<EmployeeBloc>(context).add(EmployeeEvent.add(Employee(_employeeName))),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'button2',
          child: Icon(Icons.navigate_next),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmployeeScreen(),
            ),
          ),
        ),
      ]),
    );
  }
}
