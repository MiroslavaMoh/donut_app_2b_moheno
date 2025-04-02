
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';

//meditationapp\lib\common\color_extension.dart

class RoundTextField extends StatelessWidget {
  final String hintText; //Miros- tipo de variable - tipo de dato - nombre de variable
  final TextEditingController? controller; //miros-es una variable inmodificable una vez ingresada
  final TextInputType? keyboardType; //Miros-el ? significa que puede null la variable, puede no ser obligatoria
  final bool? obscureText;
  final Widget? right;

  const RoundTextField({super.key, required this.hintText, this.controller, this.keyboardType, this.obscureText, this.right,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:60,
      margin:const EdgeInsets.symmetric(horizontal:20),
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: TColor.txtBG,
        borderRadius: BorderRadius.circular(15)
        
        ),
        child: TextField(  
          controller: controller, //instancia que actualiza el campo 
          keyboardType:keyboardType, //Tipo de daros recibidos
          obscureText:obscureText ?? false, //Tipo Bool para esconder contraseñas, en esta caso esta desactivado
          style: TextStyle(
            color: TColor.primaryText, //Estilos del archivo color_extension.dart
            fontSize: 16
          ),
          decoration: InputDecoration( //Personalizar TextField
            contentPadding:const EdgeInsets.symmetric(horizontal: 20), //padding solo derecha e izquierda
            enabledBorder: InputBorder.none,//Sin borde
            focusedBorder: InputBorder.none,//Sin borde en activo
            hintText: hintText,//Sin placeholder-texto de pista
            suffixIcon: right,//icono a la derecha
            hintStyle: TextStyle(
              color:TColor.secondaryText, 
              fontSize: 16
              ),
          )
          ),
    );
  }
}