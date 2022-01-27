import 'package:flutter/material.dart';
import 'package:testapi/employee.dart';
import 'package:testapi/employee_details_page.dart';
import 'employeeservice.dart';

void main() {
  runApp(MyApp());
}

class Testapi extends StatefulWidget {
  const Testapi({Key? key}) : super(key: key);

  @override
  _TestapiState createState() => _TestapiState();
}

class _TestapiState extends State<Testapi> {
  late Future<List<Employee>> empfuture;
  @override
  void initState() {
    super.initState();
    empfuture = _getemployees();
  }

  Future<List<Employee>> _getemployees() async {
    return await getEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Employee",
          ),
        ),
        body: Container(
          child: FutureBuilder<List<Employee>>(
            future: empfuture,
            builder: (context, AsyncSnapshot<List<Employee>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                //hasdata
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                case ConnectionState.done:
                  List<Employee> emplist = snapshot.data ?? [];
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: emplist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Future<List<Employee>> temp =
                                  _navigateAndDisplaySelection(
                                      context, emplist, index);
                             deleteAlbum("1");
                            },
                            title: Text(emplist[index].employee_name),
                          ),
                        );
                      });

                default:
                  return Text("Done");
              }
            },
          ),
        ));
  }
}

Future<List<Employee>> _navigateAndDisplaySelection(
    BuildContext context, List<Employee> emplist, int index) async {
  // Navigator.push returns a Future that completes after calling
  // Navigator.pop on the Selection Screen.
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EmployeeDetails(emplist, index)),
  );
  List<Employee> list = result;
  return list;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Testapi());
  }
}
