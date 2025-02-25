import 'package:flutter/material.dart';
import 'dart:collection';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: Column(
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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Confirm Password'),
              onChanged: (value) {
                _confirmPassword = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_password == _confirmPassword) {
                  addUsers(_username, _password);
                  Navigator.pushReplacementNamed(context, '/login');
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Las contraseñas no coinciden.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cerrar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Registrarse!'),
            ),
          ],
        ),
      ),
    );
  }

  void addUsers(String user, String password) {
    widget.users[user] = password;
  }
}
