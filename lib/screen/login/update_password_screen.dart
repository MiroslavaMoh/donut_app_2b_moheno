import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/round_button.dart';
import 'package:donut_app_2b_moheno/common_widget/round_text_field.dart';
import 'package:donut_app_2b_moheno/pages/home_page.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Función para cambiar la contraseña
  Future<void> _updatePassword() async {
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    // Validar que las contraseñas coincidan
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Las contraseñas no pueden estar vacías."),
      ));
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Las contraseñas no coinciden."),
      ));
      return;
    }

    // Intentar actualizar la contraseña
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Contraseña actualizada correctamente."),
        ));
        // Redirigir al HomePage después de cambiar la contraseña
        context.push(const HomePage());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Usuario no encontrado. Intenta nuevamente."),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error al cambiar la contraseña: $e"),
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
                        "Actualizar contraseña",
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
                "Ingresa tu nueva contraseña",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 35),
              RoundTextField(
                hintText: "Nueva contraseña",
                controller: _newPasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              RoundTextField(
                hintText: "Confirmar contraseña",
                controller: _confirmPasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              RoundButton(
                title: "Actualizar contraseña",
                onPressed: _updatePassword,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
