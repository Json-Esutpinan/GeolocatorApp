import 'package:flutter/material.dart';
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
      body: SafeArea(child: Center(child: form(context))),
    );
  }

  bool isValidUser(String user, String password) {
    if (widget.users.containsKey(user) && widget.users[user] == password) {
      return true;
    }
    return false;
  }

  void redirect(bool isValid, BuildContext context) {
    if (isValid == true) {
      Navigator.pushReplacementNamed(context, '/maps');
    } else {
      alerta();
    }
  }

  void alerta() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Usuario o contraseña incorrecta."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  Widget form(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: "usuario@ejemplo.com"),
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
            bool isValid = false;
            isValid = isValidUser(_username, _password);
            redirect(isValid, context);
          },
          child: Text("Iniciar Sesión"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/register',
              arguments: widget.users,
            );
          },
          child: Text("Registrarse"),
        ),
      ],
    );
  }
}
