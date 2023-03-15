import 'package:flutter/material.dart';
import 'package:swe250/screens/login.dart';
import 'package:swe250/screens/signup.dart';
import 'package:swe250/screens/welcome.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcome(),
    );
  }
}

