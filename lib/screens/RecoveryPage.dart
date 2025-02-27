import 'package:flutter/material.dart';
import 'package:geolocator_bar_app/widgets/appbar.dart';
import 'package:geolocator_bar_app/widgets/alerts.dart';

class RecoveryPage extends StatefulWidget {
  RecoveryPage({Key? key}) : super(key: key);

  @override
  _RecoveryPageState createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final recoveryForm = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Center(child: Column(children: [_recoveryForm(context)])),
      ),
    );
  }

  void _isValidUser(String email) {
    if (email.isNotEmpty) {
      CustomAlert().alerta(
        context,
        "Recuperación de contraseña",
        "Se ha enviado un correo a $email con las instrucciones para recuperar la contraseña.",
        '/login',
      );
    } else {
      CustomAlert().alerta(
        context,
        "Error",
        "El campo de correo no puede estar vacío.",
      );
    }
  }

  Widget _recoveryForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Correo'),
          onChanged: (value) {
            _email = value;
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _isValidUser(_email);
          },
          child: Text("Recuperar contraseña"),
        ),
      ],
    );
  }
}
