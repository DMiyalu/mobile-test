import 'package:flutter/material.dart';
import 'package:mobile_test/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile-Test',
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    accentColor: Color.fromRGBO(255, 67, 100, 1),
    primaryColor: Color.fromRGBO(0, 115, 229, 1),
    primaryColorLight: Color.fromRGBO(149, 149, 149, 1),
    hintColor: Color.fromRGBO(24, 94, 118, 1),
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
        color: Colors.black.withOpacity(.8),
      ),
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        wordSpacing: 0,
      ),
    ),
  );
}