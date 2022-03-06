// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:receipt_api/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white
          )
        )
      ),
      home: HomePage(),
    );
  }
}
