import 'package:bloc_toturial/ChildForm.dart';
import 'package:bloc_toturial/ChildList.dart';
import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import 'package:bloc_toturial/events/EmployeeEvent.dart';
import 'package:bloc_toturial/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './database.dart';


class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.getStaffData().then(
      (valuesFromgetFoods) {
        BlocProvider.of<EmployeeBloc>(context)
            .add(EmployeeEvent.addList(valuesFromgetFoods));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<EmployeeBloc, List<Employee>>(
        buildWhen: (List<Employee> previous, List<Employee> current) {
          return true;
        },
        listenWhen: (List<Employee> previous, List<Employee> current) {
          return true;
        },
        builder: (context, employeeList) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              print("foodList: $employeeList");
              Employee employee = employeeList[index];
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        title:
                            Text('${employee.name} and id is ${employee.id}'),
                        leading: Text('${employee.surname}'),
                        onTap: () => BlocProvider.of<EmployeeBloc>(context).add(
                              EmployeeEvent.delete(index),
                            )),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChildForm(idPass: employee.id),
                              ),
                            );
                          },
                          child: Text('Child form'),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChildList(idPass: employee.id),
                              ),
                            );
                          },
                          child: Text('see child list'),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: employeeList.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(color: Colors.black),
          );
        },
        listener: (BuildContext context, employeeList) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Added!'),
          ));
        },
      ),
    );
  }
}

/*builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          itemCount: employeeList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile( 
                      title: Text(employeeList[index].name),
                      onTap: () => BlocProvider.of<EmployeeBloc>(context).add(
                            EmployeeEvent.delete(index),
                          )),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChildForm(),
                                ),
                              ),
                          child: Text('Child form')),
                    ],
                  ),
                ],
              ),
            );
          },
        );*/
