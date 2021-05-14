import 'package:flutter/material.dart';
import 'package:known2test/Models/employee.dart';
import 'package:known2test/Screens/EmployeeList.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreen(
      seconds: 3,
      navigateAfterSeconds: EmployeeList(),
      title: Text('Welcome To Known2Test'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(fontSize: 20),
      useLoader: false,
    ));
  }
}
