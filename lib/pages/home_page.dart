import 'package:donut_app_2b_moheno/tabs/burger_tab.dart';
import 'package:donut_app_2b_moheno/tabs/donut_tab.dart';
import 'package:donut_app_2b_moheno/tabs/pancakes_tab.dart';
import 'package:donut_app_2b_moheno/tabs/pizza_tab.dart';
import 'package:donut_app_2b_moheno/tabs/smoothie_tab.dart';
import 'package:donut_app_2b_moheno/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ista de tabs
  List<Widget>myTabs=[
    MyTab(iconPath:'lib/icons/icons/donut.png'),
    //E:\Users\DELL\Downloads\unidad_2\donut_app_2b_Moheno\donut_app_2b_moheno\lib\icons\icons\burger.png
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
                  Text("Tengo el deseo de ingerir el sustento ", style:TextStyle(fontSize: 30)),
                  Text("vital", style:TextStyle(fontSize:32,fontWeight:FontWeight.bold,decoration:TextDecoration.underline))
                ]
              ),
            ),
            //Tab bar
            TabBar(tabs:myTabs),
            //Tabbar view (contenido de pestañas)
            Expanded(
              child: TabBarView(children: [
                DonutTab(),
                BurgerTab(),
                SmoothieTab(),
                PancakesTab(),
                PizzaTab()
              ]),
            ),
            //Carrito
      
          ],)
      ),
    );
  }
}