import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  //Dato dinamico
  final dynamic donutColor;
  final String imageName;

  const DonutTile({super.key, required this.donutFlavor, required this.donutPrice, this.donutColor, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[50],
          borderRadius: BorderRadius.circular(24)
        ),
      child: Column(
        children: <Widget>[
          //PriceTag
          Row(
            mainAxisAlignment: MainAxisAlignment.end,//Alinea a la derecha
            children: [
              Container(
                decoration: BoxDecoration(
                  color:donutColor[200],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24), 
                    bottomLeft: Radius.circular(24),
                    topLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    ),
                ),
                padding: 
                  const EdgeInsets.symmetric( vertical:8, horizontal: 18),
                child:Text('\$ $donutPrice', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color:donutColor[800] )), //Para poner variable poner $
              )
            ],
            ),
          //Donut picture
          Padding(
            padding: const EdgeInsets.symmetric(vertical:12, horizontal:44),
            child: Image.asset(imageName),
          ),
          //DonutText

          //Love icon +  add button


        ],
        ),
      ),
    );
  }
}