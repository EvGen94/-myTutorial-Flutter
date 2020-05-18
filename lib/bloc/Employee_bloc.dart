import 'package:bloc_toturial/model/employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/EmployeeEvent.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, List<Employee>> {
  @override
  List<Employee> get initialState => List<Employee>();

  @override
  Stream<List<Employee>> mapEventToState(EmployeeEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<Employee> newState = List.from(state);
        if (EventType != null) {
          newState.add(event.employee);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Employee> newState = List.from(state);
        newState.removeAt(event.employeeIndex);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }
}
