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
      image: Image.network(
          'https://www.replas.com.au/wp-content/uploads/youtube.gif'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 200.0,
      useLoader: false,
      //loaderColor: Colors.red
    ));
  }
}
