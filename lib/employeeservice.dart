import 'dart:convert';



import 'package:http/http.dart';

import 'employee.dart';
import 'package:http/http.dart' as http;

Future<List<Employee>> getEmployeeData() async {
  final String apiUrl = "https://gorest.co.in/public/v1/users";
  var response =
      await http.get(Uri.https("dummy.restapiexample.com", "api/v1/employees"));
  var jsondata = jsonDecode(response.body);
  var employee = jsondata["data"];

  List<Employee> employees = [];
  for (var e in employee) {
    Employee employ = Employee(
        e['id'].toString(),
        e['employee_name'].toString(),
        e['employee_salary'].toString(),
        e['employee_age'].toString(),
        e['profile_image']);
    employees.add(employ);
  }
  return employees;
}

Future<int> deleteAlbum(String id) async {
  Response res = await http
      .delete(Uri.https('jsonplaceholder.typicode.com', "/albums/1"));

  if (res.statusCode == 200) {
    print("Album deleted   "+res.statusCode.toString());
  } else {
    print("Failed to Update"+res.statusCode.toString());
  }
  return res.statusCode;
}
Future<int> updateAlbum(String id) async {
  Response res = await http
      .put(Uri.https('jsonplaceholder.typicode.com', "/albums/$id"));

  if (res.statusCode == 200) {
    print("Album Updated   "+res.statusCode.toString());
  } else {
    print("Failed to  Update"+res.statusCode.toString());
  }
  return res.statusCode;
  //Create pull request on some other branch 
  //flutter creat
  //push on new repository 
  //git checkout -b feature/add-crud-operations
  //pull request 
}
