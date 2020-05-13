import 'package:flutter/material.dart';
import './EmployeeList.dart';
import './EmployeeScreen.dart';

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
            heroTag: 'button1', child: Icon(Icons.save), onPressed: () => {}),
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
