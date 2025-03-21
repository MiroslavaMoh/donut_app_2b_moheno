import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/utils/donut_tile.dart';

class PancakesTab extends StatelessWidget {

  final Function(String, double) addToCart; // Recibe la función desde HomePage
  PancakesTab({required this.addToCart});
  
  //lista donas
   final List donutsOnSale = [
    ["Moras","Krispy Kreme", "36", Colors.deepPurple,"lib/images/images/pancakes-1.png"],
    ["Fresas","Dunkin donuts", "45", Colors.pink,"lib/images/images/pancakes-2.png"],
    ["Chocolates","Soriana", "84", Colors.brown, "lib/images/images/pancakes-3.png"],
    ["Miel","Costco", "95", Colors.yellow,"lib/images/images/pancakes-1.png"],
    ["Moras","Krispy Kreme", "36", Colors.deepPurple,"lib/images/images/pancakes-1.png"],
    ["Fresas","Dunkin donuts", "45", Colors.pink,"lib/images/images/pancakes-2.png"],
    ["Chocolates","Soriana", "84", Colors.brown, "lib/images/images/pancakes-3.png"],
    ["Miel","Costco", "95", Colors.yellow,"lib/images/images/pancakes-1.png"],

                                    //lib\images\images\chocolate_donut.png
    
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