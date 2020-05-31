import 'package:bloc_toturial/ChildForm.dart';
import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import 'package:bloc_toturial/events/EmployeeEvent.dart';
import 'package:bloc_toturial/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './database.dart';
import './events/EmployeeSetListEvent.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
 /* void initState() {
    super.initState();
    DatabaseProvider.db.getFoods().then((valuesFromgetFoods) => {
          BlocProvider.of(context)
              .add(EmployeeEvent.addList(valuesFromgetFoods))
        });
  }*/

  Widget build(BuildContext context) {
    return Container(
       
        child: BlocConsumer<EmployeeBloc, List<Employee>>(
          /*buildWhen: (List<Employee> previous, List<Employee> current) {
        return true;
      },
      listenWhen: (List<Employee> previous, List<Employee> current) {
        if (current.length > previous.length) {
          return true;
        }
        return false;
      },*/
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
                          title: Text('${employee.name}'),
                          onTap: () =>
                              BlocProvider.of<EmployeeBloc>(context).add(
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

                /* ListTile(
                title: Text('${employee.name}'),
              );*/
              },
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Colors.black),
              itemCount: employeeList.length,
            );

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
          },
          listener: (BuildContext context, employeeList) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Added!'),
            ));
          },
        ));
  }
}
