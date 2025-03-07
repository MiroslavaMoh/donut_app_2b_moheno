import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final String donutStore;
  //Dato dinamico
  final dynamic donutColor;
  final String imageName;

  const DonutTile({super.key, required this.donutFlavor,required this.donutPrice, this.donutColor, required this.imageName, required this.donutStore});

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
          Text(donutFlavor, 
            style: TextStyle(fontWeight: FontWeight.bold,fontSize:22, color:donutColor[600]),
          ),
          const SizedBox(height:4,),
          //TODO: Agregar texto dela tienda
          Text(donutStore, 
            style: TextStyle(fontWeight: FontWeight.bold,fontSize:15, color:donutColor[200]),
          ),
          const SizedBox(height:4,),

          //Love icon +  add button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.pink[400],
                ),
                Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ),

                ),
              ],
            ),

          ),
        ],
        
        ),
      ),
    );
  }
}