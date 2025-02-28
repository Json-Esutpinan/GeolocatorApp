import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator_bar_app/screens/HomePage.dart';
import 'package:geolocator_bar_app/screens/LoginPage.dart';
import 'package:geolocator_bar_app/screens/RecoveryPage.dart';
import 'package:geolocator_bar_app/screens/RegisterPage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
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
        '/recovery': (context) => RecoveryPage(),
      },
      title: 'Geolocator Bars App',
      home: LoginPage(users: HashMap<String, String>()),
    );
  }
}
