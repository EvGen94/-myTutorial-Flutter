import 'package:bloc_toturial/bloc/Employee_bloc.dart';
import 'package:bloc_toturial/bloc/Employee_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './EmployeeForm.dart';

void main() {
  BlocSupervisor.delegate =
      EmployeeDelegate(); // to print all staff EmployeeDelegate
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmployeeBloc>(
      create: (context) => EmployeeBloc(),
      child: MaterialApp(
        title: 'EmployeeApp',
        home: EmployeeForm(),
      ),
    );
  }
}
