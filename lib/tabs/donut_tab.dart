import 'package:donut_app_2b_moheno/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  //const DonutTab({super.key});

  //lista donas
  final List donutsOnSale = [
    ["Ice Cream", "36", Colors.blue,"lib/images/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red,"lib/images/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/images/grape_donut.png"],
    ["Choco", "95", Colors.brown,"lib/images/images/chocolate_donut.png"]
  ];

  @override
  Widget build(BuildContext context) {
    //WIDGET para acomodar elementos en Cuadricula 
    return GridView.builder(
      //Parametro que muestra los elementos en nuestra lista
      itemCount:donutsOnSale.length,
      padding: EdgeInsets.all(8.0),
      //Prepa 1- Organiza cómo distribuir los elementos en una cuadricula
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),//Num de columnas
    itemBuilder:(context, index){
      return DonutTile(
        donutFlavor: donutsOnSale[index][0],
        donutPrice: donutsOnSale[index][1],
        donutColor: donutsOnSale[index][2],
        imageName: donutsOnSale[index][3],
      );
    },
    );
  }
}