import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  final String empImage;
  final String firstName;
  final String lstName;
  final String email;
  final int age;
  final String dob;
  final double salary;
  final String address;

  EmployeeDetails(
      {Key key,
      this.empImage,
      this.firstName,
      this.lstName,
      this.email,
      this.age,
      this.dob,
      this.salary,
      this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = [
      {'Column1': 'First Name', 'Column2': '$firstName'},
      {'Column1': 'Last Name', 'Column2': '$lstName}'},
      {'Column1': 'Email', 'Column2': '$email'},
      {'Column1': 'Age', 'Column2': '$age'},
      {'Column1': 'DOB', 'Column2': '$dob'},
      {'Column1': 'Salary', 'Column2': '$salary'},
      {'Column1': 'Adddres', 'Column2': '$address'},
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Employee Details')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            child: Image.network(empImage),
          ),
          Card(
            child: DataTable(
              //dataRowHeight: 40,
              dividerThickness: 0.000002,
              headingRowHeight: 0,
              columnSpacing: 20,
              columns: [
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: data
                  .map(
                    (e) => DataRow(
                      cells: [
                        DataCell(Text(
                          "${e['Column1']}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                        DataCell(Text(
                          ":",
                        )),
                        DataCell(
                          Text(
                            e['Column2'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      )),
    );
  }
}
