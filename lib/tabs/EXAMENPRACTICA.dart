import 'package:donut_app_2b_moheno/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class Practica extends StatelessWidget {
  //const Practica({super.key});

  final List donutOnSale =[
    ["Ice Cream", "36", Colors.blue,"lib/images/images/icecream_donut.png"],
    ["Ice Cream", "36", Colors.blue,"lib/images/images/icecream_donut.png"],
    ["Nombre","Num", Colors.pink,"lib/images/images/imagenejemplo.png"]
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutOnSale.length,
      padding:EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder:(context,index){
      return DonutTile(
        donutFlavor: donutOnSale[index][0],
        donutPrice: donutOnSale[index][1],
        donutColor: donutOnSale[index][2],
        imageName: donutOnSale[index][3],
      );
    },
    );
  }
}