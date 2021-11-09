import 'package:flutter/material.dart';
import 'package:mobile_test/router.dart';
import 'package:mobile_test/screens/home/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mobile-Test',
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      getPages: getPages(),
      initialRoute: '/',
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    accentColor: Color.fromRGBO(255, 67, 100, 1),
    primaryColor: Color.fromRGBO(0, 115, 229, 1),
    primaryColorLight: Color.fromRGBO(149, 149, 149, 1),
    hintColor: Color.fromRGBO(0, 74, 101, 1),
    splashColor: Colors.blueGrey.shade100.withOpacity(.1),
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      button: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(149, 149, 149, 1),
      ),
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(149, 149, 149, 1),
        wordSpacing: 0,
      ),
    ),
  );
}