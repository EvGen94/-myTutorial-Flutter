import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import 'package:bloc_toturial/events/EmployeeEvent.dart';
import 'package:bloc_toturial/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocConsumer<EmployeeBloc, List<Employee>>(
      buildWhen: (List<Employee> previous, List<Employee> current) {
        return true;
      },
      listenWhen: (List<Employee> previous, List<Employee> current) {
        if (current.length > previous.length) {
          return true;
        }
        return false;
      },
      builder: (context, employeeList) {
        return ListView.builder(
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
                      FlatButton(onPressed: null, child: Text('Child form')),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      listener: (BuildContext context, employeeList) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Added!'),
        ));
      },
    ));
  }
}
