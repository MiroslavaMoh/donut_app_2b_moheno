import 'package:donut_app_2b_moheno/screen/login/verification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/round_button.dart';
import 'package:donut_app_2b_moheno/common_widget/round_text_field.dart';
import 'package:donut_app_2b_moheno/screen/login/sign_up_screen.dart';
import 'package:donut_app_2b_moheno/pages/home_page.dart';
import 'package:donut_app_2b_moheno/screen/login/forget_password_screen.dart';

//librerias de autentificacion
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';



//Inicio -  sesión por correo y contraseña
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donut App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoginScreen(),
    );
  }
}
//fin -sesion por correo y contraseña


//Cuerpo de inicio de sesión
class LoginScreen extends StatefulWidget {
  const LoginScreen ({super.key});

  @override
  State <LoginScreen> createState() =>  _LoginScreenState();

    }


//Inicio-Inicio sesion correo
    class  _LoginScreenState extends State <LoginScreen> {
      final TextEditingController _emailController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();
      bool _obscureNewPassword = true;


       Future<void> _signInWithEmailPassword() async {
          try {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );

            // Comprobar si el correo está verificado
            User? user = userCredential.user;
            if (user != null && !user.emailVerified) {
              // Si el correo no está verificado, enviamos el correo de verificación
              await user.sendEmailVerification();

              // Mostrar un mensaje que indica que se envió el correo de verificación
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Correo de verificación enviado. Por favor revisa tu bandeja de entrada.",
                ),
              ));

              // Redirigir al usuario a una página que indique que debe verificar su correo
              context.push(VerificationPage());
            } else {
              // Si el correo está verificado, redirigir al usuario a la página principal
              context.push(const HomePage());
            }
          } on FirebaseAuthException catch (e) {
            String errorMessage = "Error desconocido";
            if (e.code == 'user-not-found') {
              errorMessage = "Usuario no encontrado.";
            } else if (e.code == 'wrong-password') {
              errorMessage = "Contraseña incorrecta.";
            }
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
          }
        }
//Final-Inicio sesion correo

// Inicio - sesión por Facebook
  Future<void> _signInWithFacebook() async {
    try {
      // Crear el proveedor de autenticación de Facebook
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      // Añadir los permisos de Facebook (como el email)
      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({'display': 'popup'});

      // Realizar el inicio de sesión con popup (Web)
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(facebookProvider);

      // Verificar si el usuario es nuevo
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        print("Nuevo usuario: Redirigir a completar perfil");
      }

      // Redirigir a la página principal
      context.push(const HomePage());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al iniciar sesión con Facebook: $e")),
      );
    }
  }
  // Fin - sesión por Facebook

    //Inicio- sesión por google
    Future<void> _signInWithGoogle() async {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          return; // El usuario canceló la selección de cuenta
        }

        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Verificar si es un nuevo usuario
        if (userCredential.additionalUserInfo?.isNewUser ?? false) {
          // Puedes redirigir a completar perfil
          print("Nuevo usuario: Redirigir a completar perfil");
        }

        // Redirigir a la página principal
        context.push(const HomePage());
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al iniciar sesión con Google: $e")),
        );
      }
    }
    //fin- sesión por google

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }
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
                                },child:Image.asset(
                                  "lib/icons/icons/back.png",
                                  width:55, 
                                  height:55,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height:125,),
                        //const Spacer(), //Solo en column y row stack no 
                        //const Spacer(flex: 1), //Solo en column y row stack no 

                        Text("Bienvenido de regreso",
                          style: TextStyle( 
                            color:TColor.primaryText,
                            fontSize:28, 
                            fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height:25),

                          //Btn-Facebook
                          Padding(
                            padding:const EdgeInsets.symmetric(horizontal:20),
                              child: MaterialButton(
                                onPressed: _signInWithFacebook, // Llamamos al login de Facebook
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
                                onPressed: _signInWithGoogle, // Llamamos al método de autenticación
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
                RoundTextField(
                  hintText: "Correo electrónico",
                  controller: _emailController,
                ),

                const SizedBox(height:20),

                 RoundTextField(
                   hintText: "Contraseña",
                   obscureText: true,
                   controller: _passwordController,
                 ),
                 //const SizedBox(width: 20), 
                 const Spacer(),

                //  TextField(
                //   controller: _passwordController,
                //   obscureText: _obscureNewPassword,
                //   decoration: InputDecoration(
                //     labelText: "Nueva contraseña",
                //     suffixIcon: IconButton(
                //       icon: Icon(
                //         _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                //       ),
                //       onPressed: () {
                //         setState(() {
                //           _obscureNewPassword = !_obscureNewPassword;
                //         });
                //       },
                //     ),
                //   ),
                // ),
              


                //BTN-Registrarme morado
                RoundButton( //BTN de Common wodgets, recordar importar archivo round_button.dart
                  title:"Iniciar Sesión",
                  onPressed: _signInWithEmailPassword,
                ),

                //Texto de Iniciar sesión, dos colores 2 elementos
                 
                    TextButton(
                    onPressed: () {
                      context.push(const ForgetPasswordScreen());
                    },
                    child: Text(
                      "¿Olvidaste tu contraseña?",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  

                  
                      

                      //const Spacer(),
                      const SizedBox(width: 20,),
                          

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Crear nueva cuenta",
                          textAlign: TextAlign.center,
                          style: TextStyle( 
                            color:TColor.secondaryText,
                            fontSize:14, 
                            fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 20,),

                          //Conectar el boton para que te envie a login_screen
                          TextButton(onPressed: (){
                            context.push(const SignUpScreen());
                          },

                          //const Spacer(),
                          //const SizedBox(width: 40,),

                          child: Text(
                            "Registrate",
                            style: TextStyle( 
                            color:TColor.primary,
                            fontSize:14, 
                            fontWeight: FontWeight.w600,
                            ),
                          ),

                          ),
                        ],
                      ),

                    
                const Spacer(),
              ],
          ),
        ),
      ),
    );
  }
}