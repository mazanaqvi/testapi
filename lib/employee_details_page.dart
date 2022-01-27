import 'package:flutter/material.dart';

import 'package:testapi/employee.dart';

class EmployeeDetails extends StatelessWidget {
  List<Employee> employee;
  int index;
  EmployeeDetails(this.employee, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Employee ID :" + employee[index].id,
                  style: TextStyle(fontSize: 28), textAlign: TextAlign.center),
              Text("Name :" + employee[index].employee_name,
                  style: TextStyle(fontSize: 28), textAlign: TextAlign.center),
              Text("Salary :" + employee[index].employee_salary,
                  style: TextStyle(fontSize: 28), textAlign: TextAlign.center),
              Text("Age :" + employee[index].employee_age,
                  style: TextStyle(fontSize: 28), textAlign: TextAlign.center),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('All Employees')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Edit Details')),
              ElevatedButton(
                  onPressed: () {
                    employee.removeAt(index);
                    Navigator.pop(context,employee);
                  },
                  child: const Text('Delete Employee')),
              Text("    ",
                  style: TextStyle(fontSize: 28), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
