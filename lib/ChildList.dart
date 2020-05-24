import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import './model/forChild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildList extends StatefulWidget {
  @override
  ChildListState createState() => ChildListState();
} 

class ChildListState extends State<ChildList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocConsumer<ChildBloc, List<Child>>(
      buildWhen: (List<Child> previous, List<Child> current) {
        return true;
      },
      listenWhen: (List<Child> previous, List<Child> current) {
        if (current.length > previous.length) {
          return true;
        }
        return false;
      },
      builder: (context, childList) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          itemCount: childList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      title: Text(childList[index].childName),
                      onTap: () => {} //BlocProvider.of<ChildBloc>(context).add(
                      //   EmployeeEvent.delete(index),
                      //   )),
                      ),
                ],
              ),
            );
          },
        );
      },
      listener: (BuildContext context, childList) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Added2!'),
        ));
      },
    ));
  }
}