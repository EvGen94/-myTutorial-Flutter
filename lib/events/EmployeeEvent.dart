import 'package:bloc_toturial/model/employee.dart';
import 'package:bloc_toturial/model/forChild.dart';

enum EventType { add, addChild, delete, addList ,addChildList  }

class EmployeeEvent {
  Employee employee;
  Child childName;
  int employeeIndex;
  EventType eventType;
  List<Employee> employeeList;
  List<Child> childList;

  EmployeeEvent.add(Employee employee) {
    this.eventType = EventType.add;
    this.employee = employee;
  }

  EmployeeEvent.addList(List<Employee> employee) {
    this.eventType = EventType.addList;
    this.employeeList = employee;
  }

  EmployeeEvent.addChild(Child childName) {
    this.eventType = EventType.addChild;
    this.childName = childName;
  }

  EmployeeEvent.addChildList(List<Child> childList) {
    this.eventType = EventType.addChildList;
    this.childList = childList;
  }

  EmployeeEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.employeeIndex = index;
  }

}
