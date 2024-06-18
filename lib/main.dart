// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mentorow_app/screens/NamePage.dart';
import 'package:mentorow_app/screens/PhoneNumber.dart';
import 'package:mentorow_app/screens/course_listscreen.dart';
import 'package:mentorow_app/screens/homepage.dart';
import 'package:mentorow_app/screens/mentorslist.dart';
import 'package:mentorow_app/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mentorow App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue
      ),
      home: const SplashScreen()
    );
  }
}
