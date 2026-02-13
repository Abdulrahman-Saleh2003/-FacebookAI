import 'package:facebookai/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:facebookai/config/palette.dart'; // تأكد أن المسار صحيح واسم المشروع هو facebook

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: HomeScreen(), 
    );
  }
}