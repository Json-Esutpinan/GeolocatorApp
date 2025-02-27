import 'package:flutter/material.dart';

class CustomAlert {
  void alerta(
    BuildContext context,
    String title,
    String content, [
    String route = '',
  ]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (route != '') {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    route,
                    (route) => false,
                  );
                }
              },
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }
}
