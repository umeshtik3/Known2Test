import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:known2test/Models/employee.dart';

import 'EmployeeDetails.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<Employee> _empList;

  List<String> _strList;

  bool _onload = true;

  @override
  void initState() {
    _empList = [];
    _strList = [];
    _fetchEmployeeList();

    super.initState();
  }

  //Fetcing Json Data from file
  Future<void> _fetchEmployeeList() async {
    final String response =
        await rootBundle.loadString('assets/employees.json');
    List<Employee> jsonString = employeeFromJson(response);
    _empList = jsonString;

    //Sorting the List
    _empList.sort((a, b) =>
        a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase()));

    //Need One more list for right Edge Column Alphabets
    _empList.forEach((element) {
      _strList.add(element.firstName);
    });
    setState(() {
      _onload = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    
    return _onload
        ? Center(child: CircularProgressIndicator())
        : Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [_alphabetList()],
            ),
          );
  }

  Widget _alphabetList() {
    return Expanded(
      child: AlphabetListScrollView(
        strList: _strList,
        showPreview: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => EmployeeDetails(
                          empImage: _empList[index].imageUrl,
                          firstName: _empList[index].firstName,
                          lstName: _empList[index].lastName,
                          age: _empList[index].age,
                          address: _empList[index].address,
                          dob: _empList[index].dob,
                          salary: _empList[index].salary,
                          email: _empList[index].email,
                        ))),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Image.network('${_empList[index].imageUrl}'),
                    ),
                    title: Text(
                        "${_empList[index].firstName} ${_empList[index].lastName}"),
                  )
                ],
              ),
            ),
          );
        },
        indexedHeight: (i) {
          return 70;
        },
      ),
    );
  }
}
