import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/round_button.dart';
import 'package:donut_app_2b_moheno/common_widget/round_text_field.dart';
import 'package:donut_app_2b_moheno/pages/home_page.dart';

//Librerias de firebase para autentificación
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

//Página de inicio


//Inicio - Registro facebook
    class AuthService {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      Future<UserCredential?> signInWithFacebook() async {
        try {
          final LoginResult result = await FacebookAuth.instance.login();

          if (result.accessToken != null) {
              final AccessToken accessToken = result.accessToken!;
              final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);


              return await _auth.signInWithCredential(credential);
            } else {
              print("Error: No se obtuvo el token de acceso de Facebook.");
              return null;
            }
        } catch (e) {
          print("Error durante la autenticación con Facebook: $e");
          return null;
        }
      }
    }


//Fin - Registro facebook


class SignUpScreen extends StatefulWidget {
  const SignUpScreen ({super.key});

  @override
  State <SignUpScreen> createState() =>  _SignUpScreenState();
}

class  _SignUpScreenState extends State <SignUpScreen> {

  bool isTrue = false; //Checkbox de privadidad falso por default

  //inicio - Variables para autentificación de usuario por contraseña
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  // fin - Variables para autentificación de usuario por contraseña



  //Inicio - Registro por correo electronico

   Future<void> _registerUser() async {
    try {
      // Obtiene los valores de los campos
      String email = _emailController.text;
      String password = _passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        // Validar si los campos están vacíos
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Por favor, ingresa un correo y una contraseña")),
        );
        return;
      }

      // Registrar al usuario con Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Si el registro es exitoso, redirige al HomePage
      if (userCredential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Usuario registrado exitosamente")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } catch (e) {
      print(e); // En caso de error, muestra el mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al registrar el usuario: $e")),
      );
    }
  }
  //Fin - Registro por correo electronico


  //Inicio - Registro por Google android
 Future<UserCredential?> signInWithGoogle() async {
  try {
    // Configuración manual del Client ID (sólo si es necesario)
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: '822034519769-122hsatfo97mhccrcfnbj0rg7dpo9h0n.apps.googleusercontent.com', // Copia tu Client ID desde Google Cloud
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print("Error en Google Sign-In: $e");
    return null;
  }
}
  //Fin - Registro por Google android

// Inicio - Google registro web
// Para web, inicializar el GoogleSignIn con el paquete web
// GoogleSignIn? _googleSignIn;

// Future<UserCredential?> signInWithGoogle() async {
//   try {
//     // Verifica si está en la web
//     if (kIsWeb) {
//       // Si es web, se inicializa el GoogleSignIn Web
//       _googleSignIn = GoogleSignIn(
//         clientId: 'tu-client-id.apps.googleusercontent.com', // Usa el Client ID para web
//       );
//     } else {
//       // Si no es web (Android/iOS), usa la configuración predeterminada
//       _googleSignIn = GoogleSignIn();
//     }

//     final GoogleSignInAccount? googleUser = await _googleSignIn!.signIn();
//     if (googleUser == null) return null;

//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   } catch (e) {
//     print("Error en Google Sign-In: $e");
//     return null;
//   }
// }
//Fin -Google registro web

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SizedBox (
          height: context.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //Imagen decorativa principal
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset( //Imagen principal
                    "lib/icons/icons/login_top.png",
                    
                    width: double.maxFinite, //Maximo de su contenedor padre
                    fit: BoxFit.fitWidth, //Maximo de su contenedor padre
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              InkWell(onTap:(){
                                context.pop(); //Regresar al pag anterior
                                  },
                                    child:Image.asset(
                                      "lib/icons/icons/back.png",
                                      width:55, 
                                      height:55,
                                ),
                              
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height:25,),

                        Text("Crea tu cuenta",
                          style: TextStyle( 
                            color:TColor.primaryText,
                            fontSize:28, 
                            fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height:25,),

                          //Btn-Facebook
                          Padding(
                            padding:const EdgeInsets.symmetric(horizontal:20),
                              child: MaterialButton(
                                //Inicio - Llamada a funcion
                                  onPressed: () async {
                                      final authService = AuthService();
                                      UserCredential? userCredential = await authService.signInWithFacebook();

                                      if (userCredential != null) {
                                          print("Inicio de sesión con Facebook exitoso: ${userCredential.user?.email}");
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                                        } else {
                                          print("Error en el inicio de sesión con Facebook");
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text("Error al iniciar sesión con Facebook")),
                                          );
                                      }
                                    },
                                    

                                //Fin - Llamada a funcion
                                minWidth: double.maxFinite,
                                elevation: 0,
                                color: const Color(0xfffe6dcb),
                                height: 60,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 15,),
                                    Image.asset('lib/icons/icons/fb.png',width:25, height: 25,),//NO PONER / AL INICIO
                                  const Expanded(
                                    child: Text(
                                      "Continuar con facebook",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                    
                                      ),
                                    ),
                                  ),
                                   const SizedBox(width: 40,),
                                  ],
                                ),

                              
                              ),
                      
                          ),

                          const SizedBox(height:25,),

                          //Btn- Google
                          Padding(
                            padding:const EdgeInsets.symmetric(horizontal:20),
                              child: MaterialButton(
                                
                                //Inicio -Llamar funcion para registrar cuenta en google
                                    onPressed: () async {
                                        UserCredential? userCredential = await signInWithGoogle();
                                        if (userCredential != null) {
                                          // Navega a la pantalla principal si la autenticación fue exitosa
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const HomePage()),
                                          );
                                        } else {
                                          // Muestra un mensaje de error si falló
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text("Error al iniciar sesión con Google")),
                                          );
                                        }
                                    },

                                //fin- Funciones para registrar cuenta en google

                                minWidth: double.maxFinite,
                                elevation: 0,
                                color: Colors.white,
                                height: 60,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: TColor. tertiary, width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 15,),
                                    Image.asset('lib/icons/icons/google.png',width:25, height: 25,),//NO PONER / AL INICIO
                                  Expanded(
                                    child: Text(
                                      "Continuar con Google",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                    
                                      ),
                                    ),
                                  ),
                                   const SizedBox(width: 40,),
                                  ],
                                ),

                              
                              ),
                      
                          ),
                      ],
                    ),
                ],
              ),

                const SizedBox(height:35),
                Text("O inicia sesión con tu correo eléctronico",
                      textAlign: TextAlign.center,
                      style: TextStyle( 
                        color:TColor.secondaryText,
                        fontSize:14, 
                        fontWeight: FontWeight.w700,
                        ),
                      ),

                const SizedBox(height:35),
                RoundTextField(controller: _usernameController, hintText:"Nombre de usuario"),
                const SizedBox(height:35),
                RoundTextField(controller: _emailController,hintText:"Correo electronico"),
                const SizedBox(height:20),
                RoundTextField(controller: _passwordController,hintText:"Contraseña",obscureText: true,),
                const SizedBox(height:20),

                //Row con texto de privacidad y checkbox
                Padding(
                   padding:const EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                      children: [
                        Text( //Texto normal
                          "He leido el",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            ),
                          ),

                         Text(//"Vinculo" morado
                          " aviso de privacidad",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            ),
                          ),
                        
                        const Spacer(), //Espacio para mandar el check box al final

                        //Checkbox de aviso de privacidad
                        IconButton(onPressed: (){
                          setState((){
                            isTrue =!isTrue;//Cambia de estado al ser presionado
                          });
                        },
                        icon: Icon(//Icono de checkbox
                        isTrue
                            ? Icons.check_box//Icono de checkbox
                            : Icons.check_box_outline_blank_rounded,//Icono de checkbox True
                        color: isTrue ? TColor.primary : TColor.secondaryText,//Cambio de color según etsado
                        ),
                        ),
                      ],                   
                   ),
                ),
                
                const SizedBox(height:20),

                //BTN-Registrarme morado
                
                RoundButton( //BTN de Common wodgets, recordar importar archivo round_button.dart
                  title:"Registrarme",
                  onPressed: _registerUser, // Llamamos al método para registrar
                    ),
                const Spacer(),
              ],
          ),
        ),
      ),
    );
  }
}