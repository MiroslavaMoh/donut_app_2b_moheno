import 'package:donut_app_2b_moheno/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/round_button.dart';
import 'package:donut_app_2b_moheno/screen/login/login_screen.dart';
import 'package:donut_app_2b_moheno/screen/login/sign_up_screen.dart';
//import 'package:donut_app_2b_moheno/screen/home/welcome_screen.dart';
//meditationapp\lib\screen\login\login_screen.dart

//Página de inicio

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State <StartUpScreen> createState() =>  _StartUpScreenState();
}

class  _StartUpScreenState extends State <StartUpScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  //Inicio- Comprobar inicio de sesion
  Future<void> checkEmailVerificationStatus() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.reload();
    if (user.emailVerified) {
      // El correo ha sido verificado, puedes continuar
      context.push(const HomePage());
    } else {
      // El correo no está verificado, mantén al usuario en la pantalla de verificación
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Por favor, verifica tu correo electrónico."),
      ));
    }
  }
}

  //Fin-Comprobar inicio de sesion

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600; // si es escritorio u horizontal

        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: isWide
                  ? Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            "lib/icons/icons/startup_image.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(child: _buildStartUpContent(context)),
                      ],
                    )
                  : Column(
                      children: [
                        Image.asset(
                          "lib/icons/icons/startup_image.png",
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                        Expanded(child: _buildStartUpContent(context)),
                      ],
                    ),
            ),
          ),
        );
      },
    ),
  );
}

Widget _buildStartUpContent(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Text(
          "Somos lo que comemos",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Text(
          "Si es que deseas seguir existiendo, \ncomida deberas seguir ingiriendo",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TColor.secondaryText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 40),
        RoundButton(
          title: "Registrarme",
          onPressed: () {
            context.push(const SignUpScreen());
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¿Ya tienes una cuenta?",
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {
                context.push(const LoginScreen());
              },
              child: Text(
                "Iniciar sesión",
                style: TextStyle(
                  color: TColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

}