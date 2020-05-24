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
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeBloc>(
          create: (BuildContext context) => EmployeeBloc(),
        ),
        BlocProvider<ChildBloc>(
          create: (BuildContext context) => ChildBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'EmployeeApp',
        home: EmployeeForm(),
      ),
    );
  }
}


/*
return BlocProvider<EmployeeBloc>(
      create: (context) => EmployeeBloc(),
      child: MaterialApp(
        title: 'EmployeeApp',
        home: EmployeeForm(),
      ),
    );
*/

/*

MultiBlocProvider(
  providers: [
    BlocProvider<BlocA>(
      create: (BuildContext context) => BlocA(),
    ),
    BlocProvider<BlocB>(
      create: (BuildContext context) => BlocB(),
    ),
    BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
    ),
  ],
  child: ChildA(),
)


BlocProvider<BlocA>(
  create: (BuildContext context) => BlocA(),
  child: BlocProvider<BlocB>(
    create: (BuildContext context) => BlocB(),
    child: BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
      child: ChildA(),
    )
  )
)


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

*/
