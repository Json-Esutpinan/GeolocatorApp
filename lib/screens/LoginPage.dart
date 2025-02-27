import 'package:flutter/material.dart';
import 'package:geolocator_bar_app/widgets/alerts.dart';
import 'package:geolocator_bar_app/widgets/appbar.dart';
import 'dart:collection';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  HashMap<String, String> users = HashMap<String, String>();
  LoginPage({super.key, required this.users});

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final loginForm = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    widget.users['jeison@poligran.edu.co'] = 'password1';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              _loginForm(context),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("Registrarse"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _isValidUser(String user, String password) {
    if (widget.users.containsKey(user) && widget.users[user] == password) {
      Navigator.pushNamedAndRemoveUntil(context, '/maps', (route) => false);
    } else {
      CustomAlert().alerta(
        context,
        "Error",
        "Usuario o contraseña incorrecta.",
      );
    }
  }

  Widget _loginForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Usuario",
            hintText: "usuario@ejemplo.com",
          ),
          onChanged: (value) {
            _username = value;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: "Contraseña"),
          onChanged: (value) {
            _password = value;
          },
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _isValidUser(_username, _password);
          },
          child: Text("Iniciar Sesión"),
        ),
      ],
    );
  }
}
