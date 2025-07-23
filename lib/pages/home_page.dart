//Utilidades
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/navigate_drawer.dart';

//Tabs
import 'package:donut_app_2b_moheno/tabs/burger_tab.dart';
import 'package:donut_app_2b_moheno/tabs/donut_tab.dart';
import 'package:donut_app_2b_moheno/tabs/pancakes_tab.dart';
import 'package:donut_app_2b_moheno/tabs/pizza_tab.dart';
import 'package:donut_app_2b_moheno/tabs/smoothie_tab.dart';
import 'package:donut_app_2b_moheno/utils/my_tab.dart';

//Screens
import 'package:donut_app_2b_moheno/pages/profile_page.dart';
import 'package:donut_app_2b_moheno/pages/supermarket_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = const [
     MyTab(iconPath:'lib/icons/icons/donut.png'),
    MyTab(iconPath:'lib/icons/icons/burger.png'),
    MyTab(iconPath:'lib/icons/icons/smoothie.png'),
    MyTab(iconPath:'lib/icons/icons/pancakes.png'),
    MyTab(iconPath:'lib/icons/icons/pizza.png')
  ];

  List<Map<String, dynamic>> _cartItems = [];
  double _totalPrice = 0.0;

  // 🔧 Y también el método
  void addToCart(String name, double price) {
    setState(() {
      _cartItems.add({"name": name, "price": price});
      _totalPrice += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        
          drawer: MyDrawer(), // Usa el widget del navigate drawer
          
          appBar: AppBar(
          backgroundColor: Colors.transparent,

          //BTN-menu
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.grey[800]),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          //Fin BTN-menu
              
        ),
        // ✅ Drawer agregado
        
        
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text(
                    "I want to ",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    "Eat",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  //DonutTab(addToCart: addToCart), // Pasamos la función a DonutTab
                  DonutTab(addToCart: (name, price) => addToCart(name, price)),
                    BurgerTab(addToCart: (name, price) => addToCart(name, price)),
                    SmoothieTab(addToCart: (name, price) => addToCart(name, price)),
                    PancakesTab(addToCart: (name, price) => addToCart(name, price)),
                    PizzaTab(addToCart: (name, price) => addToCart(name, price)),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 Items | \$45',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 218, 113, 148),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12)),
                    child: const Text(
                      'View Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}