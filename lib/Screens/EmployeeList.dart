import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:known2test/Models/employee.dart';
import 'package:loadmore/loadmore.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<Employee> empList;

  

  List<String> strList = [];

  bool onload = true;
  int get count => empList.length;

  @override
  void initState() {
    empList = [];
    fetchEmployeeList();

    super.initState();
  }

  Future<void> fetchEmployeeList() async {
    final String response =
        await rootBundle.loadString('assets/employees.json');
    List<Employee> jsonString = employeeFromJson(response);
    empList.addAll(jsonString);
    empList.sort((a, b) =>
        a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase()));
    empList.forEach((element) {
      strList.add(element.firstName);
    });
    setState(() {
      onload = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // empList = [
    //   Employee(
    //       id: 1,
    //       firstName: 'Umesh',
    //       lastName: 'Tikhe',
    //       email: 'umeshtikhe3@gmail.com',
    //       contactNumber: '7977789735',
    //       age: 25,
    //       dob: '28-10-1996',
    //       salary: 3,
    //       address: 'panvel'),
    //   Employee(
    //       id: 1,
    //       firstName: 'Sharad',
    //       lastName: 'Gore',
    //       email: 'sharadgore21@gmail.com',
    //       contactNumber: '80974638222',
    //       age: 26,
    //       dob: '10-3-1996',
    //       salary: 10,
    //       address: 'mumbai')
    // ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      // body:
      body: onload
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: AlphabetListScrollView(
                      strList: strList,
                      showPreview: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading:
                                    Image.network('${empList[index].imageUrl}'),
                                title: Text(
                                    "${empList[index].firstName} ${empList[index].lastName}"),
                              )
                            ],
                          ),
                        );
                      },
                      indexedHeight: (i) {
                        return 80;
                      },
                    ),

                    // child: ListView.builder(
                    //   itemCount: empList.length,
                    //   itemBuilder: (_, index) {
                    //     return Card(
                    //       child: Column(
                    //         children: [
                    //           ListTile(
                    //             leading:
                    //                 Image.network('${empList[index].imageUrl}'),
                    //             title: Text(
                    //                 "${empList[index].firstName} ${empList[index].lastName}"),
                    //           )
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    fetchEmployeeList();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    empList.clear();
    fetchEmployeeList();
  }
}
