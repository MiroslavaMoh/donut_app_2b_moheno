import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/round_button.dart';
import 'package:donut_app_2b_moheno/common_widget/round_text_field.dart';
import 'package:donut_app_2b_moheno/pages/home_page.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  // Función para enviar correo de recuperación
  Future<void> _sendPasswordResetEmail() async {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Por favor ingresa un correo electrónico."),
      ));
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Correo de recuperación enviado a $email"),
      ));
      // Redirigir a la página de login o cualquier otra pantalla
      context.push(const HomePage());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "lib/icons/icons/login_top.png",
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: Image.asset(
                                "lib/icons/icons/back.png",
                                width: 55,
                                height: 55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Text(
                "Ingresa tu correo electrónico para recuperar la contraseña",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 35),
              RoundTextField(
                hintText: "Correo electrónico",
                controller: _emailController,
              ),
              const SizedBox(height: 100),
              //const Spacer(),
              RoundButton(
                title: "Enviar correo de recuperación",
                onPressed: _sendPasswordResetEmail,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
