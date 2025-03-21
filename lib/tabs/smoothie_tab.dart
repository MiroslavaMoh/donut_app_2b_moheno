import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/utils/donut_tile.dart';

class SmoothieTab extends StatelessWidget {

    final Function(String, double) addToCart; // Recibe la función desde HomePage
  SmoothieTab({required this.addToCart});

  
  //lista donas
  final List donutsOnSale = [
    ["Papaya","Dunkin donuts", "54", Colors.deepOrange,"lib/images/images/smoothie-p.png"],
    ["Platano","Krispy Kreme", "50", Colors.yellow,"lib/images/images/smoothie-fl.png"],
    ["Moras","Soriana", "44", Colors.purple, "lib/images/images/smoothie-f.png"],
    ["Choco","Costco", "20", Colors.brown,"lib/images/images/smoothie-c.png"],
     ["Platano","Krispy Kreme", "50", Colors.yellow,"lib/images/images/smoothie-fl.png"],
    ["Papaya","Dunkin donuts", "54", Colors.deepOrange,"lib/images/images/smoothie-p.png"],
    ["Moras","Soriana", "44", Colors.purple, "lib/images/images/smoothie-f.png"],
    ["Choco","Costco", "20", Colors.brown,"lib/images/images/smoothie-c.png"],
    
  ];

  @override
  Widget build(BuildContext context) {
    //WIDGET para acomodar elementos en Cuadricula 
    return GridView.builder(
      //Parametro que muestra los elementos en nuestra lista
      itemCount:donutsOnSale.length,
      padding: EdgeInsets.all(8.0),
      //Prepa 1- Organiza cómo distribuir los elementos en una cuadricula
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //Num de columnas
        childAspectRatio: 1/1.4 //Aspect ratio-proporción-ancho/alto
      ),
    itemBuilder:(context, index){
      return DonutTile(
        donutFlavor: donutsOnSale[index][0],
        donutStore:donutsOnSale[index][1],
        donutPrice: donutsOnSale[index][2],
        donutColor: donutsOnSale[index][3],
        imageName: donutsOnSale[index][4],
        onTap: () => addToCart(donutsOnSale[index][0], double.parse(donutsOnSale[index][2])),  // Llama a addToCart
      );
    },
    );
  }
}

