import 'package:donut_app_2b_moheno/tabs/burger_tab.dart';
import 'package:donut_app_2b_moheno/tabs/donut_tab.dart';
import 'package:donut_app_2b_moheno/tabs/pancakes_tab.dart';
import 'package:donut_app_2b_moheno/tabs/pizza_tab.dart';
import 'package:donut_app_2b_moheno/tabs/smoothie_tab.dart';
import 'package:donut_app_2b_moheno/utils/my_tab.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String, dynamic>> _cartItems = [];
  double _totalPrice = 0.0;

  void addToCart(String name, double price) {
    setState(() {
      _cartItems.add({"name": name, "price": price});
      _totalPrice += price;
    });
  }


  //ista de tabs
  List<Widget>myTabs=[
    MyTab(iconPath:'lib/icons/icons/donut.png'),
    MyTab(iconPath:'lib/icons/icons/burger.png'),
    MyTab(iconPath:'lib/icons/icons/smoothie.png'),
    MyTab(iconPath:'lib/icons/icons/pancakes.png'),
    MyTab(iconPath:'lib/icons/icons/pizza.png')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu,
          color: Colors.grey[800],
          ),
          //Icono derecho
          actions: [Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person),
          )],
        ),

        body: Column(
          children: [
            //Texto principal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children:[
                  Text("Tengo el deseo de ingerir  \nel sustento vital", style:TextStyle(fontSize: 28)),
                  //Text("vital", style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,decoration:TextDecoration.underline))
                ]
              ),
            ),

            
            //Tab bar
            TabBar(tabs:myTabs),
            //Tabbar view (contenido de pestañas)
            Expanded(
              child: TabBarView(children: [
                //DonutTab(addToCart: addToCart), // Pasamos la función a DonutTab
                 DonutTab(addToCart: (name, price) => addToCart(name, price)),
                  BurgerTab(addToCart: (name, price) => addToCart(name, price)),
                  SmoothieTab(addToCart: (name, price) => addToCart(name, price)),
                  PancakesTab(addToCart: (name, price) => addToCart(name, price)),
                  PizzaTab(addToCart: (name, price) => addToCart(name, price)),
              ]),
            ),
            
            
            //Carrito

          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical:18, horizontal:18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                padding: const EdgeInsets.only(left:8),
                child: Column(
                  children:[
                    Text('${_cartItems.length} Items | \$${_totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold)),             

                  Text("Delivery Chargers Included",
                  style: TextStyle(fontSize: 12),
                  ),
                  ],
                ),
                ),

                  ElevatedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColor.primary,
                    padding: const EdgeInsets.symmetric(vertical:5, horizontal:25),
                    ),
                  
                  child: const Text('View Cart',style: TextStyle(color: Colors.white))),
                

            ],),

          ),
         ],
        ),
      ),
    );
  }
}