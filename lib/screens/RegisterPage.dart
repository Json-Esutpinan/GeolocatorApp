import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:geolocator_bar_app/widgets/alerts.dart';

class RegisterPage extends StatefulWidget {
  final HashMap<String, String> users;
  RegisterPage({required this.users});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  Map<String, String> users = HashMap<String, String>();

  void addUsers(String user, String password) {
    widget.users[user] = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(child: _signupForm(context)),
    );
  }

  Widget _signupForm(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Username'),
          onChanged: (value) {
            _username = value;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Password'),
          onChanged: (value) {
            _password = value;
          },
          obscureText: true,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Confirm Password'),
          onChanged: (value) {
            _confirmPassword = value;
          },
          obscureText: true,
        ),
        SizedBox(height: 20),
        _signupButton(),
      ],
    );
  }

  Widget _signupButton() {
    return ElevatedButton(
      onPressed: () {
        if (_password != '' &&
            _username != '' &&
            _password == _confirmPassword) {
          addUsers(_username, _password);
          CustomAlert().alerta(
            context,
            "Registro",
            "Usuario registrado correctamente.",
            '/login',
          );
        } else if (_password != _confirmPassword) {
          CustomAlert().alerta(
            context,
            "Alerta",
            "Las contraseñas no coinciden.",
          );
        } else {
          CustomAlert().alerta(context, "Error", "Complete todos los campos.");
        }
      },
      child: Text('Registrarse'),
    );
  }
}
