
import 'package:flutter/material.dart';

class TColor{
  static Color get primary => const Color(0xfffe6dcb); //Miros - esta nomenclatura se llama Hexadecimal (ARGB)
  static Color get secondary => const Color(0xff3F414E);//Miros - Para convertir  un Hex a ARGB solo se agrega 0xff al inicio en lugar de #
  static Color get tertiary => const Color(0xffEBEAEC);//0xffEBEAEC

  static Color get primaryText => const Color(0xff3F414E);
  static Color get primaryTextW => const Color(0xffF6F1FB);
  static Color get secondaryText => const Color(0xffA1A4B2);
  static Color get txtBG => const Color(0xffF2F3F7);
}

extension AppContext on BuildContext{

  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;

  Future push(Widget widget) async {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => widget));
  }

  void pop() async{
    return Navigator.pop(this);
  }
}

extension HexColor on Color { //Funcion para convertir hex al formato que ocupa dart (ARGB)
  static Color formHex(String hexString){
  final buffer = StringBuffer();
  if (hexString.length ==6 || hexString.length==7) buffer.write('ff');
  buffer.write(hexString.replaceFirst("#", ''));
  return Color(int.parse(buffer.toString(),radix:16));
  }
}

//C:\Users\DELL\Desktop\Miros_MeditationApp\meditationapp