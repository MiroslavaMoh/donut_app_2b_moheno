import 'package:flutter/material.dart';
 
 class CartPage extends StatelessWidget {
  
   final List<Map<String, dynamic>> cartItems;
   CartPage({required this.cartItems});
 
   @override
   Widget build(BuildContext context) {
     double total = cartItems.fold(0, (sum, item) => sum + item['price']);
 
     return Scaffold(
       appBar: AppBar(
         title: Text("Your Cart"),
       ),
       body: Column(
         children: [
           Expanded(
             child: ListView.builder(
               itemCount: cartItems.length,
               itemBuilder: (context, index) {
                 return ListTile(
                   title: Text(cartItems[index]['name']),
                   subtitle: Text("\$${cartItems[index]['price']}"),
                 );
               },
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Text("Total: \$${total.toStringAsFixed(2)}",
                 style: TextStyle(fontSize: 24)),
           ),
         ],
       ),
     );
   }
 }