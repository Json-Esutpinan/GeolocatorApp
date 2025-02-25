import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator_bar_app/screens/HomePage.dart';
import 'package:geolocator_bar_app/screens/login_page.dart';
import 'package:geolocator_bar_app/screens/RegisterPage.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  HashMap<String, String> users = HashMap<String, String>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/maps': (context) => HomePage(),
        '/login': (context) => LoginPage(users: users),
        '/register': (context) => RegisterPage(users: users),
      },
      title: 'Geolocator Bars App',
      home: LoginPage(users: HashMap<String, String>()),
    );
  }
}
