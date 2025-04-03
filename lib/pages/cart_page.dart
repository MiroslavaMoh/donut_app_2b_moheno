import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common_widget/navigate_drawer.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Champiñones",
      "price": 136,
      "quantity": 1,
      "image": "lib/images/images/burger-1.png",
    },
    {
      "name": "Ice Cream",
      "price": 36,
      "quantity": 2,
      "image": "lib/images/images/icecream_donut.png",
    },
    {
      "name": "Papaya",
      "price": 56,
      "quantity": 1,
      "image": "lib/images/images/smoothie-p.png",
    },
  ];

  double getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.grey[800]),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
                "Tu carrito",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(item['image'], height: 60),
                      title: Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("Precio: \$${item['price'].toStringAsFixed(2)}\nCantidad: ${item['quantity']}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: TColor.primary),
                        onPressed: () => removeItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Total: \$${getTotalPrice().toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primary,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text("Proceder al Pago", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}