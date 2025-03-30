import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    //meditationapp\assets\img\login_top.png
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

                        

                        Text("¿Olvidaste tu contraseña?",
                          style: TextStyle( 
                            color:TColor.primaryText,
                            fontSize:28, 
                            fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height:15,),

                              
                              
                      
                          
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
                RoundTextField(hintText:"Nombre de usuario"),
                const SizedBox(height:35),
                RoundTextField(hintText:"Correo electronico"),
                const SizedBox(height:20),
                RoundTextField(hintText:"Contraseña",obscureText: true,),
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

                        
                      ],                   
                   ),
                ),
                
                const SizedBox(height:20),

                //BTN-Registrarme morado
                
                RoundButton( //BTN de Common wodgets, recordar importar archivo round_button.dart
                  title:"Cambiar contraseña",
                  onPressed:(){
                    context.push(const HomePage ());
                  }
                ),

                const Spacer(),
              ],
          ),
        ),
      ),
    );
  }
}