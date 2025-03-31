import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verificación de Correo")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Se ha enviado un correo de verificación a tu dirección de correo electrónico. "
              "Por favor, revisa tu bandeja de entrada y sigue las instrucciones para verificar tu cuenta.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Comprobar si el correo electrónico ha sido verificado
                User? user = FirebaseAuth.instance.currentUser;
                await user?.reload(); // Recargar la información del usuario
                if (user != null && user.emailVerified) {
                  // Si el correo está verificado, redirigir a la página principal
                  context.push(const HomePage());
                } else {
                  // Si el correo no está verificado, mostrar mensaje de espera
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Por favor verifica tu correo antes de continuar."),
                  ));
                }
              },
              child: Text("Verificar Correo"),
            ),
          ],
        ),
      ),
    );
  }
}
