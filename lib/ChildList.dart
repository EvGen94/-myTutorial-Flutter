import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import './model/forChild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './database.dart';
import './events/EmployeeEvent.dart';

class ChildList extends StatefulWidget {
final int idPass;

  const ChildList({Key key, this.idPass}) : super(key: key);
  @override
  

  @override
  ChildListState createState() => ChildListState();
} 

class ChildListState extends State<ChildList> {
  

@override
  void initState() {
    super.initState();
    DatabaseProvider.db.getkidsData(widget.idPass).then(
      (valuesFromgetFoods) {
        BlocProvider.of<ChildBloc>(context)
            .add(EmployeeEvent.addChildList(valuesFromgetFoods));
      },
    );
  }

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
        return true;
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