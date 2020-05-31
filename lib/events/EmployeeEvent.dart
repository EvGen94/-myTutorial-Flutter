import 'package:bloc_toturial/model/employee.dart';
import 'package:bloc_toturial/model/forChild.dart';

enum EventType { add, addChild, delete, addList }

class EmployeeEvent {
  Employee employee;
  Child childName;
  int employeeIndex;
  EventType eventType;
  List<Employee> employeeList;

  EmployeeEvent.add(Employee employee) {
    this.eventType = EventType.add;
    this.employee = employee;
  }

  EmployeeEvent.addList(List<Employee> employee) {
    employeeList = employee;
  }

  EmployeeEvent.addChild(Child childName) {
    this.eventType = EventType.addChild;
    this.childName = childName;
  }

  EmployeeEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.employeeIndex = index;
  }
}
