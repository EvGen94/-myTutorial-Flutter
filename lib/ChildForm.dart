import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import 'package:bloc_toturial/model/forChild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './ChildList.dart';
import './childScreen.dart';
import './events/EmployeeEvent.dart';

class ChildForm extends StatefulWidget {
  @override
  ChildFormState createState() => ChildFormState();
}

class ChildFormState extends State<ChildForm> {

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
            Container(
              padding: EdgeInsets.all(36),
              child: ChildList(),
            ),
          ],
        )),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () => BlocProvider.of<ChildBloc>(context).add(
              EmployeeEvent.addChild(
                Child(_childName),
              ),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'button2',
            child: Icon(Icons.navigate_next),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChildScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
