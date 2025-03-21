import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/utils/donut_tile.dart';

class PizzaTab extends StatelessWidget {

  final Function(String, double) addToCart; // Recibe la función desde HomePage
  PizzaTab({required this.addToCart});
  
  //lista donas
  final List donutsOnSale = [
    ["Peperoni","Little Ceasar", "36", Colors.red,"lib/images/images/pizza-p.png"],
    ["Queso","Domino's", "45", Colors.yellow,"lib/images/images/pizza-h.png"],
    ["Pastor","Messinas", "84", Colors.lightGreen, "lib/images/images/pizza-t.png"],
    ["Vegetariana","Costco", "95", Colors.green,"lib/images/images/pizza-v.png"],
        ["Peperoni","Little Ceasar", "36", Colors.red,"lib/images/images/pizza-p.png"],
    ["Queso","Domino's", "45", Colors.yellow,"lib/images/images/pizza-h.png"],
    ["Pastor","Messinas", "84", Colors.lightGreen, "lib/images/images/pizza-t.png"],
    ["Vegetariana","Costco", "95", Colors.green,"lib/images/images/pizza-v.png"],

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