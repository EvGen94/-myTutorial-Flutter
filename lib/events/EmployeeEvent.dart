
import 'package:bloc_toturial/model/employee.dart';


enum EventType{add, delete}

class EmployeeEvent {
  Employee employee;
  int employeeIndex;
  EventType eventType;

EmployeeEvent.add(Employee employee){
  this.eventType = EventType.add;
  this.employee = employee;

}


EmployeeEvent.delete(int index){
  this.eventType = EventType.delete;
  this.employeeIndex = index;

}


}

  