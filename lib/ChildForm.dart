import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import 'package:bloc_toturial/model/employee.dart';
import 'package:bloc_toturial/model/forChild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './ChildList.dart';
import './childScreen.dart';
import './events/EmployeeEvent.dart';
import 'database.dart';

class ChildForm extends StatefulWidget {
  final int idPass;

  const ChildForm({Key key, this.idPass}) : super(key: key);
  @override
  ChildFormState createState() => ChildFormState();
}

class ChildFormState extends State<ChildForm> {
  String _childName;
  //String _childSurname;

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
            SizedBox(
              height: 10,
            ),
            /*TextField(
              decoration: InputDecoration(labelText: 'Surname'),
              style: TextStyle(fontSize: 22),
              onChanged: (text) {
                setState(() {
                  _childSurname = text;
                });
              },
            ),*/
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
            onPressed: () {
              Child name = Child(
                childName: _childName,
                //  childSurname: _childSurname,
                //id: _id widget.idPass
              );
              print("idpass is ${widget.idPass}");
              DatabaseProvider.db.insertKid(name, widget.idPass).then((value) =>
                  BlocProvider.of<ChildBloc>(context)
                      .add(EmployeeEvent.addChild(value)));
            },
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
